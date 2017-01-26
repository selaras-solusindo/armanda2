<?php
if (session_id() == "") session_start(); // Init session data
ob_start(); // Turn on output buffering
?>
<?php include_once "ewcfg13.php" ?>
<?php include_once ((EW_USE_ADODB) ? "adodb5/adodb.inc.php" : "ewmysql13.php") ?>
<?php include_once "phpfn13.php" ?>
<?php include_once "t_tmp_invoice_allinfo.php" ?>
<?php include_once "t_userinfo.php" ?>
<?php include_once "userfn13.php" ?>
<?php

//
// Page class
//

$t_tmp_invoice_all_edit = NULL; // Initialize page object first

class ct_tmp_invoice_all_edit extends ct_tmp_invoice_all {

	// Page ID
	var $PageID = 'edit';

	// Project ID
	var $ProjectID = "{02A4272B-E84A-463D-9ED2-75398DF0A44A}";

	// Table name
	var $TableName = 't_tmp_invoice_all';

	// Page object name
	var $PageObjName = 't_tmp_invoice_all_edit';

	// Page name
	function PageName() {
		return ew_CurrentPage();
	}

	// Page URL
	function PageUrl() {
		$PageUrl = ew_CurrentPage() . "?";
		if ($this->UseTokenInUrl) $PageUrl .= "t=" . $this->TableVar . "&"; // Add page token
		return $PageUrl;
	}

	// Message
	function getMessage() {
		return @$_SESSION[EW_SESSION_MESSAGE];
	}

	function setMessage($v) {
		ew_AddMessage($_SESSION[EW_SESSION_MESSAGE], $v);
	}

	function getFailureMessage() {
		return @$_SESSION[EW_SESSION_FAILURE_MESSAGE];
	}

	function setFailureMessage($v) {
		ew_AddMessage($_SESSION[EW_SESSION_FAILURE_MESSAGE], $v);
	}

	function getSuccessMessage() {
		return @$_SESSION[EW_SESSION_SUCCESS_MESSAGE];
	}

	function setSuccessMessage($v) {
		ew_AddMessage($_SESSION[EW_SESSION_SUCCESS_MESSAGE], $v);
	}

	function getWarningMessage() {
		return @$_SESSION[EW_SESSION_WARNING_MESSAGE];
	}

	function setWarningMessage($v) {
		ew_AddMessage($_SESSION[EW_SESSION_WARNING_MESSAGE], $v);
	}

	// Methods to clear message
	function ClearMessage() {
		$_SESSION[EW_SESSION_MESSAGE] = "";
	}

	function ClearFailureMessage() {
		$_SESSION[EW_SESSION_FAILURE_MESSAGE] = "";
	}

	function ClearSuccessMessage() {
		$_SESSION[EW_SESSION_SUCCESS_MESSAGE] = "";
	}

	function ClearWarningMessage() {
		$_SESSION[EW_SESSION_WARNING_MESSAGE] = "";
	}

	function ClearMessages() {
		$_SESSION[EW_SESSION_MESSAGE] = "";
		$_SESSION[EW_SESSION_FAILURE_MESSAGE] = "";
		$_SESSION[EW_SESSION_SUCCESS_MESSAGE] = "";
		$_SESSION[EW_SESSION_WARNING_MESSAGE] = "";
	}

	// Show message
	function ShowMessage() {
		$hidden = FALSE;
		$html = "";

		// Message
		$sMessage = $this->getMessage();
		if (method_exists($this, "Message_Showing"))
			$this->Message_Showing($sMessage, "");
		if ($sMessage <> "") { // Message in Session, display
			if (!$hidden)
				$sMessage = "<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $sMessage;
			$html .= "<div class=\"alert alert-info ewInfo\">" . $sMessage . "</div>";
			$_SESSION[EW_SESSION_MESSAGE] = ""; // Clear message in Session
		}

		// Warning message
		$sWarningMessage = $this->getWarningMessage();
		if (method_exists($this, "Message_Showing"))
			$this->Message_Showing($sWarningMessage, "warning");
		if ($sWarningMessage <> "") { // Message in Session, display
			if (!$hidden)
				$sWarningMessage = "<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $sWarningMessage;
			$html .= "<div class=\"alert alert-warning ewWarning\">" . $sWarningMessage . "</div>";
			$_SESSION[EW_SESSION_WARNING_MESSAGE] = ""; // Clear message in Session
		}

		// Success message
		$sSuccessMessage = $this->getSuccessMessage();
		if (method_exists($this, "Message_Showing"))
			$this->Message_Showing($sSuccessMessage, "success");
		if ($sSuccessMessage <> "") { // Message in Session, display
			if (!$hidden)
				$sSuccessMessage = "<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $sSuccessMessage;
			$html .= "<div class=\"alert alert-success ewSuccess\">" . $sSuccessMessage . "</div>";
			$_SESSION[EW_SESSION_SUCCESS_MESSAGE] = ""; // Clear message in Session
		}

		// Failure message
		$sErrorMessage = $this->getFailureMessage();
		if (method_exists($this, "Message_Showing"))
			$this->Message_Showing($sErrorMessage, "failure");
		if ($sErrorMessage <> "") { // Message in Session, display
			if (!$hidden)
				$sErrorMessage = "<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" . $sErrorMessage;
			$html .= "<div class=\"alert alert-danger ewError\">" . $sErrorMessage . "</div>";
			$_SESSION[EW_SESSION_FAILURE_MESSAGE] = ""; // Clear message in Session
		}
		echo "<div class=\"ewMessageDialog\"" . (($hidden) ? " style=\"display: none;\"" : "") . ">" . $html . "</div>";
	}
	var $PageHeader;
	var $PageFooter;

	// Show Page Header
	function ShowPageHeader() {
		$sHeader = $this->PageHeader;
		$this->Page_DataRendering($sHeader);
		if ($sHeader <> "") { // Header exists, display
			echo "<p>" . $sHeader . "</p>";
		}
	}

	// Show Page Footer
	function ShowPageFooter() {
		$sFooter = $this->PageFooter;
		$this->Page_DataRendered($sFooter);
		if ($sFooter <> "") { // Footer exists, display
			echo "<p>" . $sFooter . "</p>";
		}
	}

	// Validate page request
	function IsPageRequest() {
		global $objForm;
		if ($this->UseTokenInUrl) {
			if ($objForm)
				return ($this->TableVar == $objForm->GetValue("t"));
			if (@$_GET["t"] <> "")
				return ($this->TableVar == $_GET["t"]);
		} else {
			return TRUE;
		}
	}
	var $Token = "";
	var $TokenTimeout = 0;
	var $CheckToken = EW_CHECK_TOKEN;
	var $CheckTokenFn = "ew_CheckToken";
	var $CreateTokenFn = "ew_CreateToken";

	// Valid Post
	function ValidPost() {
		if (!$this->CheckToken || !ew_IsHttpPost())
			return TRUE;
		if (!isset($_POST[EW_TOKEN_NAME]))
			return FALSE;
		$fn = $this->CheckTokenFn;
		if (is_callable($fn))
			return $fn($_POST[EW_TOKEN_NAME], $this->TokenTimeout);
		return FALSE;
	}

