/* GENERAL */

// Enables the given input field
function enableField(input) {
  input.readOnly = false;
  input.className = "f01";
  input.value = "";
}

// Enables or disables input according to the value of the thesaurus field
function toggleEnable(field, input) {
  if (field == "title" || field == "regnumber") {
    input.readOnly = false;
    input.className = "f01";
    input.value = "";
  } else {
    input.readOnly = true;
    input.className = "f01 s01";
    input.value = "Filled from Thesaurus";
  }
}

function toggleEnableKey(field, input) {
  if (field == "key") {
    input.readOnly = true;
    input.className = "f01 s01";
    input.value = "Filled from Thesaurus";
  }
}

// Open thesaurus window
// May need to set the window size depending on the thesaurus?
function openThesaurus(termNum, field) {
  if (field == "") {
    return;
  }

  var start = "A";

  if (field == "country" || field == "key" || field == "opus") {
    start = "";
  }

  var xsize = 450,
    ysize = 500;
  var file =
    "display-thesaurus.html?fieldTxt=" +
    field +
    "&startTxt=" +
    start +
    "&termNumTxt=" +
    termNum;

  switch (termNum) {
    case 1:
      document.frmSearch.field1Txt.value = "";
      document.frmSearch.thesaurus1Txt.value = "";
      break;

    case 2:
      document.frmSearch.field2Txt.value = "";
      document.frmSearch.thesaurus2Txt.value = "";
      break;

    case 3:
      document.frmSearch.field3Txt.value = "";
      document.frmSearch.thesaurus3Txt.value = "";
      break;
  }

  // don’t display thesaurus for title or regnumber
  if (field == "title" || field == "regnumber") {
    return;
  }

  msgWindow = open(
    file,
    "thesaurusWindow",
    "resizable=yes,width=" + xsize + ",height=" + ysize
  );

  if (msgWindow.opener == null) {
    msgWindow.opener = self;
  }
}

// Needs a parameter to add the value to the correct term field
// Need to be able to add multiple selections
function addTerms(termNum) {
  var start = document.frmThesaurus.thesaurusSel.selectedIndex;
  var end = document.frmThesaurus.thesaurusSel.length;
  var termObj = new Object();
  var thesObj = new Object();
  var termvalue, theskey;

  switch (termNum) {
    case 1:
      termObj = window.opener.document.frmSearch.field1Txt;
      thesObj = window.opener.document.frmSearch.thesaurus1Txt;
      break;

    case 2:
      termObj = window.opener.document.frmSearch.field2Txt;
      thesObj = window.opener.document.frmSearch.thesaurus2Txt;
      break;

    case 3:
      termObj = window.opener.document.frmSearch.field3Txt;
      thesObj = window.opener.document.frmSearch.thesaurus3Txt;
      break;
  }

  for (var i = start; i < end; i++) {
    if (document.frmThesaurus.thesaurusSel.options[i].selected) {
      termvalue = document.frmThesaurus.thesaurusSel.options[i].text;
      termObj.value = termObj.value + termvalue + " ";
      termObj.readOnly = true;
      termObj.className = "f01 s01";

      theskey = document.frmThesaurus.thesaurusSel.options[i].value;
      thesObj.value = thesObj.value + " " + theskey;
    }
  }
}
