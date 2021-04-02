-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dbo.CTDONDH`
--
create database QLVT;
use QLVT;

DROP TABLE IF EXISTS `dbo.CTDONDH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.CTDONDH` (
  `SoDh` varchar(4) DEFAULT NULL,
  `MaVTu` varchar(4) DEFAULT NULL,
  `SlDat` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.CTDONDH`
--

LOCK TABLES `dbo.CTDONDH` WRITE;
/*!40000 ALTER TABLE `dbo.CTDONDH` DISABLE KEYS */;
INSERT INTO `dbo.CTDONDH` VALUES ('D001','DD01',10),('D001','DD02',15),('D002','VD02',30),('D003','TV14',10),('D003','TV29',20),('D004','TL90',10),('D005','TV14',10),('D005','TV29',20),('D006','TV14',10),('D006','TV29',20),('D006','VD01',20);
/*!40000 ALTER TABLE `dbo.CTDONDH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.CTPNHAP`
--

DROP TABLE IF EXISTS `dbo.CTPNHAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.CTPNHAP` (
  `SoPn` varchar(4) DEFAULT NULL,
  `MaVTu` varchar(4) DEFAULT NULL,
  `SlNhap` tinyint(4) DEFAULT NULL,
  `DgNhap` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.CTPNHAP`
--

LOCK TABLES `dbo.CTPNHAP` WRITE;
/*!40000 ALTER TABLE `dbo.CTPNHAP` DISABLE KEYS */;
INSERT INTO `dbo.CTPNHAP` VALUES ('N001','DD01',8,2500000),('N001','DD02',10,3500000),('N002','DD01',2,2500000),('N002','DD02',5,3500000),('N003','VD02',30,2500000),('N004','TV14',5,2500000),('N004','TV29',12,3500000);
/*!40000 ALTER TABLE `dbo.CTPNHAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.CTPXUAT`
--

DROP TABLE IF EXISTS `dbo.CTPXUAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.CTPXUAT` (
  `SoPx` varchar(4) DEFAULT NULL,
  `MaVTu` varchar(4) DEFAULT NULL,
  `SlXuat` tinyint(4) DEFAULT NULL,
  `DgXuat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.CTPXUAT`
--

LOCK TABLES `dbo.CTPXUAT` WRITE;
/*!40000 ALTER TABLE `dbo.CTPXUAT` DISABLE KEYS */;
INSERT INTO `dbo.CTPXUAT` VALUES ('X001','DD01',2,3500000),('X002','DD01',1,3500000),('X002','DD02',5,4900000),('X003','DD01',3,3500000),('X003','DD02',2,4900000),('X003','VD02',10,3250000);
/*!40000 ALTER TABLE `dbo.CTPXUAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.DONDH`
--

DROP TABLE IF EXISTS `dbo.DONDH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.DONDH` (
  `SoDh` varchar(4) DEFAULT NULL,
  `NgayDh` varchar(19) DEFAULT NULL,
  `DiaChi` varchar(3) DEFAULT NULL,
  `MaNhaCc` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.DONDH`
--

LOCK TABLES `dbo.DONDH` WRITE;
/*!40000 ALTER TABLE `dbo.DONDH` DISABLE KEYS */;
INSERT INTO `dbo.DONDH` VALUES ('D001','2007-01-15 00:00:00','C03',''),('D002','2007-01-30 00:00:00','C01',''),('D003','2007-02-10 00:00:00','C02',''),('D004','2007-02-17 00:00:00','C05',''),('D005','2007-01-03 00:00:00','C02',''),('D006','2007-12-03 00:00:00','C05','');
/*!40000 ALTER TABLE `dbo.DONDH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.NHACC`
--

DROP TABLE IF EXISTS `dbo.NHACC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.NHACC` (
  `MaNhaCc` varchar(3) DEFAULT NULL,
  `TenNhaCc` varchar(15) DEFAULT NULL,
  `DiaChi` varchar(27) DEFAULT NULL,
  `DienThoai` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.NHACC`
--

LOCK TABLES `dbo.NHACC` WRITE;
/*!40000 ALTER TABLE `dbo.NHACC` DISABLE KEYS */;
INSERT INTO `dbo.NHACC` VALUES ('C01','Lê Minh Trí','54 Hậu Giang Q6 HCM','8781024'),('C02','Trần Minh Thạch','145 Hùng Vương Mỹ Tho','7698154'),('C03','Hồng Phương','154/85 Lê Lai Q1 HCM','9600125'),('C04','Nhật Thắng','198/40 Hương Lộ 14 QTB HCM','8757757'),('C05','Lưu Nguyệt Quế','178 Nguyễn Văn Luông Đà Lạt','7964251'),('C07','Cao Minh Trung','125 Lê Quang Sung Nha Trang','Chưa có');
/*!40000 ALTER TABLE `dbo.NHACC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.PNHAP`
--

DROP TABLE IF EXISTS `dbo.PNHAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.PNHAP` (
  `SoPn` varchar(4) DEFAULT NULL,
  `NgayNhap` varchar(19) DEFAULT NULL,
  `SoDh` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.PNHAP`
--

LOCK TABLES `dbo.PNHAP` WRITE;
/*!40000 ALTER TABLE `dbo.PNHAP` DISABLE KEYS */;
INSERT INTO `dbo.PNHAP` VALUES ('N001','2007-01-17 00:00:00','D001'),('N002','2007-01-20 00:00:00','D001'),('N003','2007-01-31 00:00:00','D002'),('N004','2007-02-15 00:00:00','D003');
/*!40000 ALTER TABLE `dbo.PNHAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.PXUAT`
--

DROP TABLE IF EXISTS `dbo.PXUAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.PXUAT` (
  `SoPx` varchar(4) DEFAULT NULL,
  `NgayXuat` varchar(19) DEFAULT NULL,
  `TenKh` varchar(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.PXUAT`
--

LOCK TABLES `dbo.PXUAT` WRITE;
/*!40000 ALTER TABLE `dbo.PXUAT` DISABLE KEYS */;
INSERT INTO `dbo.PXUAT` VALUES ('X001','2007-01-17 00:00:00','Nguyễn Ngọc Phương Nhi'),('X002','2007-01-25 00:00:00','Nguyễn Hồng Phương'),('X003','2007-01-31 00:00:00','Nguyễn Tuấn Tú');
/*!40000 ALTER TABLE `dbo.PXUAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.TONKHO`
--

DROP TABLE IF EXISTS `dbo.TONKHO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.TONKHO` (
  `NamThang` mediumint(9) DEFAULT NULL,
  `MaVTu` varchar(4) DEFAULT NULL,
  `SlDau` tinyint(4) DEFAULT NULL,
  `TongSLN` tinyint(4) DEFAULT NULL,
  `TongSLX` tinyint(4) DEFAULT NULL,
  `SlCuoi` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.TONKHO`
--

LOCK TABLES `dbo.TONKHO` WRITE;
/*!40000 ALTER TABLE `dbo.TONKHO` DISABLE KEYS */;
INSERT INTO `dbo.TONKHO` VALUES (200701,'DD01',0,10,6,4),(200701,'DD02',0,15,7,8),(200701,'VD02',0,30,10,20),(200702,'DD01',4,0,0,4),(200702,'DD02',8,0,0,8),(200702,'TV14',0,5,0,5),(200702,'TV29',0,12,0,12),(200702,'VD02',20,0,0,20);
/*!40000 ALTER TABLE `dbo.TONKHO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.VATTU`
--

DROP TABLE IF EXISTS `dbo.VATTU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.VATTU` (
  `MaVTu` varchar(4) DEFAULT NULL,
  `TenVTu` varchar(21) DEFAULT NULL,
  `DvTinh` varchar(3) DEFAULT NULL,
  `PhanTram` decimal(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.VATTU`
--

LOCK TABLES `dbo.VATTU` WRITE;
/*!40000 ALTER TABLE `dbo.VATTU` DISABLE KEYS */;
INSERT INTO `dbo.VATTU` VALUES ('DD01','Đầu DVD Hitachi 1 đĩa','Bộ',40.0),('DD02','Đầu DVD Hitachi 3 đĩa','Bộ',40.0),('TL15','Tủ lạnh Sanyo 150 lit','Cái',25.0),('TL90','Tủ lạnh Sanyo 90 lit','Cái',20.0),('TV14','Tivi Sony 14 inches','Cái',15.0),('TV21','Tivi Sony 21 inches','Cái',10.0),('TV29','Tivi Sony 29 inches','Cái',10.0),('VD01','Đầu VCD Sony 1 đĩa','Bộ',30.0),('VD02','Đầu VCD Sony 3 đĩa','Bộ',30.0);
/*!40000 ALTER TABLE `dbo.VATTU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.sysdiagrams`
--

DROP TABLE IF EXISTS `dbo.sysdiagrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.sysdiagrams` (
  `name` varchar(0) DEFAULT NULL,
  `principal_id` varchar(0) DEFAULT NULL,
  `diagram_id` varchar(0) DEFAULT NULL,
  `version` varchar(0) DEFAULT NULL,
  `definition` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.sysdiagrams`
--

LOCK TABLES `dbo.sysdiagrams` WRITE;
/*!40000 ALTER TABLE `dbo.sysdiagrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbo.sysdiagrams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-22 15:20:27
