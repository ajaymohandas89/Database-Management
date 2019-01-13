CREATE DATABASE  IF NOT EXISTS `fenway_hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `fenway_hospital`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fenway_hospital
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addressdetails`
--

DROP TABLE IF EXISTS `addressdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `addressdetails` (
  `AddressId` char(5) NOT NULL,
  `Street` varchar(45) NOT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `ZipCode` varchar(45) NOT NULL,
  `Staff_StaffId` int(10) unsigned NOT NULL,
  `Administrator_AdminId` int(11) NOT NULL,
  `Nurse_NurseId` int(10) unsigned NOT NULL,
  `Patient_PatientId` int(10) unsigned NOT NULL,
  `Manufacturer_ManufacturerId` int(10) unsigned NOT NULL,
  `Supplier_SuppId` int(10) unsigned NOT NULL,
  `Doctor_DoctorId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`AddressId`,`Staff_StaffId`,`Administrator_AdminId`,`Nurse_NurseId`,`Patient_PatientId`,`Manufacturer_ManufacturerId`,`Supplier_SuppId`,`Doctor_DoctorId`),
  KEY `fk_AddressDetails_Staff1_idx` (`Staff_StaffId`),
  KEY `fk_AddressDetails_Administrator1_idx` (`Administrator_AdminId`),
  KEY `fk_AddressDetails_Nurse1_idx` (`Nurse_NurseId`),
  KEY `fk_AddressDetails_Patient1_idx` (`Patient_PatientId`),
  KEY `fk_AddressDetails_Manufacturer1_idx` (`Manufacturer_ManufacturerId`),
  KEY `fk_AddressDetails_Supplier1_idx` (`Supplier_SuppId`),
  KEY `fk_AddressDetails_Doctor1_idx` (`Doctor_DoctorId`),
  CONSTRAINT `fk_AddressDetails_Administrator1` FOREIGN KEY (`Administrator_AdminId`) REFERENCES `administrator` (`adminid`),
  CONSTRAINT `fk_AddressDetails_Doctor1` FOREIGN KEY (`Doctor_DoctorId`) REFERENCES `doctor` (`doctorid`),
  CONSTRAINT `fk_AddressDetails_Manufacturer1` FOREIGN KEY (`Manufacturer_ManufacturerId`) REFERENCES `manufacturer` (`manufacturerid`),
  CONSTRAINT `fk_AddressDetails_Nurse1` FOREIGN KEY (`Nurse_NurseId`) REFERENCES `nurse` (`nurseid`),
  CONSTRAINT `fk_AddressDetails_Patient1` FOREIGN KEY (`Patient_PatientId`) REFERENCES `patient` (`patientid`),
  CONSTRAINT `fk_AddressDetails_Staff1` FOREIGN KEY (`Staff_StaffId`) REFERENCES `staff` (`staffid`),
  CONSTRAINT `fk_AddressDetails_Supplier1` FOREIGN KEY (`Supplier_SuppId`) REFERENCES `supplier` (`suppid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addressdetails`
--

LOCK TABLES `addressdetails` WRITE;
/*!40000 ALTER TABLE `addressdetails` DISABLE KEYS */;
INSERT INTO `addressdetails` VALUES ('A01','1171Boylston','Boston','MA','02215',100,10,650,200,350,400,151);
/*!40000 ALTER TABLE `addressdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `administrator` (
  `AdminId` int(11) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) NOT NULL,
  `DateOfJoining` date DEFAULT NULL,
  `Department_DeptId` int(10) unsigned NOT NULL,
  `address` char(5) DEFAULT NULL,
  PRIMARY KEY (`AdminId`,`Department_DeptId`),
  KEY `fk_Administrator_Department_idx` (`Department_DeptId`),
  KEY `address` (`address`),
  CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`address`) REFERENCES `addressdetails` (`addressid`),
  CONSTRAINT `fk_Administrator_Department` FOREIGN KEY (`Department_DeptId`) REFERENCES `department` (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (10,'AdminFN1','AdminMN1','AdminLN1','2019-09-01',1,NULL),(11,'AdminFN2','AdminMN2','AdminLN2','2009-01-04',2,NULL);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactdetails`
--

DROP TABLE IF EXISTS `contactdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contactdetails` (
  `ContactId` int(10) unsigned NOT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `Administrator_AdminId` int(11) NOT NULL,
  `Staff_StaffId` int(10) unsigned NOT NULL,
  `Nurse_NurseId` int(10) unsigned NOT NULL,
  `Patient_PatientId` int(10) unsigned NOT NULL,
  `Manufacturer_ManufacturerId` int(10) unsigned NOT NULL,
  `Supplier_SuppId` int(10) unsigned NOT NULL,
  `Doctor_DoctorId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ContactId`,`Doctor_DoctorId`,`Supplier_SuppId`,`Manufacturer_ManufacturerId`,`Patient_PatientId`,`Nurse_NurseId`,`Staff_StaffId`,`Administrator_AdminId`),
  KEY `fk_ContactDetails_Administrator1_idx` (`Administrator_AdminId`),
  KEY `fk_ContactDetails_Staff1_idx` (`Staff_StaffId`),
  KEY `fk_ContactDetails_Nurse1_idx` (`Nurse_NurseId`),
  KEY `fk_ContactDetails_Patient1_idx` (`Patient_PatientId`),
  KEY `fk_ContactDetails_Manufacturer1_idx` (`Manufacturer_ManufacturerId`),
  KEY `fk_ContactDetails_Supplier1_idx` (`Supplier_SuppId`),
  KEY `fk_ContactDetails_Doctor1_idx` (`Doctor_DoctorId`),
  CONSTRAINT `fk_ContactDetails_Administrator1` FOREIGN KEY (`Administrator_AdminId`) REFERENCES `administrator` (`adminid`),
  CONSTRAINT `fk_ContactDetails_Doctor1` FOREIGN KEY (`Doctor_DoctorId`) REFERENCES `doctor` (`doctorid`),
  CONSTRAINT `fk_ContactDetails_Manufacturer1` FOREIGN KEY (`Manufacturer_ManufacturerId`) REFERENCES `manufacturer` (`manufacturerid`),
  CONSTRAINT `fk_ContactDetails_Nurse1` FOREIGN KEY (`Nurse_NurseId`) REFERENCES `nurse` (`nurseid`),
  CONSTRAINT `fk_ContactDetails_Patient1` FOREIGN KEY (`Patient_PatientId`) REFERENCES `patient` (`patientid`),
  CONSTRAINT `fk_ContactDetails_Staff1` FOREIGN KEY (`Staff_StaffId`) REFERENCES `staff` (`staffid`),
  CONSTRAINT `fk_ContactDetails_Supplier1` FOREIGN KEY (`Supplier_SuppId`) REFERENCES `supplier` (`suppid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactdetails`
--

LOCK TABLES `contactdetails` WRITE;
/*!40000 ALTER TABLE `contactdetails` DISABLE KEYS */;
INSERT INTO `contactdetails` VALUES (600,'Mobile',123456789,10,100,650,200,350,400,150);
/*!40000 ALTER TABLE `contactdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currentpatientrecords`
--

DROP TABLE IF EXISTS `currentpatientrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `currentpatientrecords` (
  `CurrPatientId` int(10) unsigned NOT NULL,
  `CauseOfAdmit` varchar(45) NOT NULL,
  `Notes` varchar(45) DEFAULT NULL,
  `Patient_PatientId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`CurrPatientId`,`Patient_PatientId`),
  KEY `fk_CurrentPatientRecords_Patient1_idx` (`Patient_PatientId`),
  CONSTRAINT `fk_CurrentPatientRecords_Patient1` FOREIGN KEY (`Patient_PatientId`) REFERENCES `patient` (`patientid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currentpatientrecords`
--

LOCK TABLES `currentpatientrecords` WRITE;
/*!40000 ALTER TABLE `currentpatientrecords` DISABLE KEYS */;
INSERT INTO `currentpatientrecords` VALUES (100,'Cancer','first stage',200),(101,'fever',NULL,201),(102,'malaria',NULL,202);
/*!40000 ALTER TABLE `currentpatientrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currentpatientrecords_has_doctor`
--

DROP TABLE IF EXISTS `currentpatientrecords_has_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `currentpatientrecords_has_doctor` (
  `CurrentPatientRecords_CurrPatientId` int(10) unsigned NOT NULL,
  `Doctor_DoctorId` int(10) unsigned NOT NULL,
  `Doctor_Department_DeptId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`CurrentPatientRecords_CurrPatientId`,`Doctor_DoctorId`,`Doctor_Department_DeptId`),
  KEY `fk_CurrentPatientRecords_has_Doctor_Doctor1_idx` (`Doctor_DoctorId`,`Doctor_Department_DeptId`),
  KEY `fk_CurrentPatientRecords_has_Doctor_CurrentPatientRecords1_idx` (`CurrentPatientRecords_CurrPatientId`),
  CONSTRAINT `fk_CurrentPatientRecords_has_Doctor_CurrentPatientRecords1` FOREIGN KEY (`CurrentPatientRecords_CurrPatientId`) REFERENCES `currentpatientrecords` (`currpatientid`),
  CONSTRAINT `fk_CurrentPatientRecords_has_Doctor_Doctor1` FOREIGN KEY (`Doctor_DoctorId`, `Doctor_Department_DeptId`) REFERENCES `doctor` (`doctorid`, `department_deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currentpatientrecords_has_doctor`
--

LOCK TABLES `currentpatientrecords_has_doctor` WRITE;
/*!40000 ALTER TABLE `currentpatientrecords_has_doctor` DISABLE KEYS */;
INSERT INTO `currentpatientrecords_has_doctor` VALUES (100,150,1);
/*!40000 ALTER TABLE `currentpatientrecords_has_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department` (
  `DeptId` int(10) unsigned NOT NULL,
  `DepartmentName` varchar(45) DEFAULT NULL,
  `EmployeeCount` mediumint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`DeptId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (0,'Sample',0),(1,'Oncology',50),(2,'Opthamology',35);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_has_manufacturer`
--

DROP TABLE IF EXISTS `department_has_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department_has_manufacturer` (
  `Department_DeptId` int(10) unsigned NOT NULL,
  `Manufacturer_ManufacturerId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Department_DeptId`,`Manufacturer_ManufacturerId`),
  KEY `fk_Department_has_Manufacturer_Manufacturer1_idx` (`Manufacturer_ManufacturerId`),
  KEY `fk_Department_has_Manufacturer_Department1_idx` (`Department_DeptId`),
  CONSTRAINT `fk_Department_has_Manufacturer_Department1` FOREIGN KEY (`Department_DeptId`) REFERENCES `department` (`deptid`),
  CONSTRAINT `fk_Department_has_Manufacturer_Manufacturer1` FOREIGN KEY (`Manufacturer_ManufacturerId`) REFERENCES `manufacturer` (`manufacturerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_has_manufacturer`
--

LOCK TABLES `department_has_manufacturer` WRITE;
/*!40000 ALTER TABLE `department_has_manufacturer` DISABLE KEYS */;
INSERT INTO `department_has_manufacturer` VALUES (1,350),(2,351);
/*!40000 ALTER TABLE `department_has_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_has_supplier`
--

DROP TABLE IF EXISTS `department_has_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department_has_supplier` (
  `Department_DeptId` int(10) unsigned NOT NULL,
  `Supplier_SuppId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Department_DeptId`,`Supplier_SuppId`),
  KEY `fk_Department_has_Supplier_Supplier1_idx` (`Supplier_SuppId`),
  KEY `fk_Department_has_Supplier_Department1_idx` (`Department_DeptId`),
  CONSTRAINT `fk_Department_has_Supplier_Department1` FOREIGN KEY (`Department_DeptId`) REFERENCES `department` (`deptid`),
  CONSTRAINT `fk_Department_has_Supplier_Supplier1` FOREIGN KEY (`Supplier_SuppId`) REFERENCES `supplier` (`suppid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_has_supplier`
--

LOCK TABLES `department_has_supplier` WRITE;
/*!40000 ALTER TABLE `department_has_supplier` DISABLE KEYS */;
INSERT INTO `department_has_supplier` VALUES (1,400),(2,401);
/*!40000 ALTER TABLE `department_has_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doctor` (
  `DoctorId` int(10) unsigned NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) NOT NULL,
  `OperationCount` smallint(5) DEFAULT NULL,
  `DateOfJoining` date DEFAULT NULL,
  `Qualification` varchar(45) NOT NULL,
  `Department_DeptId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DoctorId`,`Department_DeptId`),
  KEY `fk_Doctor_Department1_idx` (`Department_DeptId`),
  CONSTRAINT `fk_Doctor_Department1` FOREIGN KEY (`Department_DeptId`) REFERENCES `department` (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (150,'DFN1','DMN1','DLN1',23,'2002-12-05','MD',1),(151,'DFN2','DMN2','DLN2',17,'2007-09-03','MD',1),(152,'DFN3','','DLN3',5,'2013-02-07','BDS',2);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manufacturer` (
  `ManufacturerId` int(10) unsigned NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Charges` int(11) DEFAULT NULL,
  `Type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ManufacturerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (350,'Man1',2300,'MedicalEquipments'),(351,'Man2',2178,'Sanitizers');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medialbill`
--

DROP TABLE IF EXISTS `medialbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `medialbill` (
  `BillNo` int(10) unsigned NOT NULL,
  `DoctorFee` double DEFAULT NULL,
  `NurseFee` double DEFAULT NULL,
  `OtherCharges` double DEFAULT NULL,
  `PatientDays` smallint(5) DEFAULT NULL,
  `AmountPaid` double DEFAULT NULL,
  `Patient_PatientId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`BillNo`,`Patient_PatientId`),
  KEY `fk_MedialBill_Patient1_idx` (`Patient_PatientId`),
  KEY `medialbill_index` (`BillNo`) USING BTREE,
  CONSTRAINT `fk_MedialBill_Patient1` FOREIGN KEY (`Patient_PatientId`) REFERENCES `patient` (`patientid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medialbill`
--

LOCK TABLES `medialbill` WRITE;
/*!40000 ALTER TABLE `medialbill` DISABLE KEYS */;
INSERT INTO `medialbill` VALUES (700,100,100,100,20,10,200),(701,450,100,230,15,100,201);
/*!40000 ALTER TABLE `medialbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `medicine` (
  `MedicineId` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Purpose` varchar(45) DEFAULT NULL,
  `Quantity` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `Price` mediumint(5) DEFAULT NULL,
  PRIMARY KEY (`MedicineId`),
  KEY `medicine_index` (`Quantity`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (0,'default','default',0,0),(250,'Med1','Stomach Problems',0,100),(251,'Med2','Ulcers',2,251),(252,'Med3','Accident',4,80),(253,'Med4','Burn Injuries',5,81),(254,'Med5','Fever',5,20);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nurse` (
  `NurseId` int(10) unsigned NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) NOT NULL,
  `DateOfJoining` date DEFAULT NULL,
  `Department_DeptId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`NurseId`,`Department_DeptId`),
  KEY `fk_Nurse_Department1_idx` (`Department_DeptId`),
  CONSTRAINT `fk_Nurse_Department1` FOREIGN KEY (`Department_DeptId`) REFERENCES `department` (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (650,'NFN1','NMN1','NLN1','2004-03-18',1),(651,'NFN2','NMN2','NLN2','2009-11-20',1),(652,'NFN3','NMN3','NLN3','2010-08-10',2),(653,'NFN4','','NMN4','2012-01-11',2);
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderdetail` (
  `OrderId` int(11) NOT NULL AUTO_INCREMENT,
  `MedicineId` int(11) DEFAULT NULL,
  `MedicineName` varchar(45) DEFAULT NULL,
  `SupplierId` int(11) DEFAULT NULL,
  `SupplierName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (4,250,'Med1',400,'Supp1'),(5,251,'Med2',400,'Supp1');
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient` (
  `PatientId` int(10) unsigned NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) NOT NULL,
  `DateOfAdmit` date NOT NULL,
  `LastVisitDate` varchar(45) DEFAULT NULL,
  `Department_DeptId` int(10) unsigned NOT NULL,
  `Room_RoomId` int(10) unsigned NOT NULL DEFAULT '0',
  `Doctor_DoctorId` int(10) unsigned NOT NULL,
  `Nurse_NurseId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`PatientId`,`Department_DeptId`),
  KEY `fk_Patient_Department1_idx` (`Department_DeptId`),
  KEY `fk_Patient_Room1_idx` (`Room_RoomId`),
  KEY `fk_Patient_Doctor1_idx` (`Doctor_DoctorId`),
  KEY `fk_Patient_Nurse1_idx` (`Nurse_NurseId`),
  CONSTRAINT `fk_Patient_Department1` FOREIGN KEY (`Department_DeptId`) REFERENCES `department` (`deptid`),
  CONSTRAINT `fk_Patient_Doctor1` FOREIGN KEY (`Doctor_DoctorId`) REFERENCES `doctor` (`doctorid`),
  CONSTRAINT `fk_Patient_Nurse1` FOREIGN KEY (`Nurse_NurseId`) REFERENCES `nurse` (`nurseid`),
  CONSTRAINT `fk_Patient_Room1` FOREIGN KEY (`Room_RoomId`) REFERENCES `room` (`roomid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (200,'PFN1','PMN1','PLN1','2018-02-10','2018-01-15',1,501,150,650),(201,'PFN2','PMN2','PLN2','2018-03-11','2018-02-10',1,502,150,651),(202,'PFN3','PMN3','PLN3','2018-05-11','2018-02-02',1,504,151,651),(203,'PFN4',NULL,'PLN4','2018-06-15','2018-07-07',2,0,152,652),(204,'PFN5','PMN5','PLN5','0207-01-18','2017-01-29',2,0,152,653);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Room_Records` AFTER UPDATE ON `patient` FOR EACH ROW Begin
	 set @oldRoomId = OLD.Room_RoomId;
     set @newRoomId = NEW.Room_RoomId;
	 update Fenway_Hospital.room set room.status = 'O' where room.RoomId = @newRoomId;
     update Fenway_Hospital.room set room.status = 'V' where room.RoomId = @oldRoomId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `patient_has_medicine`
--

DROP TABLE IF EXISTS `patient_has_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient_has_medicine` (
  `Patient_PatientId` int(10) unsigned NOT NULL,
  `Medicine_MedicineId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Patient_PatientId`,`Medicine_MedicineId`),
  KEY `fk_Patient_has_Medicine_Medicine1_idx` (`Medicine_MedicineId`),
  KEY `fk_Patient_has_Medicine_Patient1_idx` (`Patient_PatientId`),
  CONSTRAINT `fk_Patient_has_Medicine_Medicine1` FOREIGN KEY (`Medicine_MedicineId`) REFERENCES `medicine` (`medicineid`),
  CONSTRAINT `fk_Patient_has_Medicine_Patient1` FOREIGN KEY (`Patient_PatientId`) REFERENCES `patient` (`patientid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_has_medicine`
--

LOCK TABLES `patient_has_medicine` WRITE;
/*!40000 ALTER TABLE `patient_has_medicine` DISABLE KEYS */;
INSERT INTO `patient_has_medicine` VALUES (203,0),(204,0),(201,251),(202,251);
/*!40000 ALTER TABLE `patient_has_medicine` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Medicine_Quantity` AFTER UPDATE ON `patient_has_medicine` FOR EACH ROW Begin
	set @newMedId = NEW.Medicine_MedicineId;
	update Fenway_Hospital.medicine set Quantity = Quantity - 1 
    where medicine.MedicineId = @newMedId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `patient_records`
--

DROP TABLE IF EXISTS `patient_records`;
/*!50001 DROP VIEW IF EXISTS `patient_records`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `patient_records` AS SELECT 
 1 AS `PatientId`,
 1 AS `PatientName`,
 1 AS `CauseOfAdmit`,
 1 AS `Notes`,
 1 AS `HistoryRecords`,
 1 AS `HistoryNotes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `patientbill`
--

DROP TABLE IF EXISTS `patientbill`;
/*!50001 DROP VIEW IF EXISTS `patientbill`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `patientbill` AS SELECT 
 1 AS `BillNo`,
 1 AS `PatientId`,
 1 AS `PatientName`,
 1 AS `CauseOfAdmit`,
 1 AS `DoctorId`,
 1 AS `DoctorName`,
 1 AS `Total Bill`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patientmedicalhistory`
--

DROP TABLE IF EXISTS `patientmedicalhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patientmedicalhistory` (
  `MedHistoryId` int(10) unsigned NOT NULL,
  `HistoryRecords` varchar(45) DEFAULT NULL,
  `HistoryNotes` varchar(45) DEFAULT NULL,
  `Patient_PatientId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`MedHistoryId`,`Patient_PatientId`),
  KEY `fk_PatientMedicalHistory_Patient1_idx` (`Patient_PatientId`),
  CONSTRAINT `fk_PatientMedicalHistory_Patient1` FOREIGN KEY (`Patient_PatientId`) REFERENCES `patient` (`patientid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmedicalhistory`
--

LOCK TABLES `patientmedicalhistory` WRITE;
/*!40000 ALTER TABLE `patientmedicalhistory` DISABLE KEYS */;
INSERT INTO `patientmedicalhistory` VALUES (1001,'ulcers','xyz',200),(1002,'jaundce','white jaundice',201);
/*!40000 ALTER TABLE `patientmedicalhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmedicalhistory_has_doctor`
--

DROP TABLE IF EXISTS `patientmedicalhistory_has_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patientmedicalhistory_has_doctor` (
  `PatientMedicalHistory_MedHistoryId` int(10) unsigned NOT NULL,
  `Doctor_DoctorId` int(10) unsigned NOT NULL,
  `Doctor_Department_DeptId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`PatientMedicalHistory_MedHistoryId`,`Doctor_DoctorId`,`Doctor_Department_DeptId`),
  KEY `fk_PatientMedicalHistory_has_Doctor_Doctor1_idx` (`Doctor_DoctorId`,`Doctor_Department_DeptId`),
  KEY `fk_PatientMedicalHistory_has_Doctor_PatientMedicalHistory1_idx` (`PatientMedicalHistory_MedHistoryId`),
  CONSTRAINT `fk_PatientMedicalHistory_has_Doctor_Doctor1` FOREIGN KEY (`Doctor_DoctorId`, `Doctor_Department_DeptId`) REFERENCES `doctor` (`doctorid`, `department_deptid`),
  CONSTRAINT `fk_PatientMedicalHistory_has_Doctor_PatientMedicalHistory1` FOREIGN KEY (`PatientMedicalHistory_MedHistoryId`) REFERENCES `patientmedicalhistory` (`medhistoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmedicalhistory_has_doctor`
--

LOCK TABLES `patientmedicalhistory_has_doctor` WRITE;
/*!40000 ALTER TABLE `patientmedicalhistory_has_doctor` DISABLE KEYS */;
INSERT INTO `patientmedicalhistory_has_doctor` VALUES (1001,150,1);
/*!40000 ALTER TABLE `patientmedicalhistory_has_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `room` (
  `RoomId` int(10) unsigned NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Status` char(1) DEFAULT NULL,
  `Department_DeptId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`RoomId`,`Department_DeptId`),
  KEY `fk_Room_Department1_idx` (`Department_DeptId`),
  KEY `room_index` (`Status`) USING BTREE,
  CONSTRAINT `fk_Room_Department1` FOREIGN KEY (`Department_DeptId`) REFERENCES `department` (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (0,'nothing','O',0),(500,'ward1','V',1),(501,'ward2','V',1),(502,'ward3','O',1),(503,'ward4','V',2),(504,'general ward','O',1),(505,'ICU','V',1),(506,'ward 5','V',2),(507,'ICU','V',2);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff` (
  `StaffId` int(10) unsigned NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) NOT NULL,
  `DateOfJoining` date DEFAULT NULL,
  `Department_DeptId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`StaffId`,`Department_DeptId`),
  KEY `fk_Staff_Department1_idx` (`Department_DeptId`),
  CONSTRAINT `fk_Staff_Department1` FOREIGN KEY (`Department_DeptId`) REFERENCES `department` (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (100,'SFN1','SMN1','SLN1','2004-06-07',1),(101,'SFN2','SMN2','SLN2','2003-09-10',2),(102,'SFN3','SMN3','SLN3','2005-10-10',1);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supplier` (
  `SuppId` int(10) unsigned NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Charges` int(11) DEFAULT NULL,
  `MaterialsSupplied` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SuppId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (400,'Supp1',1500,'Medicine'),(401,'Supp1',200,'gloves');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_supplies_medicine`
--

DROP TABLE IF EXISTS `supplier_supplies_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supplier_supplies_medicine` (
  `SuppId` int(11) DEFAULT NULL,
  `MedicineId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_supplies_medicine`
--

LOCK TABLES `supplier_supplies_medicine` WRITE;
/*!40000 ALTER TABLE `supplier_supplies_medicine` DISABLE KEYS */;
INSERT INTO `supplier_supplies_medicine` VALUES (400,250),(400,251),(400,252);
/*!40000 ALTER TABLE `supplier_supplies_medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vacant_rooms`
--

DROP TABLE IF EXISTS `vacant_rooms`;
/*!50001 DROP VIEW IF EXISTS `vacant_rooms`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vacant_rooms` AS SELECT 
 1 AS `RoomId`,
 1 AS `Type`,
 1 AS `Status`,
 1 AS `Department_DeptId`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'fenway_hospital'
--

--
-- Dumping routines for database 'fenway_hospital'
--
/*!50003 DROP FUNCTION IF EXISTS `Total_Vacant_Rooms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Total_Vacant_Rooms`(deptid int) RETURNS int(11)
    DETERMINISTIC
Begin
	declare RoomNumber int;
	select count(RoomId) into RoomNumber  from room  where 
	RoomId not in (0) and status = 'V' and Department_DeptId = deptid;
	return RoomNumber;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrderMedicine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OrderMedicine`(IN MedicineName varchar(45))
BEGIN
	declare MedQuantity int;
    declare MedId int;
    declare MedName varchar(45);
    declare SupplierId int;
    declare SuppName varchar(45);
    
    set MedName = MedicineName;
    
    select MedicineId into MedId from Medicine where Medicine.Name = MedName;
    select Quantity into MedQuantity from Medicine where Medicine.Name = MedName AND MedicineId = MedId;
    select SuppId into SupplierId from Supplier_Supplies_Medicine where MedicineId = MedId;
    select Supplier.Name into SuppName from supplier where SuppId = SupplierId;
    
    insert into OrderDetail (MedicineId,MedicineName,SupplierId,SupplierName) 
    select MedId, MedName, SupplierId, SuppName 
    where MedQuantity = 0;
    
    select * from OrderDetail;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `patient_records`
--

/*!50001 DROP VIEW IF EXISTS `patient_records`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_records` AS select `patient`.`PatientId` AS `PatientId`,concat(`patient`.`FirstName`,'  ',`patient`.`MiddleName`,'  ',`patient`.`LastName`) AS `PatientName`,`currmed`.`CauseOfAdmit` AS `CauseOfAdmit`,`currmed`.`Notes` AS `Notes`,`medhistory`.`HistoryRecords` AS `HistoryRecords`,`medhistory`.`HistoryNotes` AS `HistoryNotes` from ((`patient` join `currentpatientrecords` `currmed` on((`patient`.`PatientId` = `currmed`.`Patient_PatientId`))) join `patientmedicalhistory` `medhistory` on((`patient`.`PatientId` = `medhistory`.`Patient_PatientId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patientbill`
--

/*!50001 DROP VIEW IF EXISTS `patientbill`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patientbill` AS select `bill`.`BillNo` AS `BillNo`,`p`.`PatientId` AS `PatientId`,concat(`p`.`FirstName`,'  ',`p`.`MiddleName`,'  ',`p`.`LastName`) AS `PatientName`,`currmed`.`CauseOfAdmit` AS `CauseOfAdmit`,`d`.`DoctorId` AS `DoctorId`,concat(`d`.`FirstName`,'  ',`d`.`MiddleName`,'  ',`d`.`LastName`) AS `DoctorName`,(((`bill`.`DoctorFee` + `bill`.`NurseFee`) + `bill`.`OtherCharges`) - `bill`.`AmountPaid`) AS `Total Bill` from (((`patient` `p` join `currentpatientrecords` `currmed` on((`p`.`PatientId` = `currmed`.`Patient_PatientId`))) join `medialbill` `bill` on((`p`.`PatientId` = `bill`.`Patient_PatientId`))) join `doctor` `d` on((`p`.`Doctor_DoctorId` = `d`.`DoctorId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vacant_rooms`
--

/*!50001 DROP VIEW IF EXISTS `vacant_rooms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vacant_rooms` AS select `room`.`RoomId` AS `RoomId`,`room`.`Type` AS `Type`,`room`.`Status` AS `Status`,`room`.`Department_DeptId` AS `Department_DeptId` from `room` where (`room`.`Status` = 'V') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-10 22:46:27
