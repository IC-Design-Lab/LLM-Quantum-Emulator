// Paste this into the target Google Sheet's Extensions -> Apps Script editor,
// replacing the existing code. Then Deploy -> Manage deployments -> edit (pencil)
// the existing deployment -> Version: New version -> Deploy. The /exec URL stays
// the same, so sheets_webhook_url.txt does NOT need to change.
//
// Schema update (2026-07-04): error_category (single value) replaced with
// failure_stage (compile/functional, auto-derived) + error_types (';'-separated
// list, hand-tagged). Update the sheet's header row to match:
//   run_id | circuit | model | prompt_variant | input_format | pass_fail | failure_stage | error_types | notes
//
// Schema update (2026-07-11): added an "update" action alongside the default
// "append" so a run already in the sheet can be corrected (e.g. error_types
// filled in after manual review) without creating a duplicate row. Posting
// {action:"update", run_id, error_types, notes} finds the row whose column A
// matches run_id and overwrites just column H (error_types) and/or column I
// (notes) -- whichever fields are present in the payload. Omitting "action"
// (or any value other than "update") keeps the original append behavior, so
// log_run.ps1 needs no changes.
//
// This is NOT executed from this machine -- it's Google-hosted code that
// runs when log_run.ps1 (or a manual tagging call) POSTs to the deployed URL.

var COL_RUN_ID = 1;       // column A
var COL_ERROR_TYPES = 8;  // column H
var COL_NOTES = 9;        // column I

function doPost(e) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var data = JSON.parse(e.postData.contents);

  if (data.action === "update") {
    return handleUpdate_(sheet, data);
  }

  sheet.appendRow([
    data.run_id,
    data.circuit,
    data.model,
    data.prompt_variant,
    data.input_format,
    data.pass_fail,
    data.failure_stage,
    data.error_types,
    data.notes
  ]);
  return jsonOutput_({ status: "ok" });
}

function handleUpdate_(sheet, data) {
  var runIds = sheet.getRange(1, COL_RUN_ID, sheet.getLastRow(), 1).getValues();
  for (var i = 0; i < runIds.length; i++) {
    if (runIds[i][0] === data.run_id) {
      var row = i + 1;
      if (data.error_types !== undefined) {
        sheet.getRange(row, COL_ERROR_TYPES).setValue(data.error_types);
      }
      if (data.notes !== undefined) {
        sheet.getRange(row, COL_NOTES).setValue(data.notes);
      }
      return jsonOutput_({ status: "ok", updated_row: row });
    }
  }
  return jsonOutput_({ status: "error", message: "run_id not found: " + data.run_id });
}

function jsonOutput_(obj) {
  return ContentService
    .createTextOutput(JSON.stringify(obj))
    .setMimeType(ContentService.MimeType.JSON);
}