	// Create Token
	function CreateToken() {
		global $gsToken;
		if ($this->CheckToken) {
			$fn = $this->CreateTokenFn;
			if ($this->Token == "" && is_callable($fn)) // Create token
				$this->Token = $fn();
			$gsToken = $this->Token; // Save to global variable
		}
	}

	//
	// Page class constructor
	//
	function __construct() {
		global $conn, $Language;
		global $UserTable, $UserTableConn;
		$GLOBALS["Page"] = &$this;
		$this->TokenTimeout = ew_SessionTimeoutTime();

		// Language object
		if (!isset($Language)) $Language = new cLanguage();

		// Parent constuctor
		parent::__construct();

		// Table object (t_tmp_invoice_all)
		if (!isset($GLOBALS["t_tmp_invoice_all"]) || get_class($GLOBALS["t_tmp_invoice_all"]) == "ct_tmp_invoice_all") {
			$GLOBALS["t_tmp_invoice_all"] = &$this;
			$GLOBALS["Table"] = &$GLOBALS["t_tmp_invoice_all"];
		}

		// Table object (t_user)
		if (!isset($GLOBALS['t_user'])) $GLOBALS['t_user'] = new ct_user();

		// Page ID
		if (!defined("EW_PAGE_ID"))
			define("EW_PAGE_ID", 'edit', TRUE);

		// Table name (for backward compatibility)
		if (!defined("EW_TABLE_NAME"))
			define("EW_TABLE_NAME", 't_tmp_invoice_all', TRUE);

		// Start timer
		if (!isset($GLOBALS["gTimer"])) $GLOBALS["gTimer"] = new cTimer();

		// Open connection
		if (!isset($conn)) $conn = ew_Connect($this->DBID);

		// User table object (t_user)
		if (!isset($UserTable)) {
			$UserTable = new ct_user();
			$UserTableConn = Conn($UserTable->DBID);
		}
	}

	//
	//  Page_Init
	//
	function Page_Init() {
		global $gsExport, $gsCustomExport, $gsExportFile, $UserProfile, $Language, $Security, $objForm;

		// Security
		$Security = new cAdvancedSecurity();
		if (!$Security->IsLoggedIn()) $Security->AutoLogin();
		if ($Security->IsLoggedIn()) $Security->TablePermission_Loading();
		$Security->LoadCurrentUserLevel($this->ProjectID . $this->TableName);
		if ($Security->IsLoggedIn()) $Security->TablePermission_Loaded();
		if (!$Security->CanEdit()) {
			$Security->SaveLastUrl();
			$this->setFailureMessage(ew_DeniedMsg()); // Set no permission
			if ($Security->CanList())
				$this->Page_Terminate(ew_GetUrl("t_tmp_invoice_alllist.php"));
			else
				$this->Page_Terminate(ew_GetUrl("login.php"));
		}
		if ($Security->IsLoggedIn()) {
			$Security->UserID_Loading();
			$Security->LoadUserID();
			$Security->UserID_Loaded();
		}

		// Create form object
		$objForm = new cFormObj();
		$this->CurrentAction = (@$_GET["a"] <> "") ? $_GET["a"] : @$_POST["a_list"]; // Set up current action
		$this->temp_id->SetVisibility();
		$this->temp_id->Visible = !$this->IsAdd() && !$this->IsCopy() && !$this->IsGridAdd();
		$this->tanggal->SetVisibility();
		$this->nama->SetVisibility();
		$this->no_kwitansi->SetVisibility();
		$this->nomor->SetVisibility();
		$this->no_sertifikat->SetVisibility();
		$this->tgl_pelaksanaan->SetVisibility();
		$this->total_ppn->SetVisibility();

		// Global Page Loading event (in userfn*.php)
		Page_Loading();

		// Page Load event
		$this->Page_Load();

		// Check token
		if (!$this->ValidPost()) {
			echo $Language->Phrase("InvalidPostRequest");
			$this->Page_Terminate();
			exit();
		}

		// Process auto fill
		if (@$_POST["ajax"] == "autofill") {
			$results = $this->GetAutoFill(@$_POST["name"], @$_POST["q"]);
			if ($results) {

				// Clean output buffer
				if (!EW_DEBUG_ENABLED && ob_get_length())
					ob_end_clean();
				echo $results;
				$this->Page_Terminate();
				exit();
			}
		}

		// Create Token
		$this->CreateToken();
	}

	//
	// Page_Terminate
	//
	function Page_Terminate($url = "") {
		global $gsExportFile, $gTmpImages;

		// Page Unload event
		$this->Page_Unload();

		// Global Page Unloaded event (in userfn*.php)
		Page_Unloaded();

		// Export
		global $EW_EXPORT, $t_tmp_invoice_all;
		if ($this->CustomExport <> "" && $this->CustomExport == $this->Export && array_key_exists($this->CustomExport, $EW_EXPORT)) {
				$sContent = ob_get_contents();
			if ($gsExportFile == "") $gsExportFile = $this->TableVar;
			$class = $EW_EXPORT[$this->CustomExport];
			if (class_exists($class)) {
				$doc = new $class($t_tmp_invoice_all);
				$doc->Text = $sContent;
				if ($this->Export == "email")
					echo $this->ExportEmail($doc->Text);
				else
					$doc->Export();
				ew_DeleteTmpImages(); // Delete temp images
				exit();
			}
		}
		$this->Page_Redirecting($url);

		 // Close connection
		ew_CloseConn();

		// Go to URL if specified
		if ($url <> "") {
			if (!EW_DEBUG_ENABLED && ob_get_length())
				ob_end_clean();

			// Handle modal response
			if ($this->IsModal) {
				$row = array();
				$row["url"] = $url;
				echo ew_ArrayToJson(array($row));
			} else {
				header("Location: " . $url);
			}
		}
		exit();
	}
	var $FormClassName = "form-horizontal ewForm ewEditForm";
	var $IsModal = FALSE;
	var $DbMasterFilter;
	var $DbDetailFilter;

