# Baseline measurements

The two files here are the evidence behind the design decision stated in
[`../../README.md`](../../README.md) and [`../RESULTS.md`](../RESULTS.md): that
similarity search was dropped for essential knowledge because it was measured and
found insufficient, not because it was assumed to be.

| file | what it records |
|---|---|
| `retrieval_sweep.json` | The embedding-retrieval sweep. The source of the claim that the critical permutation document was retrieved in **0 of 7** queries, and that 2 of 5 retrieved slots went to a gate with no hardware and to a file the assembler then discarded. |
| `preregistration.json` | The evaluation criteria, fixed **before** the runs. |

The pre-registration matters more than its size suggests: it fixes what would count as
success before any result was seen, which is what separates a measured comparison from
one tuned after the fact.

The code that produced these was an embedding-retrieval arm over a document corpus. It
has been removed, along with the gate-library and conventions documents it indexed,
because nothing on the current path uses them — the system does no similarity search,
and the family context is injected in full. The numbers are kept; the superseded
implementation is not. It remains recoverable from this repository's history.
