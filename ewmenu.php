<!-- Begin Main Menu -->
<?php $RootMenu = new cMenu(EW_MENUBAR_ID) ?>
<?php

// Generate all menu items
$RootMenu->IsRoot = TRUE;
$RootMenu->AddMenuItem(11, "mi_home_php", $Language->MenuPhrase("11", "MenuText"), "home.php", -1, "", AllowListMenu('{02A4272B-E84A-463D-9ED2-75398DF0A44A}home.php'), FALSE, TRUE);
$RootMenu->AddMenuItem(12, "mci_Master", $Language->MenuPhrase("12", "MenuText"), "", -1, "", TRUE, FALSE, TRUE);
$RootMenu->AddMenuItem(2, "mi_t_customer", $Language->MenuPhrase("2", "MenuText"), "t_customerlist.php", 12, "", AllowListMenu('{02A4272B-E84A-463D-9ED2-75398DF0A44A}t_customer'), FALSE, FALSE);
$RootMenu->AddMenuItem(3, "mi_t_fee", $Language->MenuPhrase("3", "MenuText"), "t_feelist.php", 12, "", AllowListMenu('{02A4272B-E84A-463D-9ED2-75398DF0A44A}t_fee'), FALSE, FALSE);
$RootMenu->AddMenuItem(8, "mi_t_user", $Language->MenuPhrase("8", "MenuText"), "t_userlist.php", 12, "", AllowListMenu('{02A4272B-E84A-463D-9ED2-75398DF0A44A}t_user'), FALSE, FALSE);
$RootMenu->AddMenuItem(13, "mci_Transaksi", $Language->MenuPhrase("13", "MenuText"), "", -1, "", TRUE, FALSE, TRUE);
$RootMenu->AddMenuItem(4, "mi_t_invoice", $Language->MenuPhrase("4", "MenuText"), "t_invoicelist.php", 13, "", AllowListMenu('{02A4272B-E84A-463D-9ED2-75398DF0A44A}t_invoice'), FALSE, FALSE);
$RootMenu->AddMenuItem(10012, "mci_Laporan", $Language->MenuPhrase("10012", "MenuText"), "", -1, "{A9671DEB-57B5-48F0-BE68-784D09E2FE7C}", IsLoggedIn(), FALSE, TRUE);
$RootMenu->AddMenuItem(10011, "mri_r5frekap5finvoice5fall", $Language->MenuPhrase("10011", "MenuText"), "r_rekap_invoice_allsmry.php", 10012, "{A9671DEB-57B5-48F0-BE68-784D09E2FE7C}", AllowListMenu('{A9671DEB-57B5-48F0-BE68-784D09E2FE7C}r_rekap_invoice_all'), FALSE, FALSE);
$RootMenu->AddMenuItem(-2, "mi_changepwd", $Language->Phrase("ChangePwd"), "changepwd.php", -1, "", IsLoggedIn() && !IsSysAdmin());
$RootMenu->AddMenuItem(-1, "mi_logout", $Language->Phrase("Logout"), "logout.php", -1, "", IsLoggedIn());
$RootMenu->AddMenuItem(-1, "mi_login", $Language->Phrase("Login"), "login.php", -1, "", !IsLoggedIn() && substr(@$_SERVER["URL"], -1 * strlen("login.php")) <> "login.php");
$RootMenu->Render();
?>
<!-- End Main Menu -->