	// 
	// Page main
	//
	function Page_Main() {
		global $objForm, $Language, $gsFormError;
		global $gbSkipHeaderFooter;

		// Check modal
		$this->IsModal = (@$_GET["modal"] == "1" || @$_POST["modal"] == "1");
		if ($this->IsModal)
			$gbSkipHeaderFooter = TRUE;

		// Load key from QueryString
		if (@$_GET["temp_id"] <> "") {
			$this->temp_id->setQueryStringValue($_GET["temp_id"]);
		}

		// Process form if post back
		if (@$_POST["a_edit"] <> "") {
			$this->CurrentAction = $_POST["a_edit"]; // Get action code
			$this->LoadFormValues(); // Get form values
		} else {
			$this->CurrentAction = "I"; // Default action is display
		}

		// Check if valid key
		if ($this->temp_id->CurrentValue == "") {
			$this->Page_Terminate("t_tmp_invoice_alllist.php"); // Invalid key, return to list
		}

		// Validate form if post back
		if (@$_POST["a_edit"] <> "") {
			if (!$this->ValidateForm()) {
				$this->CurrentAction = ""; // Form error, reset action
				$this->setFailureMessage($gsFormError);
				$this->EventCancelled = TRUE; // Event cancelled
				$this->RestoreFormValues();
			}
		}
		switch ($this->CurrentAction) {
			case "I": // Get a record to display
				if (!$this->LoadRow()) { // Load record based on key
					if ($this->getFailureMessage() == "") $this->setFailureMessage($Language->Phrase("NoRecord")); // No record found
					$this->Page_Terminate("t_tmp_invoice_alllist.php"); // No matching record, return to list
				}
				break;
			Case "U": // Update
				$sReturnUrl = $this->getReturnUrl();
				if (ew_GetPageName($sReturnUrl) == "t_tmp_invoice_alllist.php")
					$sReturnUrl = $this->AddMasterUrl($sReturnUrl); // List page, return to list page with correct master key if necessary
				$this->SendEmail = TRUE; // Send email on update success
				if ($this->EditRow()) { // Update record based on key
					if ($this->getSuccessMessage() == "")
						$this->setSuccessMessage($Language->Phrase("UpdateSuccess")); // Update success
					$this->Page_Terminate($sReturnUrl); // Return to caller
				} elseif ($this->getFailureMessage() == $Language->Phrase("NoRecord")) {
					$this->Page_Terminate($sReturnUrl); // Return to caller
				} else {
					$this->EventCancelled = TRUE; // Event cancelled
					$this->RestoreFormValues(); // Restore form values if update failed
				}
		}

		// Set up Breadcrumb
		$this->SetupBreadcrumb();

		// Render the record
		$this->RowType = EW_ROWTYPE_EDIT; // Render as Edit
		$this->ResetAttrs();
		$this->RenderRow();
	}

	// Set up starting record parameters
	function SetUpStartRec() {
		if ($this->DisplayRecs == 0)
			return;
		if ($this->IsPageRequest()) { // Validate request
			if (@$_GET[EW_TABLE_START_REC] <> "") { // Check for "start" parameter
				$this->StartRec = $_GET[EW_TABLE_START_REC];
				$this->setStartRecordNumber($this->StartRec);
			} elseif (@$_GET[EW_TABLE_PAGE_NO] <> "") {
				$PageNo = $_GET[EW_TABLE_PAGE_NO];
				if (is_numeric($PageNo)) {
					$this->StartRec = ($PageNo-1)*$this->DisplayRecs+1;
					if ($this->StartRec <= 0) {
						$this->StartRec = 1;
					} elseif ($this->StartRec >= intval(($this->TotalRecs-1)/$this->DisplayRecs)*$this->DisplayRecs+1) {
						$this->StartRec = intval(($this->TotalRecs-1)/$this->DisplayRecs)*$this->DisplayRecs+1;
					}
					$this->setStartRecordNumber($this->StartRec);
				}
			}
		}
		$this->StartRec = $this->getStartRecordNumber();

		// Check if correct start record counter
		if (!is_numeric($this->StartRec) || $this->StartRec == "") { // Avoid invalid start record counter
			$this->StartRec = 1; // Reset start record counter
			$this->setStartRecordNumber($this->StartRec);
		} elseif (intval($this->StartRec) > intval($this->TotalRecs)) { // Avoid starting record > total records
			$this->StartRec = intval(($this->TotalRecs-1)/$this->DisplayRecs)*$this->DisplayRecs+1; // Point to last page first record
			$this->setStartRecordNumber($this->StartRec);
		} elseif (($this->StartRec-1) % $this->DisplayRecs <> 0) {
			$this->StartRec = intval(($this->StartRec-1)/$this->DisplayRecs)*$this->DisplayRecs+1; // Point to page boundary
			$this->setStartRecordNumber($this->StartRec);
		}
	}

	// Get upload files
	function GetUploadFiles() {
		global $objForm, $Language;

		// Get upload data
	}

	// Load form values
	function LoadFormValues() {

		// Load from form
		global $objForm;
		if (!$this->temp_id->FldIsDetailKey)
			$this->temp_id->setFormValue($objForm->GetValue("x_temp_id"));
		if (!$this->tanggal->FldIsDetailKey) {
			$this->tanggal->setFormValue($objForm->GetValue("x_tanggal"));
			$this->tanggal->CurrentValue = ew_UnFormatDateTime($this->tanggal->CurrentValue, 0);
		}
		if (!$this->nama->FldIsDetailKey) {
			$this->nama->setFormValue($objForm->GetValue("x_nama"));
		}
		if (!$this->no_kwitansi->FldIsDetailKey) {
			$this->no_kwitansi->setFormValue($objForm->GetValue("x_no_kwitansi"));
		}
		if (!$this->nomor->FldIsDetailKey) {
			$this->nomor->setFormValue($objForm->GetValue("x_nomor"));
		}
		if (!$this->no_sertifikat->FldIsDetailKey) {
			$this->no_sertifikat->setFormValue($objForm->GetValue("x_no_sertifikat"));
		}
		if (!$this->tgl_pelaksanaan->FldIsDetailKey) {
			$this->tgl_pelaksanaan->setFormValue($objForm->GetValue("x_tgl_pelaksanaan"));
			$this->tgl_pelaksanaan->CurrentValue = ew_UnFormatDateTime($this->tgl_pelaksanaan->CurrentValue, 0);
		}
		if (!$this->total_ppn->FldIsDetailKey) {
			$this->total_ppn->setFormValue($objForm->GetValue("x_total_ppn"));
		}
	}

	// Restore form values
	function RestoreFormValues() {
		global $objForm;
		$this->LoadRow();
		$this->temp_id->CurrentValue = $this->temp_id->FormValue;
		$this->tanggal->CurrentValue = $this->tanggal->FormValue;
		$this->tanggal->CurrentValue = ew_UnFormatDateTime($this->tanggal->CurrentValue, 0);
		$this->nama->CurrentValue = $this->nama->FormValue;
		$this->no_kwitansi->CurrentValue = $this->no_kwitansi->FormValue;
		$this->nomor->CurrentValue = $this->nomor->FormValue;
		$this->no_sertifikat->CurrentValue = $this->no_sertifikat->FormValue;
		$this->tgl_pelaksanaan->CurrentValue = $this->tgl_pelaksanaan->FormValue;
		$this->tgl_pelaksanaan->CurrentValue = ew_UnFormatDateTime($this->tgl_pelaksanaan->CurrentValue, 0);
		$this->total_ppn->CurrentValue = $this->total_ppn->FormValue;
	}

	// Load row based on key values
	function LoadRow() {
		global $Security, $Language;
		$sFilter = $this->KeyFilter();

		// Call Row Selecting event
		$this->Row_Selecting($sFilter);

		// Load SQL based on filter
		$this->CurrentFilter = $sFilter;
		$sSql = $this->SQL();
		$conn = &$this->Connection();
		$res = FALSE;
		$rs = ew_LoadRecordset($sSql, $conn);
		if ($rs && !$rs->EOF) {
			$res = TRUE;
			$this->LoadRowValues($rs); // Load row values
			$rs->Close();
		}
		return $res;
	}

