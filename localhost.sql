
--

-- --------------------------------------------------------

--
-- Table structure for table `CONF_SMTP`
--

CREATE TABLE IF NOT EXISTS `CONF_SMTP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HOSTNAME` varchar(150) NOT NULL,
  `PORT` int(3) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `Auth` varchar(5) NOT NULL DEFAULT 'true',
  `SMTPSecure` varchar(10) NOT NULL DEFAULT 'false',
  `SMTPDebug` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `CONF_SMTP`
--

INSERT INTO `CONF_SMTP` (`ID`, `HOSTNAME`, `PORT`, `USERNAME`, `PASSWORD`, `Auth`, `SMTPSecure`, `SMTPDebug`) VALUES
(1, 'mail.grupoinkasa.com', 25, 'aciweb@grupoinkasa.com', 'aci123', 'true', 'false', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `CTA_GL_CONF`
--

CREATE TABLE IF NOT EXISTS `CTA_GL_CONF` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CTA_CXP` varchar(8) NOT NULL,
  `CTA_PUR` varchar(8) NOT NULL,
  `CTA_TAX` varchar(8) NOT NULL,
  `ID_compania` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `CompanySession`
--

CREATE TABLE IF NOT EXISTS `CompanySession` (
  `ID_compania` bigint(20) NOT NULL,
  `CompanyNameSage50` varchar(50) NOT NULL,
  `isConnected` tinyint(1) NOT NULL,
  `LAST_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_compania`,`CompanyNameSage50`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CompanySession`
--

INSERT INTO `CompanySession` (`ID_compania`, `CompanyNameSage50`, `isConnected`, `LAST_CHANGE`) VALUES
(1, 'Ingenieria Orion', 1, '2017-07-14 15:01:30');

-- --------------------------------------------------------

--
-- Table structure for table `Customer_Credit_Memo_Detail_Imp`
--

CREATE TABLE IF NOT EXISTS `Customer_Credit_Memo_Detail_Imp` (
  `DetailID` bigint(20) NOT NULL,
  `TransactionID` bigint(20) NOT NULL,
  `ID_compania` int(11) NOT NULL,
  `Item_id` varchar(20) NOT NULL,
  `Description` varchar(160) NOT NULL,
  `GL_Acct` varchar(15) NOT NULL,
  `Quantity` decimal(18,4) NOT NULL,
  `Unit_Price` decimal(18,4) NOT NULL,
  `Net_line` decimal(18,4) NOT NULL,
  `JobID` varchar(20) NOT NULL,
  `JobPhaseID` varchar(20) NOT NULL,
  `JobCostCodeID` varchar(20) NOT NULL,
  `Tax_Type` int(11) NOT NULL,
  PRIMARY KEY (`DetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Customer_Credit_Memo_Header_Imp`
--

CREATE TABLE IF NOT EXISTS `Customer_Credit_Memo_Header_Imp` (
  `TransactionID` bigint(20) NOT NULL,
  `ID_compania` int(11) NOT NULL,
  `ID_companiaOrigen` int(11) NOT NULL,
  `CreditNumber` varchar(20) NOT NULL,
  `CustomerID` varchar(20) NOT NULL,
  `CustomerName` varchar(39) NOT NULL,
  `AR_Account` varchar(10) NOT NULL,
  `TaxID` varchar(8) NOT NULL,
  `Subtotal` decimal(18,4) NOT NULL,
  `Net_Credit_due` decimal(18,4) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `Created` varchar(10) NOT NULL,
  `Export_date` varchar(10) NOT NULL,
  `Enviado` tinyint(1) DEFAULT '0',
  `Error` tinyint(1) DEFAULT '0',
  `ErrorPT` varchar(20) NOT NULL,
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Customer_Receipt_Detail_Imp`
--

CREATE TABLE IF NOT EXISTS `Customer_Receipt_Detail_Imp` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `ID_compania` int(11) DEFAULT NULL,
  `UniqueReceiptID` bigint(20) DEFAULT NULL,
  `ApplyTo` tinyint(4) DEFAULT NULL,
  `InvoiceNumber` varchar(20) DEFAULT NULL,
  `Description` varchar(160) DEFAULT NULL,
  `Net_line` decimal(18,4) DEFAULT NULL,
  `Quantity` decimal(18,4) DEFAULT NULL,
  `Item_id` varchar(20) DEFAULT NULL,
  `Unit_Price` decimal(18,4) DEFAULT NULL,
  `Taxable` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Customer_Receipt_Header_Imp`
--

CREATE TABLE IF NOT EXISTS `Customer_Receipt_Header_Imp` (
  `ID_compania` int(11) NOT NULL DEFAULT '0',
  `ID_companiaOrigen` int(11) DEFAULT NULL,
  `UniqueReceiptID` bigint(20) NOT NULL,
  `CheckNumber` varchar(20) NOT NULL DEFAULT '',
  `ReceiptNumber` varchar(20) NOT NULL DEFAULT '',
  `CustomerID` varchar(20) NOT NULL,
  `CustomerName` varchar(39) NOT NULL,
  `Total` decimal(18,4) NOT NULL,
  `Method_of_Payment` varchar(20) NOT NULL,
  `TaxID` varchar(8) NOT NULL,
  `SalesRepID` varchar(20) NOT NULL DEFAULT '0',
  `CashAccountID` varchar(15) NOT NULL,
  `Prepayment` tinyint(1) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `Created` varchar(10) NOT NULL,
  `Export_date` varchar(10) NOT NULL,
  `Enviado` tinyint(1) DEFAULT '0',
  `Error` tinyint(1) DEFAULT '0',
  `ErrorPT` varchar(20) NOT NULL,
  PRIMARY KEY (`UniqueReceiptID`,`ID_compania`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Customers_Imp`
--

CREATE TABLE IF NOT EXISTS `Customers_Imp` (
  `ID_compania` int(11) DEFAULT NULL,
  `ID_companiaOrigen` int(11) DEFAULT NULL,
  `CustomerID` varchar(20) DEFAULT NULL,
  `Customer_Bill_Name` varchar(39) DEFAULT NULL,
  `AddressLine1` varchar(30) DEFAULT NULL,
  `AddressLine2` varchar(30) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `Zip` varchar(12) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Telephone1` varchar(20) DEFAULT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Created` varchar(10) NOT NULL,
  `Export_date` varchar(10) NOT NULL,
  `Enviado` tinyint(1) DEFAULT '0',
  `Error` tinyint(1) DEFAULT '0',
  `ErrorPT` varchar(20) NOT NULL,
  `Custom_field1` varchar(40) DEFAULT NULL,
  `Custom_field2` varchar(40) DEFAULT NULL,
  `Custom_field3` varchar(40) DEFAULT NULL,
  `Custom_field4` varchar(40) DEFAULT NULL,
  `Custom_field5` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Job_Cost_Codes_Exp`
--

CREATE TABLE IF NOT EXISTS `Job_Cost_Codes_Exp` (
  `ID_compania` bigint(20) NOT NULL,
  `CostCodeID` varchar(20) NOT NULL,
  `Description` varchar(30) DEFAULT NULL,
  `IsActive` int(11) NOT NULL,
  PRIMARY KEY (`ID_compania`,`CostCodeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `Job_Phases_Exp`
--

CREATE TABLE IF NOT EXISTS `Job_Phases_Exp` (
  `ID_compania` bigint(20) NOT NULL,
  `PhaseID` varchar(20) NOT NULL,
  `Description` varchar(30) NOT NULL,
  `IsActive` int(11) NOT NULL,
  `JobCostCodes` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID_compania`,`PhaseID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Jobs_Exp`
--

CREATE TABLE IF NOT EXISTS `Jobs_Exp` (
  `ID_compania` bigint(20) NOT NULL,
  `JobID` varchar(20) NOT NULL,
  `Description` varchar(30) NOT NULL,
  `JobPhases` tinyint(4) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IsActive` int(11) NOT NULL,
  `LAST_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_compania`,`JobID`,`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=163 ;

-- --------------------------------------------------------

--
-- Table structure for table `MOD_MENU_CONF`
--

CREATE TABLE IF NOT EXISTS `MOD_MENU_CONF` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `mod_sales` varchar(7) NOT NULL,
  `mod_fact` varchar(7) NOT NULL,
  `mod_invt` varchar(7) NOT NULL,
  `mod_rept` varchar(7) NOT NULL,
  `mod_stock` varchar(7) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Products_Exp`
--

CREATE TABLE IF NOT EXISTS `Products_Exp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` varchar(45) NOT NULL,
  `Description` varchar(160) DEFAULT NULL,
  `QtyOnHand` decimal(18,5) DEFAULT NULL,
  `Price1` decimal(18,4) DEFAULT NULL,
  `Price2` decimal(18,4) DEFAULT NULL,
  `Price3` decimal(18,4) DEFAULT NULL,
  `Price4` decimal(18,4) DEFAULT NULL,
  `Price5` decimal(18,4) DEFAULT NULL,
  `Price6` decimal(18,4) DEFAULT NULL,
  `Price7` decimal(18,4) DEFAULT NULL,
  `Price8` decimal(18,4) DEFAULT NULL,
  `Price9` decimal(18,4) DEFAULT NULL,
  `Price10` decimal(18,4) DEFAULT NULL,
  `TaxType` int(11) DEFAULT NULL,
  `UnitMeasure` varchar(20) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `ItemClass` bigint(8) DEFAULT NULL,
  `id_compania` int(11) NOT NULL DEFAULT '0',
  `status` varchar(1024) DEFAULT NULL,
  `link_foto` varchar(255) DEFAULT NULL,
  `id_location` varchar(45) NOT NULL DEFAULT '1',
  `Custom_field1` varchar(40) DEFAULT NULL,
  `Custom_field2` varchar(40) DEFAULT NULL,
  `Custom_field3` varchar(40) DEFAULT NULL,
  `Custom_field4` varchar(40) DEFAULT NULL,
  `Custom_field5` varchar(40) DEFAULT NULL,
  `UPC_SKU` varchar(20) DEFAULT NULL,
  `GL_Sales_Acct` varchar(15) DEFAULT NULL,
  `LAST_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LastUnitCost` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`ID`,`id_compania`,`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `Products_Exp`
--
DROP TRIGGER IF EXISTS `Products_Exp_after_update`;
DELIMITER //
CREATE TRIGGER `Products_Exp_after_update` AFTER UPDATE ON `Products_Exp`
 FOR EACH ROW BEGIN


/*ubico el id del item que esta siendo actualizado*/
SET  @ITEMID = (SELECT ProductID
FROM  
Products_Exp ORDER BY LAST_CHANGE desc limit 1);

SET  @IDcomp = (SELECT id_compania
FROM  
Products_Exp ORDER BY LAST_CHANGE desc limit 1);


SET @LOTEr  =  CONCAT(@ITEMID,"0000");

SET @NEW_QTY = NEW.QtyOnHand;

SET @OLD_QTY = OLD.QtyOnHand;


/*Esto solo ocurre si en PT agrego nuevos items, o la factura de compra afecta en positivo la tabla de productos*/
IF @NEW_QTY > @OLD_QTY 
THEN  


/*Guardo la variable de cantidad de aumento*/ 
SET @NOW_QTY = @NEW_QTY - @OLD_QTY ;


/* Actualizo cantidad en la ubicacion por default con la nueva cantidad*/
SET @LOC_QTY = (SELECT qty FROM status_location WHERE lote = @LOTEr and ID_compania = @IDcomp  AND route = '1' and stock = '1' limit 1);

SET @UPDATE_LOC_QTY = @NOW_QTY + @LOC_QTY;

UPDATE status_location SET qty = @UPDATE_LOC_QTY WHERE lote = @LOTEr and ID_compania = @IDcomp AND route = '1' and stock = '1';



END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `products_exp_AFTER_INSERT`;
DELIMITER //
CREATE TRIGGER `products_exp_AFTER_INSERT` AFTER INSERT ON `Products_Exp`
 FOR EACH ROW BEGIN

DECLARE  ITEMID varchar(50);
DECLARE  LOTE varchar(50);
DECLARE  LOTE_QTY varchar(50);
DECLARE  Reg_KEY varchar(50);
DECLARE  IDComp INT;

SET  ITEMID = (SELECT ProductID
FROM  
Products_Exp ORDER BY ID desc limit 1);

SET  IDComp = (SELECT id_compania
FROM  
Products_Exp ORDER BY ID desc limit 1);


SET  LOTE_QTY = (SELECT QtyOnHand
FROM  
Products_Exp ORDER BY ID desc limit 1);

SET LOTE = CONCAT(ITEMID,'0000');


SET Reg_KEY = (SELECT UUID_SHORT());



INSERT INTO Prod_Lotes (REG_KEY, ProductID, no_lote,lote_qty, ID_compania) 
values (Reg_KEY, ITEMID , LOTE , '',IDComp);

INSERT INTO status_location (lote,id_product,stock,qty,route, ID_compania) 
values (LOTE, ITEMID , '1' , LOTE_QTY, '1', IDComp);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Products_Imp`
--

CREATE TABLE IF NOT EXISTS `Products_Imp` (
  `ID_compania` bigint(20) NOT NULL,
  `ProductID` varchar(20) NOT NULL,
  `Description` varchar(160) DEFAULT NULL,
  `Price1` decimal(16,4) DEFAULT NULL,
  `Price2` decimal(16,4) DEFAULT NULL,
  `Price3` decimal(16,4) DEFAULT NULL,
  `Price4` decimal(16,4) DEFAULT NULL,
  `Price5` decimal(16,4) DEFAULT NULL,
  `Price6` decimal(16,4) DEFAULT NULL,
  `Price7` decimal(16,4) DEFAULT NULL,
  `Price8` decimal(16,4) DEFAULT NULL,
  `Price9` decimal(16,4) DEFAULT NULL,
  `Price10` decimal(16,4) DEFAULT NULL,
  `TaxType` bigint(20) DEFAULT NULL,
  `Custom_field1` varchar(40) DEFAULT NULL,
  `Custom_field2` varchar(40) DEFAULT NULL,
  `Custom_field3` varchar(40) DEFAULT NULL,
  `Custom_field4` varchar(40) DEFAULT NULL,
  `Custom_field5` varchar(40) DEFAULT NULL,
  `UnitMeasure` varchar(20) DEFAULT NULL,
  `GL_Sales_Acct` varchar(15) DEFAULT NULL,
  `Export_date` datetime DEFAULT NULL,
  `Enviado` tinyint(1) DEFAULT NULL,
  `Error` tinyint(1) DEFAULT NULL,
  `ErrorPT` varchar(1024) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PurOrdr_Detail_Exp`
--

CREATE TABLE IF NOT EXISTS `PurOrdr_Detail_Exp` (
  `ID_compania` bigint(20) NOT NULL,
  `ID_companiaOrigen` int(11) NOT NULL,
  `TransactionID` bigint(20) NOT NULL,
  `RowIndex` int(11) NOT NULL,
  `Item_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(255) NOT NULL,
  `GL_AccountID` varchar(15) NOT NULL,
  `Quantity` decimal(11,4) NOT NULL,
  `Unit_Price` decimal(16,4) NOT NULL,
  `NetLine` decimal(16,2) NOT NULL,
  `QuantityReceived` decimal(16,4) NOT NULL,
  `JobID` varchar(20) NOT NULL,
  `JobPhaseID` varchar(20) NOT NULL,
  `JobCostCodeID` varchar(20) NOT NULL,
  `LAST_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_compania`,`ID_companiaOrigen`,`TransactionID`,`RowIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Table structure for table `PurOrdr_Header_Exp`
--

CREATE TABLE IF NOT EXISTS `PurOrdr_Header_Exp` (
  `ID_compania` bigint(20) NOT NULL,
  `ID_companiaOrigen` int(11) NOT NULL,
  `TransactionID` bigint(20) NOT NULL,
  `PurchaseOrderNumber` varchar(20) NOT NULL,
  `VendorID` varchar(20) NOT NULL,
  `VendorName` varchar(150) NOT NULL,
  `Date` datetime NOT NULL,
  `AccountID` varchar(20) NOT NULL,
  `CustomerSO` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `Total` decimal(18,4) NOT NULL,
  `PO_Closed` tinyint(1) NOT NULL,
  `DropShip` tinyint(1) DEFAULT NULL,
  `DropShipCustomerID` varchar(20) DEFAULT NULL,
  `DropShipCustomerName` varchar(39) DEFAULT NULL,
  `WorkflowAssignee` varchar(39) DEFAULT NULL,
  `WorkflowNote` varchar(2000) DEFAULT NULL,
  `WorkflowStatusName` varchar(32) DEFAULT NULL,
  `LAST_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_compania`,`ID_companiaOrigen`,`TransactionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `REQ_DETAIL`
--

CREATE TABLE IF NOT EXISTS `REQ_DETAIL` (
  `ProductID` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `DESCRIPCION` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `CANTIDAD` decimal(18,2) DEFAULT NULL,
  `UNIDAD` varchar(15) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `JOB` varchar(50) NOT NULL,
  `PHASE` varchar(50) DEFAULT NULL,
  `CCOST` varchar(50) DEFAULT NULL,
  `NO_REQ` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ITEM_UNIQUE_NO` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `LAST_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ID_compania` int(11) NOT NULL,
  PRIMARY KEY (`NO_REQ`,`ITEM_UNIQUE_NO`),
  KEY `REQ_NO` (`NO_REQ`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



-- --------------------------------------------------------

--
-- Table structure for table `REQ_HEADER`
--

CREATE TABLE IF NOT EXISTS `REQ_HEADER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NO_REQ` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ID_compania` int(11) NOT NULL,
  `NOTA` varchar(1024) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `USER` int(11) NOT NULL,
  `DATE` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `st_closed` int(11) DEFAULT '0',
  `desc_closed` varchar(255) DEFAULT NULL,
  `LAST_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`,`NO_REQ`,`ID_compania`),
  KEY `NO_REQ` (`NO_REQ`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=436 ;

-- --------------------------------------------------------

--
-- Table structure for table `REQ_QUOTA`
--

CREATE TABLE IF NOT EXISTS `REQ_QUOTA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NO_REQ` varchar(20) NOT NULL,
  `USER` int(11) NOT NULL,
  `ID_compania` int(11) NOT NULL,
  `DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`,`NO_REQ`,`ID_compania`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=251 ;



-- --------------------------------------------------------

--
-- Table structure for table `REQ_RECEPT`
--

CREATE TABLE IF NOT EXISTS `REQ_RECEPT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NO_REQ` varchar(20) NOT NULL,
  `DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ITEM` varchar(20) NOT NULL,
  `QTY` decimal(18,2) NOT NULL,
  `USER` int(11) NOT NULL,
  `ID_compania` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=178 ;


-- Table structure for table `SAX_USER`
--

CREATE TABLE IF NOT EXISTS `SAX_USER` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `onoff` int(11) NOT NULL DEFAULT '1',
  `role` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `notif_oc` int(11) NOT NULL DEFAULT '0',
  `notif_fc` int(11) NOT NULL DEFAULT '0',
  `role_purc` int(11) NOT NULL DEFAULT '0',
  `role_fiel` int(11) NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=41 ;



--
-- Table structure for table `Sales_Detail_Imp`
--

CREATE TABLE IF NOT EXISTS `Sales_Detail_Imp` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_compania` bigint(20) NOT NULL DEFAULT '0',
  `InvoiceNumber` varchar(20) NOT NULL,
  `Item_id` varchar(20) NOT NULL,
  `Description` varchar(160) NOT NULL,
  `GL_Sales_Acct` varchar(15) NOT NULL,
  `Quantity` decimal(18,4) NOT NULL,
  `Unit_Price` decimal(18,4) NOT NULL,
  `Net_line` decimal(18,4) NOT NULL,
  `Taxable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Sales_Header_Imp`
--

CREATE TABLE IF NOT EXISTS `Sales_Header_Imp` (
  `ID_compania` int(11) NOT NULL DEFAULT '0',
  `ID_companiaOrigen` int(11) DEFAULT NULL,
  `InvoiceNumber` varchar(20) NOT NULL DEFAULT '',
  `CustomerID` varchar(50) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `Subtotal` decimal(18,4) NOT NULL,
  `TaxID` varchar(20) NOT NULL,
  `Net_due` decimal(18,4) NOT NULL,
  `SalesRepID` varchar(20) NOT NULL DEFAULT '0',
  `Date` varchar(10) NOT NULL,
  `Created` varchar(10) NOT NULL,
  `Export_date` varchar(10) NOT NULL,
  `Enviado` tinyint(1) DEFAULT '0',
  `Error` tinyint(1) DEFAULT '0',
  `ErrorPT` varchar(20) NOT NULL,
  PRIMARY KEY (`InvoiceNumber`,`ID_compania`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Vendors_Exp`
--

CREATE TABLE IF NOT EXISTS `Vendors_Exp` (
  `ID_compania` int(11) NOT NULL,
  `VendorID` varchar(20) NOT NULL,
  `Name` varchar(39) DEFAULT NULL,
  `Contact` varchar(20) DEFAULT NULL,
  `Phone_Number1` varchar(20) DEFAULT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `AddressLine1` varchar(30) DEFAULT NULL,
  `AddressLine2` varchar(30) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `Zip` varchar(12) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `IsActive` float DEFAULT NULL,
  `Custom_field1` varchar(40) DEFAULT NULL,
  `Custom_field2` varchar(40) DEFAULT NULL,
  `Custom_field3` varchar(40) DEFAULT NULL,
  `Custom_field4` varchar(40) DEFAULT NULL,
  `Custom_field5` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID_compania`,`VendorID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company_info`
--

CREATE TABLE IF NOT EXISTS `company_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `id_company_sage` int(11) DEFAULT NULL,
  `Tel` varchar(45) DEFAULT NULL,
  `Fax` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `company_info`
--

INSERT INTO `company_info` (`id`, `company_name`, `address`, `id_company_sage`, `Tel`, `Fax`, `email`) VALUES
(1, 'Contratistas Civiles', 'Edificio bay mall Ofic 313', 1, '507-214-3238', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;