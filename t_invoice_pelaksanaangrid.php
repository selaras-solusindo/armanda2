<?php include_once "t_userinfo.php" ?>
<?php

// Create page object
if (!isset($t_invoice_pelaksanaan_grid)) $t_invoice_pelaksanaan_grid = new ct_invoice_pelaksanaan_grid();

// Page init
$t_invoice_pelaksanaan_grid->Page_Init();

// Page main
$t_invoice_pelaksanaan_grid->Page_Main();

// Global Page Rendering event (in userfn*.php)
Page_Rendering();

// Page Rendering event
$t_invoice_pelaksanaan_grid->Page_Render();
?>
<?php if ($t_invoice_pelaksanaan->Export == "") { ?>
<script type="text/javascript">

// Form object
var ft_invoice_pelaksanaangrid = new ew_Form("ft_invoice_pelaksanaangrid", "grid");
ft_invoice_pelaksanaangrid.FormKeyCountName = '<?php echo $t_invoice_pelaksanaan_grid->FormKeyCountName ?>';

// Validate form
ft_invoice_pelaksanaangrid.Validate = function() {
	if (!this.ValidateRequired)
		return true; // Ignore validation
	var $ = jQuery, fobj = this.GetForm(), $fobj = $(fobj);
	if ($fobj.find("#a_confirm").val() == "F")
		return true;
	var elm, felm, uelm, addcnt = 0;
	var $k = $fobj.find("#" + this.FormKeyCountName); // Get key_count
	var rowcnt = ($k[0]) ? parseInt($k.val(), 10) : 1;
	var startcnt = (rowcnt == 0) ? 0 : 1; // Check rowcnt == 0 => Inline-Add
	var gridinsert = $fobj.find("#a_list").val() == "gridinsert";
	for (var i = startcnt; i <= rowcnt; i++) {
		var infix = ($k[0]) ? String(i) : "";
		$fobj.data("rowindex", infix);
		var checkrow = (gridinsert) ? !this.EmptyRow(infix) : true;
		if (checkrow) {
			addcnt++;
			elm = this.GetElements("x" + infix + "_tanggal");
			if (elm && !ew_IsHidden(elm) && !ew_HasValue(elm))
				return this.OnError(elm, "<?php echo ew_JsEncode2(str_replace("%s", $t_invoice_pelaksanaan->tanggal->FldCaption(), $t_invoice_pelaksanaan->tanggal->ReqErrMsg)) ?>");
			elm = this.GetElements("x" + infix + "_tanggal");
			if (elm && !ew_CheckEuroDate(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t_invoice_pelaksanaan->tanggal->FldErrMsg()) ?>");

			// Fire Form_CustomValidate event
			if (!this.Form_CustomValidate(fobj))
				return false;
		} // End Grid Add checking
	}
	return true;
}

// Check empty row
ft_invoice_pelaksanaangrid.EmptyRow = function(infix) {
	var fobj = this.Form;
	if (ew_ValueChanged(fobj, infix, "tanggal", false)) return false;
	return true;
}

// Form_CustomValidate event
ft_invoice_pelaksanaangrid.Form_CustomValidate = 
 function(fobj) { // DO NOT CHANGE THIS LINE!

 	// Your custom validation code here, return false if invalid. 
 	return true;
 }

// Use JavaScript validation or not
<?php if (EW_CLIENT_VALIDATE) { ?>
ft_invoice_pelaksanaangrid.ValidateRequired = true;
<?php } else { ?>
ft_invoice_pelaksanaangrid.ValidateRequired = false; 
<?php } ?>

// Dynamic selection lists
// Form object for search

</script>
<?php } ?>
<?php
if ($t_invoice_pelaksanaan->CurrentAction == "gridadd") {
	if ($t_invoice_pelaksanaan->CurrentMode == "copy") {
		$bSelectLimit = $t_invoice_pelaksanaan_grid->UseSelectLimit;
		if ($bSelectLimit) {
			$t_invoice_pelaksanaan_grid->TotalRecs = $t_invoice_pelaksanaan->SelectRecordCount();
			$t_invoice_pelaksanaan_grid->Recordset = $t_invoice_pelaksanaan_grid->LoadRecordset($t_invoice_pelaksanaan_grid->StartRec-1, $t_invoice_pelaksanaan_grid->DisplayRecs);
		} else {
			if ($t_invoice_pelaksanaan_grid->Recordset = $t_invoice_pelaksanaan_grid->LoadRecordset())
				$t_invoice_pelaksanaan_grid->TotalRecs = $t_invoice_pelaksanaan_grid->Recordset->RecordCount();
		}
		$t_invoice_pelaksanaan_grid->StartRec = 1;
		$t_invoice_pelaksanaan_grid->DisplayRecs = $t_invoice_pelaksanaan_grid->TotalRecs;
	} else {
		$t_invoice_pelaksanaan->CurrentFilter = "0=1";
		$t_invoice_pelaksanaan_grid->StartRec = 1;
		$t_invoice_pelaksanaan_grid->DisplayRecs = $t_invoice_pelaksanaan->GridAddRowCount;
	}
	$t_invoice_pelaksanaan_grid->TotalRecs = $t_invoice_pelaksanaan_grid->DisplayRecs;
	$t_invoice_pelaksanaan_grid->StopRec = $t_invoice_pelaksanaan_grid->DisplayRecs;
} else {
	$bSelectLimit = $t_invoice_pelaksanaan_grid->UseSelectLimit;
	if ($bSelectLimit) {
		if ($t_invoice_pelaksanaan_grid->TotalRecs <= 0)
			$t_invoice_pelaksanaan_grid->TotalRecs = $t_invoice_pelaksanaan->SelectRecordCount();
	} else {
		if (!$t_invoice_pelaksanaan_grid->Recordset && ($t_invoice_pelaksanaan_grid->Recordset = $t_invoice_pelaksanaan_grid->LoadRecordset()))
			$t_invoice_pelaksanaan_grid->TotalRecs = $t_invoice_pelaksanaan_grid->Recordset->RecordCount();
	}
	$t_invoice_pelaksanaan_grid->StartRec = 1;
	$t_invoice_pelaksanaan_grid->DisplayRecs = $t_invoice_pelaksanaan_grid->TotalRecs; // Display all records
	if ($bSelectLimit)
		$t_invoice_pelaksanaan_grid->Recordset = $t_invoice_pelaksanaan_grid->LoadRecordset($t_invoice_pelaksanaan_grid->StartRec-1, $t_invoice_pelaksanaan_grid->DisplayRecs);

	// Set no record found message
	if ($t_invoice_pelaksanaan->CurrentAction == "" && $t_invoice_pelaksanaan_grid->TotalRecs == 0) {
		if (!$Security->CanList())
			$t_invoice_pelaksanaan_grid->setWarningMessage(ew_DeniedMsg());
		if ($t_invoice_pelaksanaan_grid->SearchWhere == "0=101")
			$t_invoice_pelaksanaan_grid->setWarningMessage($Language->Phrase("EnterSearchCriteria"));
		else
			$t_invoice_pelaksanaan_grid->setWarningMessage($Language->Phrase("NoRecord"));
	}
}
$t_invoice_pelaksanaan_grid->RenderOtherOptions();
?>
<?php $t_invoice_pelaksanaan_grid->ShowPageHeader(); ?>
<?php
$t_invoice_pelaksanaan_grid->ShowMessage();
?>
<?php if ($t_invoice_pelaksanaan_grid->TotalRecs > 0 || $t_invoice_pelaksanaan->CurrentAction <> "") { ?>
<div class="panel panel-default ewGrid t_invoice_pelaksanaan">
<div id="ft_invoice_pelaksanaangrid" class="ewForm form-inline">
<div id="gmp_t_invoice_pelaksanaan" class="<?php if (ew_IsResponsiveLayout()) { echo "table-responsive "; } ?>ewGridMiddlePanel">
<table id="tbl_t_invoice_pelaksanaangrid" class="table ewTable">
<?php echo $t_invoice_pelaksanaan->TableCustomInnerHtml ?>
<thead><!-- Table header -->
	<tr class="ewTableHeader">
<?php

// Header row
$t_invoice_pelaksanaan_grid->RowType = EW_ROWTYPE_HEADER;

// Render list options
$t_invoice_pelaksanaan_grid->RenderListOptions();

// Render list options (header, left)
$t_invoice_pelaksanaan_grid->ListOptions->Render("header", "left");
?>
<?php if ($t_invoice_pelaksanaan->tanggal->Visible) { // tanggal ?>
	<?php if ($t_invoice_pelaksanaan->SortUrl($t_invoice_pelaksanaan->tanggal) == "") { ?>
		<th data-name="tanggal"><div id="elh_t_invoice_pelaksanaan_tanggal" class="t_invoice_pelaksanaan_tanggal"><div class="ewTableHeaderCaption"><?php echo $t_invoice_pelaksanaan->tanggal->FldCaption() ?></div></div></th>
	<?php } else { ?>
		<th data-name="tanggal"><div><div id="elh_t_invoice_pelaksanaan_tanggal" class="t_invoice_pelaksanaan_tanggal">
			<div class="ewTableHeaderBtn"><span class="ewTableHeaderCaption"><?php echo $t_invoice_pelaksanaan->tanggal->FldCaption() ?></span><span class="ewTableHeaderSort"><?php if ($t_invoice_pelaksanaan->tanggal->getSort() == "ASC") { ?><span class="caret ewSortUp"></span><?php } elseif ($t_invoice_pelaksanaan->tanggal->getSort() == "DESC") { ?><span class="caret"></span><?php } ?></span></div>
        </div></div></th>
	<?php } ?>
<?php } ?>		
<?php

// Render list options (header, right)
$t_invoice_pelaksanaan_grid->ListOptions->Render("header", "right");
?>
	</tr>
</thead>
<tbody>
<?php
$t_invoice_pelaksanaan_grid->StartRec = 1;
$t_invoice_pelaksanaan_grid->StopRec = $t_invoice_pelaksanaan_grid->TotalRecs; // Show all records

// Restore number of post back records
if ($objForm) {
	$objForm->Index = -1;
	if ($objForm->HasValue($t_invoice_pelaksanaan_grid->FormKeyCountName) && ($t_invoice_pelaksanaan->CurrentAction == "gridadd" || $t_invoice_pelaksanaan->CurrentAction == "gridedit" || $t_invoice_pelaksanaan->CurrentAction == "F")) {
		$t_invoice_pelaksanaan_grid->KeyCount = $objForm->GetValue($t_invoice_pelaksanaan_grid->FormKeyCountName);
		$t_invoice_pelaksanaan_grid->StopRec = $t_invoice_pelaksanaan_grid->StartRec + $t_invoice_pelaksanaan_grid->KeyCount - 1;
	}
}
$t_invoice_pelaksanaan_grid->RecCnt = $t_invoice_pelaksanaan_grid->StartRec - 1;
if ($t_invoice_pelaksanaan_grid->Recordset && !$t_invoice_pelaksanaan_grid->Recordset->EOF) {
	$t_invoice_pelaksanaan_grid->Recordset->MoveFirst();
	$bSelectLimit = $t_invoice_pelaksanaan_grid->UseSelectLimit;
	if (!$bSelectLimit && $t_invoice_pelaksanaan_grid->StartRec > 1)
		$t_invoice_pelaksanaan_grid->Recordset->Move($t_invoice_pelaksanaan_grid->StartRec - 1);
} elseif (!$t_invoice_pelaksanaan->AllowAddDeleteRow && $t_invoice_pelaksanaan_grid->StopRec == 0) {
	$t_invoice_pelaksanaan_grid->StopRec = $t_invoice_pelaksanaan->GridAddRowCount;
}

// Initialize aggregate
$t_invoice_pelaksanaan->RowType = EW_ROWTYPE_AGGREGATEINIT;
$t_invoice_pelaksanaan->ResetAttrs();
$t_invoice_pelaksanaan_grid->RenderRow();
if ($t_invoice_pelaksanaan->CurrentAction == "gridadd")
	$t_invoice_pelaksanaan_grid->RowIndex = 0;
if ($t_invoice_pelaksanaan->CurrentAction == "gridedit")
	$t_invoice_pelaksanaan_grid->RowIndex = 0;
while ($t_invoice_pelaksanaan_grid->RecCnt < $t_invoice_pelaksanaan_grid->StopRec) {
	$t_invoice_pelaksanaan_grid->RecCnt++;
	if (intval($t_invoice_pelaksanaan_grid->RecCnt) >= intval($t_invoice_pelaksanaan_grid->StartRec)) {
		$t_invoice_pelaksanaan_grid->RowCnt++;
		if ($t_invoice_pelaksanaan->CurrentAction == "gridadd" || $t_invoice_pelaksanaan->CurrentAction == "gridedit" || $t_invoice_pelaksanaan->CurrentAction == "F") {
			$t_invoice_pelaksanaan_grid->RowIndex++;
			$objForm->Index = $t_invoice_pelaksanaan_grid->RowIndex;
			if ($objForm->HasValue($t_invoice_pelaksanaan_grid->FormActionName))
				$t_invoice_pelaksanaan_grid->RowAction = strval($objForm->GetValue($t_invoice_pelaksanaan_grid->FormActionName));
			elseif ($t_invoice_pelaksanaan->CurrentAction == "gridadd")
				$t_invoice_pelaksanaan_grid->RowAction = "insert";
			else
				$t_invoice_pelaksanaan_grid->RowAction = "";
		}

		// Set up key count
		$t_invoice_pelaksanaan_grid->KeyCount = $t_invoice_pelaksanaan_grid->RowIndex;

		// Init row class and style
		$t_invoice_pelaksanaan->ResetAttrs();
		$t_invoice_pelaksanaan->CssClass = "";
		if ($t_invoice_pelaksanaan->CurrentAction == "gridadd") {
			if ($t_invoice_pelaksanaan->CurrentMode == "copy") {
				$t_invoice_pelaksanaan_grid->LoadRowValues($t_invoice_pelaksanaan_grid->Recordset); // Load row values
				$t_invoice_pelaksanaan_grid->SetRecordKey($t_invoice_pelaksanaan_grid->RowOldKey, $t_invoice_pelaksanaan_grid->Recordset); // Set old record key
			} else {
				$t_invoice_pelaksanaan_grid->LoadDefaultValues(); // Load default values
				$t_invoice_pelaksanaan_grid->RowOldKey = ""; // Clear old key value
			}
		} else {
			$t_invoice_pelaksanaan_grid->LoadRowValues($t_invoice_pelaksanaan_grid->Recordset); // Load row values
		}
		$t_invoice_pelaksanaan->RowType = EW_ROWTYPE_VIEW; // Render view
		if ($t_invoice_pelaksanaan->CurrentAction == "gridadd") // Grid add
			$t_invoice_pelaksanaan->RowType = EW_ROWTYPE_ADD; // Render add
		if ($t_invoice_pelaksanaan->CurrentAction == "gridadd" && $t_invoice_pelaksanaan->EventCancelled && !$objForm->HasValue("k_blankrow")) // Insert failed
			$t_invoice_pelaksanaan_grid->RestoreCurrentRowFormValues($t_invoice_pelaksanaan_grid->RowIndex); // Restore form values
		if ($t_invoice_pelaksanaan->CurrentAction == "gridedit") { // Grid edit
			if ($t_invoice_pelaksanaan->EventCancelled) {
				$t_invoice_pelaksanaan_grid->RestoreCurrentRowFormValues($t_invoice_pelaksanaan_grid->RowIndex); // Restore form values
			}
			if ($t_invoice_pelaksanaan_grid->RowAction == "insert")
				$t_invoice_pelaksanaan->RowType = EW_ROWTYPE_ADD; // Render add
			else
				$t_invoice_pelaksanaan->RowType = EW_ROWTYPE_EDIT; // Render edit
		}
		if ($t_invoice_pelaksanaan->CurrentAction == "gridedit" && ($t_invoice_pelaksanaan->RowType == EW_ROWTYPE_EDIT || $t_invoice_pelaksanaan->RowType == EW_ROWTYPE_ADD) && $t_invoice_pelaksanaan->EventCancelled) // Update failed
			$t_invoice_pelaksanaan_grid->RestoreCurrentRowFormValues($t_invoice_pelaksanaan_grid->RowIndex); // Restore form values
		if ($t_invoice_pelaksanaan->RowType == EW_ROWTYPE_EDIT) // Edit row
			$t_invoice_pelaksanaan_grid->EditRowCnt++;
		if ($t_invoice_pelaksanaan->CurrentAction == "F") // Confirm row
			$t_invoice_pelaksanaan_grid->RestoreCurrentRowFormValues($t_invoice_pelaksanaan_grid->RowIndex); // Restore form values

		// Set up row id / data-rowindex
		$t_invoice_pelaksanaan->RowAttrs = array_merge($t_invoice_pelaksanaan->RowAttrs, array('data-rowindex'=>$t_invoice_pelaksanaan_grid->RowCnt, 'id'=>'r' . $t_invoice_pelaksanaan_grid->RowCnt . '_t_invoice_pelaksanaan', 'data-rowtype'=>$t_invoice_pelaksanaan->RowType));

		// Render row
		$t_invoice_pelaksanaan_grid->RenderRow();

		// Render list options
		$t_invoice_pelaksanaan_grid->RenderListOptions();

		// Skip delete row / empty row for confirm page
		if ($t_invoice_pelaksanaan_grid->RowAction <> "delete" && $t_invoice_pelaksanaan_grid->RowAction <> "insertdelete" && !($t_invoice_pelaksanaan_grid->RowAction == "insert" && $t_invoice_pelaksanaan->CurrentAction == "F" && $t_invoice_pelaksanaan_grid->EmptyRow())) {
?>
	<tr<?php echo $t_invoice_pelaksanaan->RowAttributes() ?>>
<?php

// Render list options (body, left)
$t_invoice_pelaksanaan_grid->ListOptions->Render("body", "left", $t_invoice_pelaksanaan_grid->RowCnt);
?>
	<?php if ($t_invoice_pelaksanaan->tanggal->Visible) { // tanggal ?>
		<td data-name="tanggal"<?php echo $t_invoice_pelaksanaan->tanggal->CellAttributes() ?>>
<?php if ($t_invoice_pelaksanaan->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<span id="el<?php echo $t_invoice_pelaksanaan_grid->RowCnt ?>_t_invoice_pelaksanaan_tanggal" class="form-group t_invoice_pelaksanaan_tanggal">
<input type="text" data-table="t_invoice_pelaksanaan" data-field="x_tanggal" data-format="7" name="x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" id="x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" placeholder="<?php echo ew_HtmlEncode($t_invoice_pelaksanaan->tanggal->getPlaceHolder()) ?>" value="<?php echo $t_invoice_pelaksanaan->tanggal->EditValue ?>"<?php echo $t_invoice_pelaksanaan->tanggal->EditAttributes() ?>>
<?php if (!$t_invoice_pelaksanaan->tanggal->ReadOnly && !$t_invoice_pelaksanaan->tanggal->Disabled && !isset($t_invoice_pelaksanaan->tanggal->EditAttrs["readonly"]) && !isset($t_invoice_pelaksanaan->tanggal->EditAttrs["disabled"])) { ?>
<script type="text/javascript">
ew_CreateCalendar("ft_invoice_pelaksanaangrid", "x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal", 7);
</script>
<?php } ?>
</span>
<input type="hidden" data-table="t_invoice_pelaksanaan" data-field="x_tanggal" name="o<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" id="o<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" value="<?php echo ew_HtmlEncode($t_invoice_pelaksanaan->tanggal->OldValue) ?>">
<?php } ?>
<?php if ($t_invoice_pelaksanaan->RowType == EW_ROWTYPE_EDIT) { // Edit record ?>
<span id="el<?php echo $t_invoice_pelaksanaan_grid->RowCnt ?>_t_invoice_pelaksanaan_tanggal" class="form-group t_invoice_pelaksanaan_tanggal">
<input type="text" data-table="t_invoice_pelaksanaan" data-field="x_tanggal" data-format="7" name="x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" id="x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" placeholder="<?php echo ew_HtmlEncode($t_invoice_pelaksanaan->tanggal->getPlaceHolder()) ?>" value="<?php echo $t_invoice_pelaksanaan->tanggal->EditValue ?>"<?php echo $t_invoice_pelaksanaan->tanggal->EditAttributes() ?>>
<?php if (!$t_invoice_pelaksanaan->tanggal->ReadOnly && !$t_invoice_pelaksanaan->tanggal->Disabled && !isset($t_invoice_pelaksanaan->tanggal->EditAttrs["readonly"]) && !isset($t_invoice_pelaksanaan->tanggal->EditAttrs["disabled"])) { ?>
<script type="text/javascript">
ew_CreateCalendar("ft_invoice_pelaksanaangrid", "x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal", 7);
</script>
<?php } ?>
</span>
<?php } ?>
<?php if ($t_invoice_pelaksanaan->RowType == EW_ROWTYPE_VIEW) { // View record ?>
<span id="el<?php echo $t_invoice_pelaksanaan_grid->RowCnt ?>_t_invoice_pelaksanaan_tanggal" class="t_invoice_pelaksanaan_tanggal">
<span<?php echo $t_invoice_pelaksanaan->tanggal->ViewAttributes() ?>>
<?php echo $t_invoice_pelaksanaan->tanggal->ListViewValue() ?></span>
</span>
<?php if ($t_invoice_pelaksanaan->CurrentAction <> "F") { ?>
<input type="hidden" data-table="t_invoice_pelaksanaan" data-field="x_tanggal" name="x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" id="x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" value="<?php echo ew_HtmlEncode($t_invoice_pelaksanaan->tanggal->FormValue) ?>">
<input type="hidden" data-table="t_invoice_pelaksanaan" data-field="x_tanggal" name="o<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" id="o<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" value="<?php echo ew_HtmlEncode($t_invoice_pelaksanaan->tanggal->OldValue) ?>">
<?php } else { ?>
<input type="hidden" data-table="t_invoice_pelaksanaan" data-field="x_tanggal" name="ft_invoice_pelaksanaangrid$x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" id="ft_invoice_pelaksanaangrid$x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" value="<?php echo ew_HtmlEncode($t_invoice_pelaksanaan->tanggal->FormValue) ?>">
<input type="hidden" data-table="t_invoice_pelaksanaan" data-field="x_tanggal" name="ft_invoice_pelaksanaangrid$o<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" id="ft_invoice_pelaksanaangrid$o<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" value="<?php echo ew_HtmlEncode($t_invoice_pelaksanaan->tanggal->OldValue) ?>">
<?php } ?>
<?php } ?>
<a id="<?php echo $t_invoice_pelaksanaan_grid->PageObjName . "_row_" . $t_invoice_pelaksanaan_grid->RowCnt ?>"></a></td>
	<?php } ?>
<?php if ($t_invoice_pelaksanaan->RowType == EW_ROWTYPE_ADD) { // Add record ?>
<input type="hidden" data-table="t_invoice_pelaksanaan" data-field="x_pelaksanaan_id" name="x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_pelaksanaan_id" id="x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_pelaksanaan_id" value="<?php echo ew_HtmlEncode($t_invoice_pelaksanaan->pelaksanaan_id->CurrentValue) ?>">
<input type="hidden" data-table="t_invoice_pelaksanaan" data-field="x_pelaksanaan_id" name="o<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_pelaksanaan_id" id="o<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_pelaksanaan_id" value="<?php echo ew_HtmlEncode($t_invoice_pelaksanaan->pelaksanaan_id->OldValue) ?>">
<?php } ?>
<?php if ($t_invoice_pelaksanaan->RowType == EW_ROWTYPE_EDIT || $t_invoice_pelaksanaan->CurrentMode == "edit") { ?>
<input type="hidden" data-table="t_invoice_pelaksanaan" data-field="x_pelaksanaan_id" name="x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_pelaksanaan_id" id="x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_pelaksanaan_id" value="<?php echo ew_HtmlEncode($t_invoice_pelaksanaan->pelaksanaan_id->CurrentValue) ?>">
<?php } ?>
<?php

// Render list options (body, right)
$t_invoice_pelaksanaan_grid->ListOptions->Render("body", "right", $t_invoice_pelaksanaan_grid->RowCnt);
?>
	</tr>
<?php if ($t_invoice_pelaksanaan->RowType == EW_ROWTYPE_ADD || $t_invoice_pelaksanaan->RowType == EW_ROWTYPE_EDIT) { ?>
<script type="text/javascript">
ft_invoice_pelaksanaangrid.UpdateOpts(<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>);
</script>
<?php } ?>
<?php
	}
	} // End delete row checking
	if ($t_invoice_pelaksanaan->CurrentAction <> "gridadd" || $t_invoice_pelaksanaan->CurrentMode == "copy")
		if (!$t_invoice_pelaksanaan_grid->Recordset->EOF) $t_invoice_pelaksanaan_grid->Recordset->MoveNext();
}
?>
<?php
	if ($t_invoice_pelaksanaan->CurrentMode == "add" || $t_invoice_pelaksanaan->CurrentMode == "copy" || $t_invoice_pelaksanaan->CurrentMode == "edit") {
		$t_invoice_pelaksanaan_grid->RowIndex = '$rowindex$';
		$t_invoice_pelaksanaan_grid->LoadDefaultValues();

		// Set row properties
		$t_invoice_pelaksanaan->ResetAttrs();
		$t_invoice_pelaksanaan->RowAttrs = array_merge($t_invoice_pelaksanaan->RowAttrs, array('data-rowindex'=>$t_invoice_pelaksanaan_grid->RowIndex, 'id'=>'r0_t_invoice_pelaksanaan', 'data-rowtype'=>EW_ROWTYPE_ADD));
		ew_AppendClass($t_invoice_pelaksanaan->RowAttrs["class"], "ewTemplate");
		$t_invoice_pelaksanaan->RowType = EW_ROWTYPE_ADD;

		// Render row
		$t_invoice_pelaksanaan_grid->RenderRow();

		// Render list options
		$t_invoice_pelaksanaan_grid->RenderListOptions();
		$t_invoice_pelaksanaan_grid->StartRowCnt = 0;
?>
	<tr<?php echo $t_invoice_pelaksanaan->RowAttributes() ?>>
<?php

// Render list options (body, left)
$t_invoice_pelaksanaan_grid->ListOptions->Render("body", "left", $t_invoice_pelaksanaan_grid->RowIndex);
?>
	<?php if ($t_invoice_pelaksanaan->tanggal->Visible) { // tanggal ?>
		<td data-name="tanggal">
<?php if ($t_invoice_pelaksanaan->CurrentAction <> "F") { ?>
<span id="el$rowindex$_t_invoice_pelaksanaan_tanggal" class="form-group t_invoice_pelaksanaan_tanggal">
<input type="text" data-table="t_invoice_pelaksanaan" data-field="x_tanggal" data-format="7" name="x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" id="x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" placeholder="<?php echo ew_HtmlEncode($t_invoice_pelaksanaan->tanggal->getPlaceHolder()) ?>" value="<?php echo $t_invoice_pelaksanaan->tanggal->EditValue ?>"<?php echo $t_invoice_pelaksanaan->tanggal->EditAttributes() ?>>
<?php if (!$t_invoice_pelaksanaan->tanggal->ReadOnly && !$t_invoice_pelaksanaan->tanggal->Disabled && !isset($t_invoice_pelaksanaan->tanggal->EditAttrs["readonly"]) && !isset($t_invoice_pelaksanaan->tanggal->EditAttrs["disabled"])) { ?>
<script type="text/javascript">
ew_CreateCalendar("ft_invoice_pelaksanaangrid", "x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal", 7);
</script>
<?php } ?>
</span>
<?php } else { ?>
<span id="el$rowindex$_t_invoice_pelaksanaan_tanggal" class="form-group t_invoice_pelaksanaan_tanggal">
<span<?php echo $t_invoice_pelaksanaan->tanggal->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t_invoice_pelaksanaan->tanggal->ViewValue ?></p></span>
</span>
<input type="hidden" data-table="t_invoice_pelaksanaan" data-field="x_tanggal" name="x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" id="x<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" value="<?php echo ew_HtmlEncode($t_invoice_pelaksanaan->tanggal->FormValue) ?>">
<?php } ?>
<input type="hidden" data-table="t_invoice_pelaksanaan" data-field="x_tanggal" name="o<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" id="o<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>_tanggal" value="<?php echo ew_HtmlEncode($t_invoice_pelaksanaan->tanggal->OldValue) ?>">
</td>
	<?php } ?>
<?php

// Render list options (body, right)
$t_invoice_pelaksanaan_grid->ListOptions->Render("body", "right", $t_invoice_pelaksanaan_grid->RowCnt);
?>
<script type="text/javascript">
ft_invoice_pelaksanaangrid.UpdateOpts(<?php echo $t_invoice_pelaksanaan_grid->RowIndex ?>);
</script>
	</tr>
<?php
}
?>
</tbody>
</table>
<?php if ($t_invoice_pelaksanaan->CurrentMode == "add" || $t_invoice_pelaksanaan->CurrentMode == "copy") { ?>
<input type="hidden" name="a_list" id="a_list" value="gridinsert">
<input type="hidden" name="<?php echo $t_invoice_pelaksanaan_grid->FormKeyCountName ?>" id="<?php echo $t_invoice_pelaksanaan_grid->FormKeyCountName ?>" value="<?php echo $t_invoice_pelaksanaan_grid->KeyCount ?>">
<?php echo $t_invoice_pelaksanaan_grid->MultiSelectKey ?>
<?php } ?>
<?php if ($t_invoice_pelaksanaan->CurrentMode == "edit") { ?>
<input type="hidden" name="a_list" id="a_list" value="gridupdate">
<input type="hidden" name="<?php echo $t_invoice_pelaksanaan_grid->FormKeyCountName ?>" id="<?php echo $t_invoice_pelaksanaan_grid->FormKeyCountName ?>" value="<?php echo $t_invoice_pelaksanaan_grid->KeyCount ?>">
<?php echo $t_invoice_pelaksanaan_grid->MultiSelectKey ?>
<?php } ?>
<?php if ($t_invoice_pelaksanaan->CurrentMode == "") { ?>
<input type="hidden" name="a_list" id="a_list" value="">
<?php } ?>
<input type="hidden" name="detailpage" value="ft_invoice_pelaksanaangrid">
</div>
<?php

// Close recordset
if ($t_invoice_pelaksanaan_grid->Recordset)
	$t_invoice_pelaksanaan_grid->Recordset->Close();
?>
<?php if ($t_invoice_pelaksanaan_grid->ShowOtherOptions) { ?>
<div class="panel-footer ewGridLowerPanel">
<?php
	foreach ($t_invoice_pelaksanaan_grid->OtherOptions as &$option)
		$option->Render("body", "bottom");
?>
</div>
<div class="clearfix"></div>
<?php } ?>
</div>
</div>
<?php } ?>
<?php if ($t_invoice_pelaksanaan_grid->TotalRecs == 0 && $t_invoice_pelaksanaan->CurrentAction == "") { // Show other options ?>
<div class="ewListOtherOptions">
<?php
	foreach ($t_invoice_pelaksanaan_grid->OtherOptions as &$option) {
		$option->ButtonClass = "";
		$option->Render("body", "");
	}
?>
</div>
<div class="clearfix"></div>
<?php } ?>
<?php if ($t_invoice_pelaksanaan->Export == "") { ?>
<script type="text/javascript">
ft_invoice_pelaksanaangrid.Init();
</script>
<?php } ?>
<?php
$t_invoice_pelaksanaan_grid->ShowPageFooter();
if (EW_DEBUG_ENABLED)
	echo ew_DebugMsg();
?>
<?php
$t_invoice_pelaksanaan_grid->Page_Terminate();
?>