	// Load row values from recordset
	function LoadRowValues(&$rs) {
		if (!$rs || $rs->EOF) return;

		// Call Row Selected event
		$row = &$rs->fields;
		$this->Row_Selected($row);
		$this->temp_id->setDbValue($rs->fields('temp_id'));
		$this->tanggal->setDbValue($rs->fields('tanggal'));
		$this->nama->setDbValue($rs->fields('nama'));
		$this->no_kwitansi->setDbValue($rs->fields('no_kwitansi'));
		$this->nomor->setDbValue($rs->fields('nomor'));
		$this->no_sertifikat->setDbValue($rs->fields('no_sertifikat'));
		$this->tgl_pelaksanaan->setDbValue($rs->fields('tgl_pelaksanaan'));
		$this->total_ppn->setDbValue($rs->fields('total_ppn'));
	}

	// Load DbValue from recordset
	function LoadDbValues(&$rs) {
		if (!$rs || !is_array($rs) && $rs->EOF) return;
		$row = is_array($rs) ? $rs : $rs->fields;
		$this->temp_id->DbValue = $row['temp_id'];
		$this->tanggal->DbValue = $row['tanggal'];
		$this->nama->DbValue = $row['nama'];
		$this->no_kwitansi->DbValue = $row['no_kwitansi'];
		$this->nomor->DbValue = $row['nomor'];
		$this->no_sertifikat->DbValue = $row['no_sertifikat'];
		$this->tgl_pelaksanaan->DbValue = $row['tgl_pelaksanaan'];
		$this->total_ppn->DbValue = $row['total_ppn'];
	}

	// Render row values based on field settings
	function RenderRow() {
		global $Security, $Language, $gsLanguage;

		// Initialize URLs
		// Convert decimal values if posted back

		if ($this->total_ppn->FormValue == $this->total_ppn->CurrentValue && is_numeric(ew_StrToFloat($this->total_ppn->CurrentValue)))
			$this->total_ppn->CurrentValue = ew_StrToFloat($this->total_ppn->CurrentValue);

		// Call Row_Rendering event
		$this->Row_Rendering();

		// Common render codes for all row types
		// temp_id
		// tanggal
		// nama
		// no_kwitansi
		// nomor
		// no_sertifikat
		// tgl_pelaksanaan
		// total_ppn

		if ($this->RowType == EW_ROWTYPE_VIEW) { // View row

		// temp_id
		$this->temp_id->ViewValue = $this->temp_id->CurrentValue;
		$this->temp_id->ViewCustomAttributes = "";

		// tanggal
		$this->tanggal->ViewValue = $this->tanggal->CurrentValue;
		$this->tanggal->ViewValue = ew_FormatDateTime($this->tanggal->ViewValue, 0);
		$this->tanggal->ViewCustomAttributes = "";

		// nama
		$this->nama->ViewValue = $this->nama->CurrentValue;
		$this->nama->ViewCustomAttributes = "";

		// no_kwitansi
		$this->no_kwitansi->ViewValue = $this->no_kwitansi->CurrentValue;
		$this->no_kwitansi->ViewCustomAttributes = "";

		// nomor
		$this->nomor->ViewValue = $this->nomor->CurrentValue;
		$this->nomor->ViewCustomAttributes = "";

		// no_sertifikat
		$this->no_sertifikat->ViewValue = $this->no_sertifikat->CurrentValue;
		$this->no_sertifikat->ViewCustomAttributes = "";

		// tgl_pelaksanaan
		$this->tgl_pelaksanaan->ViewValue = $this->tgl_pelaksanaan->CurrentValue;
		$this->tgl_pelaksanaan->ViewValue = ew_FormatDateTime($this->tgl_pelaksanaan->ViewValue, 0);
		$this->tgl_pelaksanaan->ViewCustomAttributes = "";

		// total_ppn
		$this->total_ppn->ViewValue = $this->total_ppn->CurrentValue;
		$this->total_ppn->ViewCustomAttributes = "";

			// temp_id
			$this->temp_id->LinkCustomAttributes = "";
			$this->temp_id->HrefValue = "";
			$this->temp_id->TooltipValue = "";

			// tanggal
			$this->tanggal->LinkCustomAttributes = "";
			$this->tanggal->HrefValue = "";
			$this->tanggal->TooltipValue = "";

			// nama
			$this->nama->LinkCustomAttributes = "";
			$this->nama->HrefValue = "";
			$this->nama->TooltipValue = "";

			// no_kwitansi
			$this->no_kwitansi->LinkCustomAttributes = "";
			$this->no_kwitansi->HrefValue = "";
			$this->no_kwitansi->TooltipValue = "";

			// nomor
			$this->nomor->LinkCustomAttributes = "";
			$this->nomor->HrefValue = "";
			$this->nomor->TooltipValue = "";

			// no_sertifikat
			$this->no_sertifikat->LinkCustomAttributes = "";
			$this->no_sertifikat->HrefValue = "";
			$this->no_sertifikat->TooltipValue = "";

			// tgl_pelaksanaan
			$this->tgl_pelaksanaan->LinkCustomAttributes = "";
			$this->tgl_pelaksanaan->HrefValue = "";
			$this->tgl_pelaksanaan->TooltipValue = "";

			// total_ppn
			$this->total_ppn->LinkCustomAttributes = "";
			$this->total_ppn->HrefValue = "";
			$this->total_ppn->TooltipValue = "";
		} elseif ($this->RowType == EW_ROWTYPE_EDIT) { // Edit row

			// temp_id
			$this->temp_id->EditAttrs["class"] = "form-control";
			$this->temp_id->EditCustomAttributes = "";
			$this->temp_id->EditValue = $this->temp_id->CurrentValue;
			$this->temp_id->ViewCustomAttributes = "";

			// tanggal
			$this->tanggal->EditAttrs["class"] = "form-control";
			$this->tanggal->EditCustomAttributes = "";
			$this->tanggal->EditValue = ew_HtmlEncode(ew_FormatDateTime($this->tanggal->CurrentValue, 8));
			$this->tanggal->PlaceHolder = ew_RemoveHtml($this->tanggal->FldCaption());

			// nama
			$this->nama->EditAttrs["class"] = "form-control";
			$this->nama->EditCustomAttributes = "";
			$this->nama->EditValue = ew_HtmlEncode($this->nama->CurrentValue);
			$this->nama->PlaceHolder = ew_RemoveHtml($this->nama->FldCaption());

			// no_kwitansi
			$this->no_kwitansi->EditAttrs["class"] = "form-control";
			$this->no_kwitansi->EditCustomAttributes = "";
			$this->no_kwitansi->EditValue = ew_HtmlEncode($this->no_kwitansi->CurrentValue);
			$this->no_kwitansi->PlaceHolder = ew_RemoveHtml($this->no_kwitansi->FldCaption());

			// nomor
			$this->nomor->EditAttrs["class"] = "form-control";
			$this->nomor->EditCustomAttributes = "";
			$this->nomor->EditValue = ew_HtmlEncode($this->nomor->CurrentValue);
			$this->nomor->PlaceHolder = ew_RemoveHtml($this->nomor->FldCaption());

			// no_sertifikat
			$this->no_sertifikat->EditAttrs["class"] = "form-control";
			$this->no_sertifikat->EditCustomAttributes = "";
			$this->no_sertifikat->EditValue = ew_HtmlEncode($this->no_sertifikat->CurrentValue);
			$this->no_sertifikat->PlaceHolder = ew_RemoveHtml($this->no_sertifikat->FldCaption());

			// tgl_pelaksanaan
			$this->tgl_pelaksanaan->EditAttrs["class"] = "form-control";
			$this->tgl_pelaksanaan->EditCustomAttributes = "";
			$this->tgl_pelaksanaan->EditValue = ew_HtmlEncode(ew_FormatDateTime($this->tgl_pelaksanaan->CurrentValue, 8));
			$this->tgl_pelaksanaan->PlaceHolder = ew_RemoveHtml($this->tgl_pelaksanaan->FldCaption());

			// total_ppn
			$this->total_ppn->EditAttrs["class"] = "form-control";
			$this->total_ppn->EditCustomAttributes = "";
			$this->total_ppn->EditValue = ew_HtmlEncode($this->total_ppn->CurrentValue);
			$this->total_ppn->PlaceHolder = ew_RemoveHtml($this->total_ppn->FldCaption());
			if (strval($this->total_ppn->EditValue) <> "" && is_numeric($this->total_ppn->EditValue)) $this->total_ppn->EditValue = ew_FormatNumber($this->total_ppn->EditValue, -2, -1, -2, 0);

			// Edit refer script
			// temp_id

			$this->temp_id->LinkCustomAttributes = "";
			$this->temp_id->HrefValue = "";

			// tanggal
			$this->tanggal->LinkCustomAttributes = "";
			$this->tanggal->HrefValue = "";

			// nama
			$this->nama->LinkCustomAttributes = "";
			$this->nama->HrefValue = "";

			// no_kwitansi
			$this->no_kwitansi->LinkCustomAttributes = "";
			$this->no_kwitansi->HrefValue = "";

			// nomor
			$this->nomor->LinkCustomAttributes = "";
			$this->nomor->HrefValue = "";

			// no_sertifikat
			$this->no_sertifikat->LinkCustomAttributes = "";
			$this->no_sertifikat->HrefValue = "";

			// tgl_pelaksanaan
			$this->tgl_pelaksanaan->LinkCustomAttributes = "";
			$this->tgl_pelaksanaan->HrefValue = "";

			// total_ppn
			$this->total_ppn->LinkCustomAttributes = "";
			$this->total_ppn->HrefValue = "";
		}
		if ($this->RowType == EW_ROWTYPE_ADD ||
			$this->RowType == EW_ROWTYPE_EDIT ||
			$this->RowType == EW_ROWTYPE_SEARCH) { // Add / Edit / Search row
			$this->SetupFieldTitles();
		}

		// Call Row Rendered event
		if ($this->RowType <> EW_ROWTYPE_AGGREGATEINIT)
			$this->Row_Rendered();
	}

