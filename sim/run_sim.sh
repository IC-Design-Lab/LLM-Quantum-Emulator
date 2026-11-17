#!/usr/bin/env bash
#==============================================================================
# run_sim.sh  --  Icarus Verilog verification driver (macOS / Linux)
#
# Usage:
#   ./run_sim.sh <design.v|.sv> <library.sv|-> <testbench.v> [top_tb_module] [label]
#
# Examples:
#   # thin generated design + external flat library:
#   ./run_sim.sh Circuit0_06.v gate_library_flat.sv tb_Circuit0_06.v tb_Circuit0_06
#   # self-contained ground_truth design (defines all modules itself) -> use '-':
#   ./run_sim.sh ../ground_truth/Circuit0_2.sv - ../testbenches/tb_Circuit0_2.v tb_Circuit0_2
#   # per-source label so waveforms don't collide (claude vs chatgpt vs gemini):
#   ./run_sim.sh ../generated/gemini/Circuit0_3.sv ../gate_library/gate_library_flat_0_3.sv \
#                ../testbenches/tb_Circuit0_3.v tb_Circuit0_3 gemini
#   #   -> waveform saved as results/transcripts/Circuit0_3_gemini.vcd
#   # If [label] is omitted it is auto-derived from the design's parent folder
#   # (generated/claude -> claude, generated/chatgpt -> chatgpt, ground_truth -> ground).
#
# What it does:
#   1. Copies inputs to a scratch build/ dir (never edits your originals)
#   2. Normalizes CRLF -> LF  (CIRCT files ship with Windows line endings)
#   3. Strips SystemVerilog 'automatic' lifetime keyword iverilog can't parse
#   4. Hoists the in-block 'logic [23:0] _GEN = {8'h0, io_a};' to a module
#      -scope wire (iverilog mis-evaluates block-local statics -> X output)
#   5. Compiles with -g2012, runs with vvp, prints PASS/FAIL + writes .vcd
#==============================================================================
set -euo pipefail

DESIGN="${1:?need design file}"
LIBRARY="${2:?need library file (use - for self-contained designs)}"
TB="${3:?need testbench file}"
TOP="${4:-}"
LABEL="${5:-}"   # optional source tag (claude/chatgpt/gemini); auto-derived if empty

# Auto-derive the source label from the design's parent folder when not given.
if [ -z "$LABEL" ]; then
  LABEL="$(basename "$(dirname "$DESIGN")")"
  [ "$LABEL" = "ground_truth" ] && LABEL="ground"
fi

BUILD=build
mkdir -p "$BUILD"

normalize () {  # $1 = src path -> echoes scratch path
  local base; base="$(basename "$1")"
  local dst="$BUILD/$base"
  # CRLF -> LF
  tr -d '\r' < "$1" > "$dst"
  # strip 'automatic ' (randomize blocks, loop vars, _GEN decl)
  sed -i.bak 's/automatic //g' "$dst" && rm -f "$dst.bak"
  echo "$dst"
}

D="$(normalize "$DESIGN")"
# Library is optional: '-' / 'none' / '' means the design is self-contained.
if [ "$LIBRARY" = "-" ] || [ "$LIBRARY" = "none" ] || [ -z "$LIBRARY" ]; then
  L=""
else
  L="$(normalize "$LIBRARY")"
fi
T="$(normalize "$TB")"

# Hoist _GEN in any file that has the SplitMultiplier block-local decl.
hoist_gen () {  # $1 = file
  if grep -q 'logic \[23:0\] _GEN = {8.h0, io_a};' "$1"; then
    # remove the in-block decl line
    sed -i.bak '/logic \[23:0\] _GEN = {8.h0, io_a};/d' "$1" && rm -f "$1.bak"
    # add a module-scope wire just before the first partials_0 reg
    perl -0pi -e 's/(\n)(\s*reg \[31:0\] partials_0;)/$1  wire [23:0] _GEN = {8\x27h0, io_a};\n$2/' "$1"
  fi
}
hoist_gen "$D"; [ -n "$L" ] && hoist_gen "$L"; hoist_gen "$T"

# auto-detect top tb module if not given
if [ -z "$TOP" ]; then
  TOP="$(grep -oE '^module [A-Za-z0-9_]+' "$T" | head -1 | awk '{print $2}')"
fi

echo "== compile =="
# Remove any prior binary first, so a failed compile can't silently run a stale one.
rm -f "$BUILD/sim.vvp"
# $L is intentionally unquoted so an empty library expands to nothing.
iverilog -g2012 -s "$TOP" -o "$BUILD/sim.vvp" "$D" $L "$T" 2> "$BUILD/compile.log" || true
grep -v 'warning:' "$BUILD/compile.log" || true
if [ ! -f "$BUILD/sim.vvp" ]; then
  echo "== COMPILE FAILED: no binary produced — aborting (not running a stale build) =="
  exit 1
fi

# Determine THIS run's VCD name from the testbench's $dumpfile(...) — so we only
# touch the waveform this run actually produced, never the whole accumulated pile.
VCD_NAME="$(grep -oE '\$dumpfile *\( *"[^"]+"' "$T" | head -1 | sed -E 's/.*"([^"]+)".*/\1/')"
VCD_NAME="$(basename "${VCD_NAME:-}")"
# Tagged, identifiable output name: CircuitX_<label>.vcd (e.g. Circuit0_3_gemini.vcd).
OUT_VCD=""
[ -n "$VCD_NAME" ] && OUT_VCD="${VCD_NAME%.vcd}_${LABEL}.vcd"

# Remove a stale copy of just this run's VCD so we can't mistake it for fresh.
[ -n "$VCD_NAME" ] && rm -f "$VCD_NAME" "$BUILD/$OUT_VCD"

echo "== run =="
vvp "$BUILD/sim.vvp" 2>&1 | grep -v 'warning:'

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$REPO_ROOT/results/transcripts"

echo "== done =="
echo "   source label      : $LABEL"
echo "   scratch artifacts : $BUILD/"
if [ -n "$VCD_NAME" ] && [ -f "$VCD_NAME" ]; then
  # vvp writes the VCD into the current dir as $VCD_NAME; rename it to the tagged name
  # so per-source waveforms never overwrite each other.
  mv -f "$VCD_NAME" "$BUILD/$OUT_VCD"
  cp -f "$BUILD/$OUT_VCD" "$REPO_ROOT/results/transcripts/$OUT_VCD"
  echo "   waveform          : $REPO_ROOT/results/transcripts/$OUT_VCD"
  echo "   open with         : surfer $REPO_ROOT/results/transcripts/$OUT_VCD"
else
  echo "   waveform          : (none produced this run)"
fi