	// Validate form
	function ValidateForm() {
		global $Language, $gsFormError;

		// Initialize form error message
		$gsFormError = "";

		// Check if validation required
		if (!EW_SERVER_VALIDATE)
			return ($gsFormError == "");
		if (!$this->tanggal->FldIsDetailKey && !is_null($this->tanggal->FormValue) && $this->tanggal->FormValue == "") {
			ew_AddMessage($gsFormError, str_replace("%s", $this->tanggal->FldCaption(), $this->tanggal->ReqErrMsg));
		}
		if (!ew_CheckDateDef($this->tanggal->FormValue)) {
			ew_AddMessage($gsFormError, $this->tanggal->FldErrMsg());
		}
		if (!$this->nama->FldIsDetailKey && !is_null($this->nama->FormValue) && $this->nama->FormValue == "") {
			ew_AddMessage($gsFormError, str_replace("%s", $this->nama->FldCaption(), $this->nama->ReqErrMsg));
		}
		if (!$this->no_kwitansi->FldIsDetailKey && !is_null($this->no_kwitansi->FormValue) && $this->no_kwitansi->FormValue == "") {
			ew_AddMessage($gsFormError, str_replace("%s", $this->no_kwitansi->FldCaption(), $this->no_kwitansi->ReqErrMsg));
		}
		if (!$this->nomor->FldIsDetailKey && !is_null($this->nomor->FormValue) && $this->nomor->FormValue == "") {
			ew_AddMessage($gsFormError, str_replace("%s", $this->nomor->FldCaption(), $this->nomor->ReqErrMsg));
		}
		if (!$this->no_sertifikat->FldIsDetailKey && !is_null($this->no_sertifikat->FormValue) && $this->no_sertifikat->FormValue == "") {
			ew_AddMessage($gsFormError, str_replace("%s", $this->no_sertifikat->FldCaption(), $this->no_sertifikat->ReqErrMsg));
		}
		if (!$this->tgl_pelaksanaan->FldIsDetailKey && !is_null($this->tgl_pelaksanaan->FormValue) && $this->tgl_pelaksanaan->FormValue == "") {
			ew_AddMessage($gsFormError, str_replace("%s", $this->tgl_pelaksanaan->FldCaption(), $this->tgl_pelaksanaan->ReqErrMsg));
		}
		if (!ew_CheckDateDef($this->tgl_pelaksanaan->FormValue)) {
			ew_AddMessage($gsFormError, $this->tgl_pelaksanaan->FldErrMsg());
		}
		if (!$this->total_ppn->FldIsDetailKey && !is_null($this->total_ppn->FormValue) && $this->total_ppn->FormValue == "") {
			ew_AddMessage($gsFormError, str_replace("%s", $this->total_ppn->FldCaption(), $this->total_ppn->ReqErrMsg));
		}
		if (!ew_CheckNumber($this->total_ppn->FormValue)) {
			ew_AddMessage($gsFormError, $this->total_ppn->FldErrMsg());
		}

		// Return validate result
		$ValidateForm = ($gsFormError == "");

		// Call Form_CustomValidate event
		$sFormCustomError = "";
		$ValidateForm = $ValidateForm && $this->Form_CustomValidate($sFormCustomError);
		if ($sFormCustomError <> "") {
			ew_AddMessage($gsFormError, $sFormCustomError);
		}
		return $ValidateForm;
	}

	// Update record based on key values
	function EditRow() {
		global $Security, $Language;
		$sFilter = $this->KeyFilter();
		$sFilter = $this->ApplyUserIDFilters($sFilter);
		$conn = &$this->Connection();
		$this->CurrentFilter = $sFilter;
		$sSql = $this->SQL();
		$conn->raiseErrorFn = $GLOBALS["EW_ERROR_FN"];
		$rs = $conn->Execute($sSql);
		$conn->raiseErrorFn = '';
		if ($rs === FALSE)
			return FALSE;
		if ($rs->EOF) {
			$this->setFailureMessage($Language->Phrase("NoRecord")); // Set no record message
			$EditRow = FALSE; // Update Failed
		} else {

			// Save old values
			$rsold = &$rs->fields;
			$this->LoadDbValues($rsold);
			$rsnew = array();

			// tanggal
			$this->tanggal->SetDbValueDef($rsnew, ew_UnFormatDateTime($this->tanggal->CurrentValue, 0), ew_CurrentDate(), $this->tanggal->ReadOnly);

			// nama
			$this->nama->SetDbValueDef($rsnew, $this->nama->CurrentValue, "", $this->nama->ReadOnly);

			// no_kwitansi
			$this->no_kwitansi->SetDbValueDef($rsnew, $this->no_kwitansi->CurrentValue, "", $this->no_kwitansi->ReadOnly);

			// nomor
			$this->nomor->SetDbValueDef($rsnew, $this->nomor->CurrentValue, "", $this->nomor->ReadOnly);

			// no_sertifikat
			$this->no_sertifikat->SetDbValueDef($rsnew, $this->no_sertifikat->CurrentValue, "", $this->no_sertifikat->ReadOnly);

			// tgl_pelaksanaan
			$this->tgl_pelaksanaan->SetDbValueDef($rsnew, ew_UnFormatDateTime($this->tgl_pelaksanaan->CurrentValue, 0), ew_CurrentDate(), $this->tgl_pelaksanaan->ReadOnly);

			// total_ppn
			$this->total_ppn->SetDbValueDef($rsnew, $this->total_ppn->CurrentValue, 0, $this->total_ppn->ReadOnly);

			// Call Row Updating event
			$bUpdateRow = $this->Row_Updating($rsold, $rsnew);
			if ($bUpdateRow) {
				$conn->raiseErrorFn = $GLOBALS["EW_ERROR_FN"];
				if (count($rsnew) > 0)
					$EditRow = $this->Update($rsnew, "", $rsold);
				else
					$EditRow = TRUE; // No field to update
				$conn->raiseErrorFn = '';
				if ($EditRow) {
				}
			} else {
				if ($this->getSuccessMessage() <> "" || $this->getFailureMessage() <> "") {

					// Use the message, do nothing
				} elseif ($this->CancelMessage <> "") {
					$this->setFailureMessage($this->CancelMessage);
					$this->CancelMessage = "";
				} else {
					$this->setFailureMessage($Language->Phrase("UpdateCancelled"));
				}
				$EditRow = FALSE;
			}
		}

		// Call Row_Updated event
		if ($EditRow)
			$this->Row_Updated($rsold, $rsnew);
		$rs->Close();
		return $EditRow;
	}

	// Set up Breadcrumb
	function SetupBreadcrumb() {
		global $Breadcrumb, $Language;
		$Breadcrumb = new cBreadcrumb();
		$url = substr(ew_CurrentUrl(), strrpos(ew_CurrentUrl(), "/")+1);
		$Breadcrumb->Add("list", $this->TableVar, $this->AddMasterUrl("t_tmp_invoice_alllist.php"), "", $this->TableVar, TRUE);
		$PageId = "edit";
		$Breadcrumb->Add("edit", $PageId, $url);
	}

	// Setup lookup filters of a field
	function SetupLookupFilters($fld, $pageId = null) {
		global $gsLanguage;
		$pageId = $pageId ?: $this->PageID;
		switch ($fld->FldVar) {
		}
	}

	// Setup AutoSuggest filters of a field
	function SetupAutoSuggestFilters($fld, $pageId = null) {
		global $gsLanguage;
		$pageId = $pageId ?: $this->PageID;
		switch ($fld->FldVar) {
		}
	}

	// Page Load event
	function Page_Load() {

		//echo "Page Load";
	}

	// Page Unload event
	function Page_Unload() {

		//echo "Page Unload";
	}

	// Page Redirecting event
	function Page_Redirecting(&$url) {

		// Example:
		//$url = "your URL";

	}

	// Message Showing event
	// $type = ''|'success'|'failure'|'warning'
	function Message_Showing(&$msg, $type) {
		if ($type == 'success') {

			//$msg = "your success message";
		} elseif ($type == 'failure') {

			//$msg = "your failure message";
		} elseif ($type == 'warning') {

			//$msg = "your warning message";
		} else {

			//$msg = "your message";
		}
	}

	// Page Render event
	function Page_Render() {

		//echo "Page Render";
	}

	// Page Data Rendering event
	function Page_DataRendering(&$header) {

		// Example:
		//$header = "your header";

	}

	// Page Data Rendered event
	function Page_DataRendered(&$footer) {

		// Example:
		//$footer = "your footer";

	}

	// Form Custom Validate event
	function Form_CustomValidate(&$CustomError) {

		// Return error message in CustomError
		return TRUE;
	}
}
?>
<?php ew_Header(FALSE) ?>
<?php

// Create page object
if (!isset($t_tmp_invoice_all_edit)) $t_tmp_invoice_all_edit = new ct_tmp_invoice_all_edit();

// Page init
$t_tmp_invoice_all_edit->Page_Init();

// Page main
$t_tmp_invoice_all_edit->Page_Main();

// Global Page Rendering event (in userfn*.php)
Page_Rendering();

// Page Rendering event
$t_tmp_invoice_all_edit->Page_Render();
?>
<?php include_once "header.php" ?>
<script type="text/javascript">

// Form object
var CurrentPageID = EW_PAGE_ID = "edit";
var CurrentForm = ft_tmp_invoice_alledit = new ew_Form("ft_tmp_invoice_alledit", "edit");

// Validate form
ft_tmp_invoice_alledit.Validate = function() {
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
			elm = this.GetElements("x" + infix + "_tanggal");
			if (elm && !ew_IsHidden(elm) && !ew_HasValue(elm))
				return this.OnError(elm, "<?php echo ew_JsEncode2(str_replace("%s", $t_tmp_invoice_all->tanggal->FldCaption(), $t_tmp_invoice_all->tanggal->ReqErrMsg)) ?>");
			elm = this.GetElements("x" + infix + "_tanggal");
			if (elm && !ew_CheckDateDef(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t_tmp_invoice_all->tanggal->FldErrMsg()) ?>");
			elm = this.GetElements("x" + infix + "_nama");
			if (elm && !ew_IsHidden(elm) && !ew_HasValue(elm))
				return this.OnError(elm, "<?php echo ew_JsEncode2(str_replace("%s", $t_tmp_invoice_all->nama->FldCaption(), $t_tmp_invoice_all->nama->ReqErrMsg)) ?>");
			elm = this.GetElements("x" + infix + "_no_kwitansi");
			if (elm && !ew_IsHidden(elm) && !ew_HasValue(elm))
				return this.OnError(elm, "<?php echo ew_JsEncode2(str_replace("%s", $t_tmp_invoice_all->no_kwitansi->FldCaption(), $t_tmp_invoice_all->no_kwitansi->ReqErrMsg)) ?>");
			elm = this.GetElements("x" + infix + "_nomor");
			if (elm && !ew_IsHidden(elm) && !ew_HasValue(elm))
				return this.OnError(elm, "<?php echo ew_JsEncode2(str_replace("%s", $t_tmp_invoice_all->nomor->FldCaption(), $t_tmp_invoice_all->nomor->ReqErrMsg)) ?>");
			elm = this.GetElements("x" + infix + "_no_sertifikat");
			if (elm && !ew_IsHidden(elm) && !ew_HasValue(elm))
				return this.OnError(elm, "<?php echo ew_JsEncode2(str_replace("%s", $t_tmp_invoice_all->no_sertifikat->FldCaption(), $t_tmp_invoice_all->no_sertifikat->ReqErrMsg)) ?>");
			elm = this.GetElements("x" + infix + "_tgl_pelaksanaan");
			if (elm && !ew_IsHidden(elm) && !ew_HasValue(elm))
				return this.OnError(elm, "<?php echo ew_JsEncode2(str_replace("%s", $t_tmp_invoice_all->tgl_pelaksanaan->FldCaption(), $t_tmp_invoice_all->tgl_pelaksanaan->ReqErrMsg)) ?>");
			elm = this.GetElements("x" + infix + "_tgl_pelaksanaan");
			if (elm && !ew_CheckDateDef(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t_tmp_invoice_all->tgl_pelaksanaan->FldErrMsg()) ?>");
			elm = this.GetElements("x" + infix + "_total_ppn");
			if (elm && !ew_IsHidden(elm) && !ew_HasValue(elm))
				return this.OnError(elm, "<?php echo ew_JsEncode2(str_replace("%s", $t_tmp_invoice_all->total_ppn->FldCaption(), $t_tmp_invoice_all->total_ppn->ReqErrMsg)) ?>");
			elm = this.GetElements("x" + infix + "_total_ppn");
			if (elm && !ew_CheckNumber(elm.value))
				return this.OnError(elm, "<?php echo ew_JsEncode2($t_tmp_invoice_all->total_ppn->FldErrMsg()) ?>");

			// Fire Form_CustomValidate event
			if (!this.Form_CustomValidate(fobj))
				return false;
	}

	// Process detail forms
	var dfs = $fobj.find("input[name='detailpage']").get();
	for (var i = 0; i < dfs.length; i++) {
		var df = dfs[i], val = df.value;
		if (val && ewForms[val])
			if (!ewForms[val].Validate())
				return false;
	}
	return true;
}

// Form_CustomValidate event
ft_tmp_invoice_alledit.Form_CustomValidate = 
 function(fobj) { // DO NOT CHANGE THIS LINE!

 	// Your custom validation code here, return false if invalid. 
 	return true;
 }

// Use JavaScript validation or not
<?php if (EW_CLIENT_VALIDATE) { ?>
ft_tmp_invoice_alledit.ValidateRequired = true;
<?php } else { ?>
ft_tmp_invoice_alledit.ValidateRequired = false; 
<?php } ?>

// Dynamic selection lists
// Form object for search

</script>
<script type="text/javascript">

// Write your client script here, no need to add script tags.
</script>
<?php if (!$t_tmp_invoice_all_edit->IsModal) { ?>
<div class="ewToolbar">
<?php $Breadcrumb->Render(); ?>
<?php echo $Language->SelectionForm(); ?>
<div class="clearfix"></div>
</div>
<?php } ?>
<?php $t_tmp_invoice_all_edit->ShowPageHeader(); ?>
<?php
$t_tmp_invoice_all_edit->ShowMessage();
?>
<form name="ft_tmp_invoice_alledit" id="ft_tmp_invoice_alledit" class="<?php echo $t_tmp_invoice_all_edit->FormClassName ?>" action="<?php echo ew_CurrentPage() ?>" method="post">
<?php if ($t_tmp_invoice_all_edit->CheckToken) { ?>
<input type="hidden" name="<?php echo EW_TOKEN_NAME ?>" value="<?php echo $t_tmp_invoice_all_edit->Token ?>">
<?php } ?>
<input type="hidden" name="t" value="t_tmp_invoice_all">
<input type="hidden" name="a_edit" id="a_edit" value="U">
<?php if ($t_tmp_invoice_all_edit->IsModal) { ?>
<input type="hidden" name="modal" value="1">
<?php } ?>
<div>
<?php if ($t_tmp_invoice_all->temp_id->Visible) { // temp_id ?>
	<div id="r_temp_id" class="form-group">
		<label id="elh_t_tmp_invoice_all_temp_id" class="col-sm-2 control-label ewLabel"><?php echo $t_tmp_invoice_all->temp_id->FldCaption() ?></label>
		<div class="col-sm-10"><div<?php echo $t_tmp_invoice_all->temp_id->CellAttributes() ?>>
<span id="el_t_tmp_invoice_all_temp_id">
<span<?php echo $t_tmp_invoice_all->temp_id->ViewAttributes() ?>>
<p class="form-control-static"><?php echo $t_tmp_invoice_all->temp_id->EditValue ?></p></span>
</span>
<input type="hidden" data-table="t_tmp_invoice_all" data-field="x_temp_id" name="x_temp_id" id="x_temp_id" value="<?php echo ew_HtmlEncode($t_tmp_invoice_all->temp_id->CurrentValue) ?>">
<?php echo $t_tmp_invoice_all->temp_id->CustomMsg ?></div></div>
	</div>
<?php } ?>
<?php if ($t_tmp_invoice_all->tanggal->Visible) { // tanggal ?>
	<div id="r_tanggal" class="form-group">
		<label id="elh_t_tmp_invoice_all_tanggal" for="x_tanggal" class="col-sm-2 control-label ewLabel"><?php echo $t_tmp_invoice_all->tanggal->FldCaption() ?><?php echo $Language->Phrase("FieldRequiredIndicator") ?></label>
		<div class="col-sm-10"><div<?php echo $t_tmp_invoice_all->tanggal->CellAttributes() ?>>
<span id="el_t_tmp_invoice_all_tanggal">
<input type="text" data-table="t_tmp_invoice_all" data-field="x_tanggal" name="x_tanggal" id="x_tanggal" placeholder="<?php echo ew_HtmlEncode($t_tmp_invoice_all->tanggal->getPlaceHolder()) ?>" value="<?php echo $t_tmp_invoice_all->tanggal->EditValue ?>"<?php echo $t_tmp_invoice_all->tanggal->EditAttributes() ?>>
</span>
<?php echo $t_tmp_invoice_all->tanggal->CustomMsg ?></div></div>
	</div>
<?php } ?>
<?php if ($t_tmp_invoice_all->nama->Visible) { // nama ?>
	<div id="r_nama" class="form-group">
		<label id="elh_t_tmp_invoice_all_nama" for="x_nama" class="col-sm-2 control-label ewLabel"><?php echo $t_tmp_invoice_all->nama->FldCaption() ?><?php echo $Language->Phrase("FieldRequiredIndicator") ?></label>
		<div class="col-sm-10"><div<?php echo $t_tmp_invoice_all->nama->CellAttributes() ?>>
<span id="el_t_tmp_invoice_all_nama">
<input type="text" data-table="t_tmp_invoice_all" data-field="x_nama" name="x_nama" id="x_nama" size="30" maxlength="50" placeholder="<?php echo ew_HtmlEncode($t_tmp_invoice_all->nama->getPlaceHolder()) ?>" value="<?php echo $t_tmp_invoice_all->nama->EditValue ?>"<?php echo $t_tmp_invoice_all->nama->EditAttributes() ?>>
</span>
<?php echo $t_tmp_invoice_all->nama->CustomMsg ?></div></div>
	</div>
<?php } ?>
<?php if ($t_tmp_invoice_all->no_kwitansi->Visible) { // no_kwitansi ?>
	<div id="r_no_kwitansi" class="form-group">
		<label id="elh_t_tmp_invoice_all_no_kwitansi" for="x_no_kwitansi" class="col-sm-2 control-label ewLabel"><?php echo $t_tmp_invoice_all->no_kwitansi->FldCaption() ?><?php echo $Language->Phrase("FieldRequiredIndicator") ?></label>
		<div class="col-sm-10"><div<?php echo $t_tmp_invoice_all->no_kwitansi->CellAttributes() ?>>
<span id="el_t_tmp_invoice_all_no_kwitansi">
<input type="text" data-table="t_tmp_invoice_all" data-field="x_no_kwitansi" name="x_no_kwitansi" id="x_no_kwitansi" size="30" maxlength="100" placeholder="<?php echo ew_HtmlEncode($t_tmp_invoice_all->no_kwitansi->getPlaceHolder()) ?>" value="<?php echo $t_tmp_invoice_all->no_kwitansi->EditValue ?>"<?php echo $t_tmp_invoice_all->no_kwitansi->EditAttributes() ?>>
</span>
<?php echo $t_tmp_invoice_all->no_kwitansi->CustomMsg ?></div></div>
	</div>
<?php } ?>
<?php if ($t_tmp_invoice_all->nomor->Visible) { // nomor ?>
	<div id="r_nomor" class="form-group">
		<label id="elh_t_tmp_invoice_all_nomor" for="x_nomor" class="col-sm-2 control-label ewLabel"><?php echo $t_tmp_invoice_all->nomor->FldCaption() ?><?php echo $Language->Phrase("FieldRequiredIndicator") ?></label>
		<div class="col-sm-10"><div<?php echo $t_tmp_invoice_all->nomor->CellAttributes() ?>>
<span id="el_t_tmp_invoice_all_nomor">
<input type="text" data-table="t_tmp_invoice_all" data-field="x_nomor" name="x_nomor" id="x_nomor" size="30" maxlength="100" placeholder="<?php echo ew_HtmlEncode($t_tmp_invoice_all->nomor->getPlaceHolder()) ?>" value="<?php echo $t_tmp_invoice_all->nomor->EditValue ?>"<?php echo $t_tmp_invoice_all->nomor->EditAttributes() ?>>
</span>
<?php echo $t_tmp_invoice_all->nomor->CustomMsg ?></div></div>
	</div>
<?php } ?>
<?php if ($t_tmp_invoice_all->no_sertifikat->Visible) { // no_sertifikat ?>
	<div id="r_no_sertifikat" class="form-group">
		<label id="elh_t_tmp_invoice_all_no_sertifikat" for="x_no_sertifikat" class="col-sm-2 control-label ewLabel"><?php echo $t_tmp_invoice_all->no_sertifikat->FldCaption() ?><?php echo $Language->Phrase("FieldRequiredIndicator") ?></label>
		<div class="col-sm-10"><div<?php echo $t_tmp_invoice_all->no_sertifikat->CellAttributes() ?>>
<span id="el_t_tmp_invoice_all_no_sertifikat">
<textarea data-table="t_tmp_invoice_all" data-field="x_no_sertifikat" name="x_no_sertifikat" id="x_no_sertifikat" cols="35" rows="4" placeholder="<?php echo ew_HtmlEncode($t_tmp_invoice_all->no_sertifikat->getPlaceHolder()) ?>"<?php echo $t_tmp_invoice_all->no_sertifikat->EditAttributes() ?>><?php echo $t_tmp_invoice_all->no_sertifikat->EditValue ?></textarea>
</span>
<?php echo $t_tmp_invoice_all->no_sertifikat->CustomMsg ?></div></div>
	</div>
<?php } ?>
<?php if ($t_tmp_invoice_all->tgl_pelaksanaan->Visible) { // tgl_pelaksanaan ?>
	<div id="r_tgl_pelaksanaan" class="form-group">
		<label id="elh_t_tmp_invoice_all_tgl_pelaksanaan" for="x_tgl_pelaksanaan" class="col-sm-2 control-label ewLabel"><?php echo $t_tmp_invoice_all->tgl_pelaksanaan->FldCaption() ?><?php echo $Language->Phrase("FieldRequiredIndicator") ?></label>
		<div class="col-sm-10"><div<?php echo $t_tmp_invoice_all->tgl_pelaksanaan->CellAttributes() ?>>
<span id="el_t_tmp_invoice_all_tgl_pelaksanaan">
<input type="text" data-table="t_tmp_invoice_all" data-field="x_tgl_pelaksanaan" name="x_tgl_pelaksanaan" id="x_tgl_pelaksanaan" placeholder="<?php echo ew_HtmlEncode($t_tmp_invoice_all->tgl_pelaksanaan->getPlaceHolder()) ?>" value="<?php echo $t_tmp_invoice_all->tgl_pelaksanaan->EditValue ?>"<?php echo $t_tmp_invoice_all->tgl_pelaksanaan->EditAttributes() ?>>
</span>
<?php echo $t_tmp_invoice_all->tgl_pelaksanaan->CustomMsg ?></div></div>
	</div>
<?php } ?>
<?php if ($t_tmp_invoice_all->total_ppn->Visible) { // total_ppn ?>
	<div id="r_total_ppn" class="form-group">
		<label id="elh_t_tmp_invoice_all_total_ppn" for="x_total_ppn" class="col-sm-2 control-label ewLabel"><?php echo $t_tmp_invoice_all->total_ppn->FldCaption() ?><?php echo $Language->Phrase("FieldRequiredIndicator") ?></label>
		<div class="col-sm-10"><div<?php echo $t_tmp_invoice_all->total_ppn->CellAttributes() ?>>
<span id="el_t_tmp_invoice_all_total_ppn">
<input type="text" data-table="t_tmp_invoice_all" data-field="x_total_ppn" name="x_total_ppn" id="x_total_ppn" size="30" placeholder="<?php echo ew_HtmlEncode($t_tmp_invoice_all->total_ppn->getPlaceHolder()) ?>" value="<?php echo $t_tmp_invoice_all->total_ppn->EditValue ?>"<?php echo $t_tmp_invoice_all->total_ppn->EditAttributes() ?>>
</span>
<?php echo $t_tmp_invoice_all->total_ppn->CustomMsg ?></div></div>
	</div>
<?php } ?>
</div>
<?php if (!$t_tmp_invoice_all_edit->IsModal) { ?>
<div class="form-group">
	<div class="col-sm-offset-2 col-sm-10">
<button class="btn btn-primary ewButton" name="btnAction" id="btnAction" type="submit"><?php echo $Language->Phrase("SaveBtn") ?></button>
<button class="btn btn-default ewButton" name="btnCancel" id="btnCancel" type="button" data-href="<?php echo $t_tmp_invoice_all_edit->getReturnUrl() ?>"><?php echo $Language->Phrase("CancelBtn") ?></button>
	</div>
</div>
<?php } ?>
</form>
<script type="text/javascript">
ft_tmp_invoice_alledit.Init();
</script>
<?php
$t_tmp_invoice_all_edit->ShowPageFooter();
if (EW_DEBUG_ENABLED)
	echo ew_DebugMsg();
?>
<script type="text/javascript">

// Write your table-specific startup script here
// document.write("page loaded");

</script>
<?php include_once "footer.php" ?>
<?php
$t_tmp_invoice_all_edit->Page_Terminate();
?>
