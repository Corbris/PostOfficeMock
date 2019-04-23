-- MySQL dump 10.17  Distrib 10.3.14-MariaDB, for Linux (x86_64)
--
-- Host: mysqlinstance.c0mjh6ewr0w9.us-east-2.rds.amazonaws.com    Database: PostOffice
-- ------------------------------------------------------
-- Server version	5.6.40-log

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
-- Table structure for table `Authentication`
--

DROP TABLE IF EXISTS `Authentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Authentication` (
  `AuthenticationID` int(11) NOT NULL AUTO_INCREMENT,
  `AuthenticationLevel` varchar(20) NOT NULL,
  PRIMARY KEY (`AuthenticationID`),
  UNIQUE KEY `AUTHID_UNIQUE` (`AuthenticationID`),
  UNIQUE KEY `AUTHLevel_UNIQUE` (`AuthenticationLevel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authentication`
--

LOCK TABLES `Authentication` WRITE;
/*!40000 ALTER TABLE `Authentication` DISABLE KEYS */;
INSERT INTO `Authentication` VALUES (3,'admin'),(1,'employee'),(2,'manager');
/*!40000 ALTER TABLE `Authentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(25) NOT NULL,
  `MInit` varchar(1) NOT NULL,
  `Lname` varchar(25) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `MobileNumber` varchar(20) NOT NULL,
  `HouseNumber` varchar(10) NOT NULL,
  `Street` varchar(40) NOT NULL,
  `ZipCode` varchar(10) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Country` varchar(20) NOT NULL,
  `TotalPackagesSent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CustomerID`,`Email`),
  UNIQUE KEY `CustomerID_UNIQUE` (`CustomerID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `MobileNumber_UNIQUE` (`MobileNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=10124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (10001,'Kevin','Z','Lucas','email@email.com','7132058901','1622','Conrad Sauer Dr.','77043','Houston','TX','USA',36),(10063,'FAKE','Z','DATA','fakedata@email.com','661-975-0903','1463','Esker','61765','Bakersfield','CA','USA',0),(10064,'Eleni','Z','Rosenblath','erosenblath1@tamu.edu','330-991-1669','3453','Green Ridge','74028','Akron','OH','USA',0),(10065,'Dimitri','Z','Raubenheimers','draubenheimers2@xrea.com','217-533-7380','2345','Macpherson','62522','Springfield','IL','USA',0),(10066,'Olia','Z','Acock','oacock3@bravesites.com','205-320-5336','4756','Grayhawk','84052','Birmingham','AL','USA',0),(10067,'Nowell','Z','Hans','nhans4@mlb.com','810-352-5098','9162','Valley Edge','52550','Flint','MI','USA',0),(10068,'Ninon','Z','Sketchley','nsketchley5@netvibes.com','443-358-5054','3376','Crescent Oaks','83845','Baltimore','MD','USA',0),(10069,'Tiphany','Z','McNeish','tmcneish6@ow.ly','804-808-6285','1153','Longview','69310','Richmond','VA','USA',0),(10070,'Lorne','Z','Ardern','lardern7@cyberchimps.com','501-899-4020','2341','Kensington','62355','Little Rock','AR','USA',0),(10071,'Lucais','Z','Sallis','lsallis8@adobe.com','770-138-4874','3145','Packers','80799','Atlanta','GA','USA',0),(10072,'Godiva','Z','Matton','gmatton9@bbc.co.uk','412-922-6658','4321','Golf','52465','Pittsburgh','PA','USA',0),(10073,'Derrik','Z','Ewer','dewera@oaic.gov.au','415-278-3056','2386','Ryan','88292','San Francisco','CA','USA',0),(10074,'Levon','Z','Beszant','lbeszantb@gnu.org','719-205-2849','1643','Derek','69319','Colorado Springs','CO','USA',0),(10075,'Rurik','Z','Massard','rmassardc@utexas.edu','419-840-9726','3237','Oakridge','45196','Toledo','OH','USA',0),(10076,'Alfredo','Z','Bohlens','abohlensd@pagesperso-orange.fr','559-176-5350','1643','Bluejay','85420','Fresno','CA','USA',0),(10077,'Charley','Z','DeSousa','cdesousae@cornell.edu','347-406-6449','1563','Maryland','60607','Brooklyn','NY','USA',0),(10078,'Remington','Z','Di Claudio','rdiclaudiof@phpbb.com','602-967-9664','5472','Pond','77647','Mesa','AZ','USA',0),(10079,'Claudio','Z','Rihanek','crihanekg@dyndns.org','952-177-5705','6432','Artisan','88133','Minneapolis','MN','USA',0),(10080,'Elana','Z','Perceval','epercevalh@zdnet.com','412-614-5582','3564','Pleasure','77229','Pittsburgh','PA','USA',0),(10081,'Berne','Z','Bachnic','bbachnici@apache.org','615-621-7262','2564','Blue Bill Park','55094','Nashville','TN','USA',0),(10082,'Darya','Z','MacLeese','dmacleesej@flavors.me','801-517-0011','1345','Helena','53720','Sandy','UT','USA',0),(10083,'Bobina','Z','Gillcrist','bgillcristk@vinaora.com','501-187-5314','1435','Bluestem','68648','Little Rock','AR','USA',0),(10084,'Lorene','Z','Stent','lstentl@pbs.org','260-621-9915','3456','Morrow','62557','Fort Wayne','IN','USA',0),(10085,'Elly','Z','Clemenceau','eclemenceaum@1688.com','251-167-0246','3121','Harper','73002','Mobile','AL','USA',0),(10086,'Elenore','Z','Dickey','edickeyn@sbwire.com','813-592-4536','1275','Myrtle','64328','Tampa','FL','USA',0),(10087,'Debra','Z','Rammell','drammello@prlog.org','254-174-5120','2346','Troy','87932','Killeen','TX','USA',0),(10088,'Mahmoud','Z','Evason','mevasonp@skype.com','309-279-8855','5262','Riverside','48180','Peoria','IL','USA',0),(10089,'Inness','Z','Erswell','ierswellq@japanpost.jp','205-611-7042','1623','2nd','64417','Birmingham','AL','USA',0),(10090,'Ashlin','Z','Marks','amarksr@opera.com','727-739-8716','1522','Talisman','67741','Largo','FL','USA',0),(10091,'Constanta','Z','Woolhouse','cwoolhouses@hc360.com','757-441-3541','3642','Hauk','81913','Norfolk','VA','USA',0),(10092,'Goldarina','Z','Ferguson','gfergusont@squidoo.com','801-615-8288','5321','Hoard','70498','Sandy','UT','USA',0),(10093,'Jodie','Z','Beincken','jbeincken0@soup.io','214-689-4801','1187','Hudson','50543','Dallas','TX','USA',0),(10094,'Tess','Z','Lenox','tlenox1@flavors.me','404-960-1399','6324','Arkansas','71941','Atlanta','GA','USA',0),(10095,'Marijn','Z','Vandrill','mvandrill2@ameblo.jp','919-457-0688','5657','Dunning','63511','Raleigh','NC','USA',0),(10096,'Stillmann','Z','Frensche','sfrensche3@sogou.com','612-563-7304','4084','Eggendart','53993','Minneapolis','MN','USA',0),(10097,'Aline','Z','Hazeman','ahazeman4@japanpost.jp','727-611-4816','7768','Sachs','63894','Saint Petersburg','FL','USA',0),(10098,'Austen','Z','Raiston','araiston5@drupal.org','832-718-8383','6853','8th','55781','Houston','TX','USA',0),(10099,'Jocelyn','Z','McCuaig','jmccuaig6@ihg.com','325-691-2566','7125','High Crossing','64266','San Angelo','TX','USA',0),(10100,'Meredith','Z','Cristoferi','mcristoferi7@rakuten.co.jp','484-546-9897','8112','Lerdahl','85902','Bethlehem','PA','USA',0),(10101,'Malinde','Z','Swinfon','mswinfon8@drupal.org','571-802-2770','2511','Trailsway','81922','Merrifield','VA','USA',0),(10102,'Aleda','Z','Cartmell','acartmell9@macromedia.com','256-553-6961','3863','Corscot','58435','Gadsden','AL','USA',0),(10103,'Port','Z','Grogor','pgrogora@independent.co.uk','202-384-5358','6771','Fisk','47687','Washington','DC','USA',0),(10104,'Milty','Z','McCullagh','mmccullaghb@godaddy.com','419-832-5685','1693','Northland','86577','Mansfield','OH','USA',0),(10105,'Fan','Z','Wasling','fwaslingc@chron.com','754-471-2111','4408','Mccormick','55262','Fort Lauderdale','FL','USA',0),(10106,'Carolina','Z','Mudle','cmudled@spotify.com','513-146-7120','6074','Ruskin','77058','Cincinnati','OH','USA',0),(10107,'Luci','Z','Swabey','lswabeye@psu.edu','217-824-9429','5063','Vahlen','75858','Springfield','IL','USA',0),(10108,'Flossy','Z','Follen','ffollenf@facebook.com','573-797-3564','1629','Nancy','47060','Columbia','MO','USA',0),(10109,'Gloriana','Z','Cowperthwaite','gcowperthwaiteg@soundcloud.com','240-165-8738','5972','Autumn Leaf','83311','Silver Spring','MD','USA',0),(10110,'Palmer','Z','Toffel','ptoffelh@live.com','510-290-1855','1675','Sauthoff','47034','Irvine','CA','USA',0),(10111,'Garland','Z','Look','glooki@nytimes.com','407-789-9779','4846','Monterey','49354','Orlando','FL','USA',0),(10112,'Stirling','Z','Benard','sbenardj@cbsnews.com','405-367-0883','2912','American Ash','70734','Oklahoma City','OK','USA',0),(10113,'Catlee','Z','De Normanville','cdenormanvillek@independent.co.uk','828-325-5800','4508','Daystar','71078','Asheville','NC','USA',0),(10114,'Eziechiele','Z','Margarson','emargarsonl@unesco.org','303-112-1390','6815','Oak','55534','Aurora','CO','USA',0),(10115,'Kristien','Z','Okey','kokeym@tinyurl.com','717-351-8713','7418','Eliot','58837','Harrisburg','PA','USA',0),(10116,'Broddie','Z','Vaney','bvaneyn@about.me','617-362-0765','7994','Forest','45561','Boston','MA','USA',0),(10117,'Vilma','Z','Ridsdole','vridsdoleo@si.edu','505-806-2453','1873','Elgar','44587','Albuquerque','NM','USA',0),(10118,'Norean','Z','Prate','npratep@bloomberg.com','312-983-3748','8041','Armistice','88016','Chicago','IL','USA',0),(10119,'Donnamarie','Z','Canby','dcanbyq@usda.gov','202-736-2340','3695','Warrior','45842','Washington','DC','USA',0),(10120,'Genna','Z','Godehard.sf','ggodehardsfr@examiner.com','843-424-3164','7524','Merrick','65089','Myrtle Beach','SC','USA',0),(10121,'Dalis','Z','Berntsson','dberntssons@free.fr','314-652-2257','454','Melby','87826','Saint Louis','MO','USA',0),(10122,'Abie','Z','Childes','achildest@clickbank.net','562-774-4892','7263','Grover','47627','San Francisco','CA','USA',0),(10123,'Jacques','I','Massa','jimassa@uh.edu','8328074767','6303','13115 Whittington Drive','jimassa@uh','Houston','TX','USA',0);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`masterUsername`@`%`*/ /*!50003 TRIGGER `PostOffice`.`Customer_AFTER_INSERT` AFTER INSERT ON `Customer` FOR EACH ROW
BEGIN
	IF 
		(SELECT COUNT(*) 
			FROM CustomerLogin 
				WHERE NEW.Email = CustomerLogin.CustomerEmail) = 0 
    
    THEN
		INSERT INTO `PostOffice`.`CustomerLogin`
		(`CustomerEmail`,`CustomerPassword`)
		VALUES
		(NEW.Email, 'qwert');
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `CustomerLogin`
--

DROP TABLE IF EXISTS `CustomerLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomerLogin` (
  `CustomerEmail` varchar(60) NOT NULL,
  `CustomerPassword` varchar(60) NOT NULL,
  PRIMARY KEY (`CustomerEmail`),
  UNIQUE KEY `Customer_Email_UNIQUE` (`CustomerEmail`),
  KEY `fk_CustomerLogin_Customer1_idx` (`CustomerEmail`),
  CONSTRAINT `fk_CustomerLogin_Customer1` FOREIGN KEY (`CustomerEmail`) REFERENCES `Customer` (`Email`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerLogin`
--

LOCK TABLES `CustomerLogin` WRITE;
/*!40000 ALTER TABLE `CustomerLogin` DISABLE KEYS */;
INSERT INTO `CustomerLogin` VALUES ('abohlensd@pagesperso-orange.fr','qwert'),('acartmell9@macromedia.com','qwert'),('achildest@clickbank.net','qwert'),('ahazeman4@japanpost.jp','qwert'),('amarksr@opera.com','qwert'),('araiston5@drupal.org','qwert'),('bbachnici@apache.org','qwert'),('bgillcristk@vinaora.com','qwert'),('bvaneyn@about.me','qwert'),('cdenormanvillek@independent.co.uk','qwert'),('cdesousae@cornell.edu','qwert'),('cmudled@spotify.com','qwert'),('crihanekg@dyndns.org','qwert'),('cwoolhouses@hc360.com','qwert'),('dberntssons@free.fr','qwert'),('dcanbyq@usda.gov','qwert'),('dewera@oaic.gov.au','qwert'),('dmacleesej@flavors.me','qwert'),('drammello@prlog.org','qwert'),('draubenheimers2@xrea.com','qwert'),('eclemenceaum@1688.com','qwert'),('edickeyn@sbwire.com','qwert'),('email@email.com','user123'),('emargarsonl@unesco.org','qwert'),('epercevalh@zdnet.com','qwert'),('erosenblath1@tamu.edu','qwert'),('fakedata@email.com','qwert'),('ffollenf@facebook.com','qwert'),('fwaslingc@chron.com','qwert'),('gcowperthwaiteg@soundcloud.com','qwert'),('gfergusont@squidoo.com','qwert'),('ggodehardsfr@examiner.com','qwert'),('glooki@nytimes.com','qwert'),('gmatton9@bbc.co.uk','qwert'),('ierswellq@japanpost.jp','qwert'),('jbeincken0@soup.io','qwert'),('jimassa@uh.edu','qwert'),('jmccuaig6@ihg.com','qwert'),('kokeym@tinyurl.com','qwert'),('lardern7@cyberchimps.com','qwert'),('lbeszantb@gnu.org','qwert'),('lsallis8@adobe.com','qwert'),('lstentl@pbs.org','qwert'),('lswabeye@psu.edu','qwert'),('mcristoferi7@rakuten.co.jp','qwert'),('mevasonp@skype.com','qwert'),('mmccullaghb@godaddy.com','qwert'),('mswinfon8@drupal.org','qwert'),('mvandrill2@ameblo.jp','qwert'),('nhans4@mlb.com','qwert'),('npratep@bloomberg.com','qwert'),('nsketchley5@netvibes.com','qwert'),('oacock3@bravesites.com','qwert'),('pgrogora@independent.co.uk','qwert'),('ptoffelh@live.com','qwert'),('rdiclaudiof@phpbb.com','qwert'),('rmassardc@utexas.edu','qwert'),('sbenardj@cbsnews.com','qwert'),('sfrensche3@sogou.com','qwert'),('tlenox1@flavors.me','qwert'),('tmcneish6@ow.ly','qwert'),('vridsdoleo@si.edu','qwert');
/*!40000 ALTER TABLE `CustomerLogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Emails_to_send`
--

DROP TABLE IF EXISTS `Emails_to_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Emails_to_send` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mTo` varchar(128) NOT NULL,
  `email_sent` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10440 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Emails_to_send`
--

LOCK TABLES `Emails_to_send` WRITE;
/*!40000 ALTER TABLE `Emails_to_send` DISABLE KEYS */;
INSERT INTO `Emails_to_send` VALUES (10439,'fakedata@email.com','\0');
/*!40000 ALTER TABLE `Emails_to_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `LocationID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `AuthID` int(11) NOT NULL,
  `Fname` varchar(25) NOT NULL,
  `MInit` varchar(1) NOT NULL,
  `Lname` varchar(25) NOT NULL,
  `MobilePhone` varchar(20) NOT NULL,
  `WorkPhone` varchar(20) DEFAULT NULL,
  `Wage` double NOT NULL,
  `HiredOn` date NOT NULL,
  `WorkEmail` varchar(60) NOT NULL,
  `PersonalEmail` varchar(60) DEFAULT NULL,
  `HouseNumber` varchar(10) NOT NULL,
  `Street` varchar(40) NOT NULL,
  `ZipCode` varchar(10) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Country` varchar(20) NOT NULL,
  `CurrentlyEmployed` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `EmployeesID_UNIQUE` (`EmployeeID`),
  UNIQUE KEY `MobliePhone_UNIQUE` (`MobilePhone`),
  UNIQUE KEY `WorkEmail_UNIQUE` (`WorkEmail`),
  UNIQUE KEY `PersonalEmail_UNIQUE` (`PersonalEmail`),
  UNIQUE KEY `WorkPhone_UNIQUE` (`WorkPhone`),
  KEY `fk_Employee_Location1_idx` (`LocationID`),
  KEY `fk_Employee_Roles1_idx` (`RoleID`),
  KEY `fk_Employee_AUTH1_idx` (`AuthID`),
  CONSTRAINT `fk_Employee_AUTH1` FOREIGN KEY (`AuthID`) REFERENCES `Authentication` (`AuthenticationID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Employee_Location1` FOREIGN KEY (`LocationID`) REFERENCES `Location` (`LocationID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Employee_Roles1` FOREIGN KEY (`RoleID`) REFERENCES `Roles` (`RolesID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10097 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (10003,101,1,1,'John','A','Smith','713-234-2342','111-111-1234',12.1,'2014-02-12','johnSmith@gmail.com','personal@gmail.com','11234','trhis street','88123','Hoiuston','TX','USA',1),(10004,101,3,2,'sort','Q','Meth','123-234-3543','123-234-6432',14.25,'2014-02-15','sort@gmail.com','Personalemail@gmail.com','234','Street third','5234','Houston','TX','USA',1),(10005,101,5,1,'Burl','S','Blenkhorn','706-890-8414','904-889-6002',11.89,'2015-12-22','bblenkhorn0@weibo.com','bblenkhorn0@meetup.com','2595','Saint Paul','71482','Athens','GA','USA',1),(10006,101,1,1,'Wendall','B','Ditchett','218-843-7976','812-238-6434',12.3,'2017-08-12','wditchett1@is.gd','wditchett1@spiegel.de','1266','Grim','45438','Duluth','MN','USA',1),(10007,101,2,1,'Lothario','H','Vergine','203-332-7882','480-851-0069',11.98,'2016-06-12','lvergine2@xrea.com','lvergine2@hud.gov','6679','Michigan','58382','Stamford','CT','USA',1),(10008,101,2,1,'Christiana','A','Gehringer','801-377-5419','202-792-2240',12.01,'2016-10-29','cgehringer3@lycos.com','cgehringer3@goo.ne.jp','2352','Lotheville','82889','Salt Lake City','UT','USA',1),(10009,101,5,1,'Annette','J','Seys','615-708-7393','313-921-9653',11.97,'2017-03-31','aseys4@yelp.com','aseys4@google.co.jp','3751','Carioca','78674','Nashville','TN','USA',1),(10010,101,2,1,'Dee','A','Ormrod','404-123-2540','952-542-7548',12.07,'2017-01-16','dormrod5@goo.gl','dormrod5@liveinternet.ru','4827','Parkside','70987','Atlanta','GA','USA',1),(10011,101,5,1,'Teddi','R','Bibbie','208-827-7675','646-587-2184',11.79,'2017-03-22','tbibbie6@google.de','tbibbie6@umich.edu','4854','Mendota','75536','Boise','ID','USA',1),(10012,102,1,1,'Fair','N','Cloke','571-815-9368','512-598-5088',12.29,'2017-03-25','fcloke7@stumbleupon.com','fcloke7@deviantart.com','3199','Butternut','91273','Dulles','VA','USA',1),(10031,101,1,1,'Kevin','T','Lucas','888-192-703','999-123-1111',13.2,'2019-04-17','ktlucas@work.com','Klucas@gmail.com','1622','conrad','77043','Houston','TX','USA',1),(10032,102,1,1,'Ralina','G','Gobolos','310-491-4009','717-691-7029',12.3,'2015-04-01','rgobolos0@pinterest.com','rgobolos0@liveinternet.ru','4358','Cardinal','49963','Anaheim','CA','USA',1),(10033,102,1,1,'Arliene','H','Dincke','704-864-5102','713-813-3629',10.99,'2014-06-01','adincke1@behance.net','adincke1@t.co','5658','1st','77243','Charlotte','NC','USA',1),(10034,102,1,1,'Benedetta','S','Fitter','505-763-4037','718-838-9408',12.7,'2015-03-31','bfitter2@pen.io','bfitter2@cyberchimps.com','4711','Lindbergh','74783','Albuquerque','NM','USA',1),(10035,102,1,1,'Doug','Q','Pallin','203-381-5375','408-348-5346',12.99,'2017-04-15','dpallin3@cam.ac.uk','dpallin3@japanpost.jp','7684','Sheridan','55780','Danbury','CT','USA',1),(10036,102,1,1,'Boothe','P','Tommasuzzi','415-969-4521','804-744-3817',12.11,'2017-11-30','btommasuzzi4@stumbleupon.com','btommasuzzi4@mashable.com','3626','Northview','50162','San Francisco','CA','USA',1),(10037,103,1,1,'Mic','Z','Row','508-387-7822','404-137-1485',11.57,'2017-06-24','mrow0@exblog.jp','mrow0@typepad.com','6972','Oak Valley','74030','Brockton','MA','USA',1),(10038,103,1,1,'Carline','S','Brownfield','920-657-8885','415-865-1830',13.14,'2015-04-19','cbrownfield1@yandex.ru','cbrownfield1@e-recht24.de','1008','Burrows','56745','Appleton','WI','USA',1),(10039,103,1,1,'Roldan','V','Maine','317-609-5552','415-884-4268',11.77,'2015-09-20','rmaine2@blog.com','rmaine2@paypal.com','2430','Delladonna','76465','Indianapolis','IN','USA',1),(10040,103,1,1,'Jamie','Q','Buney','636-635-7211','520-903-3858',10.96,'2017-01-15','jbuney3@deliciousdays.com','jbuney3@irs.gov','1641','Trailsway','70964','Saint Louis','MO','USA',1),(10041,103,1,1,'Osmund','I','Kelby','312-630-1538','304-239-4687',11.61,'2017-11-24','okelby4@ocn.ne.jp','okelby4@pbs.org','5364','Declaration','51586','Chicago','IL','USA',1),(10042,104,1,1,'Winna','A','Grichukhin','814-732-9955','480-356-3594',12.6,'2016-04-01','wgrichukhin0@nationalgeographic.com','wgrichukhin0@skyrock.com','6269','Hollow Ridge','63586','Erie','PA','USA',1),(10043,104,1,1,'Clemmy','B','Mepsted','304-477-1036','704-536-5731',11.83,'2015-09-21','cmepsted1@businessweek.com','cmepsted1@wiley.com','7708','Doe Crossing','54828','Huntington','WV','USA',1),(10044,104,1,1,'Noll','Q','Gaize','309-270-4655','501-834-3315',10.78,'2017-11-03','ngaize2@g.co','ngaize2@amazon.co.jp','1779','South','57211','Peoria','IL','USA',1),(10045,104,1,1,'Lucius','V','Lamplough','480-478-1577','512-737-4319',12.18,'2015-02-02','llamplough3@goodreads.com','llamplough3@cbc.ca','2396','Grover','72702','Apache Junction','AZ','USA',1),(10046,104,1,1,'Benny','G','Redley','915-990-0915','202-446-4180',11.13,'2018-07-09','bredley4@rediff.com','bredley4@prweb.com','1972','Fordem','73510','El Paso','TX','USA',1),(10047,105,1,1,'Beverley','H','Jewkes','202-363-1322','323-479-8413',13.08,'2017-01-23','bjewkes0@usda.gov','bjewkes0@nbcnews.com','3216','Eagan','52452','Washington','DC','USA',1),(10048,105,1,1,'Fayre','J','Mcettrick','626-403-1681','406-414-0096',12.83,'2015-11-23','fmcettrick1@msn.com','fmcettrick1@upenn.edu','1379','Sherman','71849','Pasadena','CA','USA',1),(10049,105,1,1,'Allsun','U','Fillimore','512-441-8211','253-277-1147',11.54,'2018-04-19','afillimore2@nytimes.com','afillimore2@usnews.com','4492','Di Loreto','53570','Austin','TX','USA',1),(10050,105,1,1,'Noami','Y','Grelka','626-150-2574','713-886-5663',11.9,'2015-07-22','ngrelka3@edublogs.org','ngrelka3@telegraph.co.uk','2252','Drewry','69655','Whittier','CA','USA',1),(10051,105,1,1,'Ardis','T','McNutt','330-247-5166','612-109-6639',12.64,'2016-08-19','amcnutt4@earthlink.net','amcnutt4@indiatimes.com','4215','Sloan','70266','Canton','OH','USA',1),(10052,106,1,1,'Flossi','R','Jervis','919-941-1782','816-209-1401',10.81,'2018-06-26','fjervis0@boston.com','fjervis0@wikispaces.com','3646','Fisk','50774','Raleigh','NC','USA',1),(10053,106,1,1,'Sherilyn','E','Crowhurst','757-708-4428','760-398-0196',10.86,'2018-07-23','scrowhurst1@npr.org','scrowhurst1@wp.com','7670','Forest Run','51275','Norfolk','VA','USA',1),(10054,106,1,1,'Reinaldos','N','Doxey','913-403-4798','712-248-7980',10.27,'2014-07-02','rdoxey2@de.vu','rdoxey2@example.com','1829','Birchwood','70415','Kansas City','KS','USA',1),(10055,106,1,1,'Kristyn','M','Francello','315-105-9098','719-904-7868',11.82,'2015-02-07','kfrancello3@yellowbook.com','kfrancello3@exblog.jp','5458','Spohn','55353','Syracuse','NY','USA',1),(10056,106,1,1,'Kellie','H','McLugish','803-138-8149','216-597-2068',10.45,'2015-12-08','kmclugish4@fda.gov','kmclugish4@shop-pro.jp','2093','Brentwood','66395','Columbia','SC','USA',1),(10057,102,2,1,'Elsie','K','Thorlby','706-951-2540','504-706-4687',12.4,'2014-10-06','ethorlby0@hao123.com','ethorlby0@etsy.com','3573','Scoville','64113','Augusta','GA','USA',1),(10058,102,2,1,'Ambrose','U','Damato','940-288-3563','540-657-5981',11.57,'2017-06-13','adamato1@theglobeandmail.com','adamato1@example.com','2026','Warbler','76415','Wichita Falls','TX','USA',1),(10059,102,2,1,'Xever','A','Gatheral','202-745-3310','516-852-0076',10.9,'2018-09-03','xgatheral2@goodreads.com','xgatheral2@printfriendly.com','4180','Superior','68997','Washington','DC','USA',1),(10060,102,2,1,'Silvan','S','Phillipp','831-530-8833','228-785-9130',11.16,'2016-07-26','sphillipp3@smugmug.com','sphillipp3@microsoft.com','7463','Vernon','57974','Salinas','CA','USA',1),(10061,103,2,1,'Briny','C','Eivers','213-427-3193','205-682-9982',10.12,'2015-10-01','beivers0@baidu.com','beivers0@goo.ne.jp','747','Sutherland','50065','Van Nuys','CA','USA',1),(10062,103,2,1,'Collette','D','Bednell','704-136-3775','720-329-0100',10.13,'2016-01-22','cbednell1@hatena.ne.jp','cbednell1@cam.ac.uk','5315','Autumn Leaf','61136','Charlotte','NC','USA',1),(10063,103,2,1,'Dannel','F','Wrankmore','502-436-0040','704-894-6728',11.37,'2015-09-05','dwrankmore2@go.com','dwrankmore2@uiuc.edu','7188','Shelley','74050','Louisville','KY','USA',1),(10064,103,2,1,'Emilie','V','Seager','614-477-2210','505-313-0306',10.25,'2014-09-29','eseager3@skype.com','eseager3@multiply.com','5639','Sullivan','73643','Columbus','OH','USA',1),(10065,104,2,1,'Zelda','H','Vian','724-398-3980','256-463-4596',13.08,'2015-10-12','zvian0@topsy.com','zvian0@twitpic.com','3435','Harbort','67268','Pittsburgh','PA','USA',1),(10066,104,2,1,'Phillipe','T','Hallums','216-725-5096','919-644-7560',11.02,'2014-08-09','phallums1@bravesites.com','phallums1@newsvine.com','5185','American Ash','72784','Cleveland','OH','USA',1),(10067,104,2,1,'Doris','R','Clegg','513-855-2319','801-963-5563',12.19,'2018-03-05','dclegg2@toplist.cz','dclegg2@angelfire.com','3658','Forest Dale','65040','Cincinnati','OH','USA',1),(10068,104,2,1,'Oralia','E','Januszkiewicz','619-516-3965','832-412-6483',13.18,'2016-05-12','ojanuszkiewicz3@bloglovin.com','ojanuszkiewicz3@a8.net','5637','Prentice','57916','San Diego','CA','USA',1),(10069,105,2,1,'Ninette','E','Dominelli','517-868-8739','317-205-4649',13.03,'2015-04-26','ndominelli0@elpais.com','ndominelli0@va.gov','7586','Lindbergh','76607','Lansing','MI','USA',1),(10070,105,2,1,'Aline','W','Kerridge','949-426-1343','605-791-1542',11.67,'2017-08-16','akerridge1@edublogs.org','akerridge1@hao123.com','2332','Sutherland','71689','San Diego','CA','USA',1),(10071,105,2,1,'Kerrin','Q','Sharrocks','313-396-4865','772-540-3612',11.5,'2015-08-19','ksharrocks2@dell.com','ksharrocks2@washingtonpost.com','6866','Autumn Leaf','53548','Detroit','MI','USA',1),(10072,105,2,1,'Nance','K','Kenworthy','518-996-7806','405-510-4643',10.99,'2016-01-30','nkenworthy3@washington.edu','nkenworthy3@trellian.com','1351','Cordelia','59193','Albany','NY','USA',1),(10073,106,2,1,'Hendrick','L','Pietron','402-359-5795','903-796-6245',11.18,'2015-02-04','hpietron0@arstechnica.com','hpietron0@illinois.edu','3850','Macpherson','66985','Omaha','NE','USA',1),(10074,106,2,1,'Cyb','O','Tollerfield','410-727-2827','202-695-6755',10.97,'2017-07-28','ctollerfield1@t.co','ctollerfield1@mediafire.com','484','International','65975','Baltimore','MD','USA',1),(10075,106,2,1,'Jennie','L','Albany','717-933-0614','414-326-1464',12.98,'2015-10-11','jalbany2@drupal.org','jalbany2@xing.com','5215','Porter','59188','Harrisburg','PA','USA',1),(10076,106,2,1,'Brian','P','Orts','213-746-5328','850-599-6244',11.52,'2018-02-03','borts3@yandex.ru','borts3@unicef.org','6303','Truax','56182','Los Angeles','CA','USA',1),(10077,102,5,1,'Marylou','A','Iddons','361-265-7249','407-388-9608',10.89,'2016-08-22','middons0@twitpic.com','middons0@ocn.ne.jp','1928','Forster','71270','Corpus Christi','TX','USA',1),(10078,102,5,1,'Gris','S','Wickey','713-772-9044','609-398-7227',13.07,'2017-08-29','gwickey1@ustream.tv','gwickey1@cnbc.com','1716','Columbus','63548','Houston','TX','USA',1),(10079,102,5,1,'Romola','C','Pimlock','206-916-8362','253-310-9117',10.23,'2015-01-08','rpimlock2@quantcast.com','rpimlock2@photobucket.com','6948','Bellgrove','76166','Seattle','WA','USA',1),(10080,103,5,1,'Kermy','X','Woolley','614-390-8714','718-170-9454',11.91,'2015-11-15','kwoolley0@toplist.cz','kwoolley0@seesaa.net','3245','Jana','77854','Columbus','OH','USA',1),(10081,103,5,1,'Arabela','V','Wixey','415-228-9094','907-676-3374',11.5,'2015-06-24','awixey1@nymag.com','awixey1@devhub.com','4049','Shopko','57800','San Francisco','CA','USA',1),(10082,103,5,1,'Cris','F','Naton','313-180-1720','202-380-7621',12.73,'2014-07-22','cnaton2@tinyurl.com','cnaton2@ebay.com','1239','Prairieview','78211','Detroit','MI','USA',1),(10083,104,5,1,'Atalanta','G','Getley','804-846-8737','331-356-0347',10.88,'2014-11-03','agetley0@quantcast.com','agetley0@alexa.com','3147','Grim','75426','Richmond','VA','USA',1),(10084,104,5,1,'Blaine','Z','Baggott','251-243-9221','614-437-3271',10.3,'2014-09-25','bbaggott1@gnu.org','bbaggott1@istockphoto.com','7397','Jenna','60122','Mobile','AL','USA',1),(10085,104,5,1,'Jennifer','X','Pettisall','817-799-8499','434-549-4198',10.16,'2016-06-09','jpettisall2@over-blog.com','jpettisall2@google.co.uk','7083','Village Green','64902','Fort Worth','TX','USA',1),(10086,105,5,1,'Thorny','C','Pimm','619-328-5959','754-662-5697',11.51,'2018-04-11','tpimm0@creativecommons.org','tpimm0@dion.ne.jp','3470','Onsgard','67268','San Diego','CA','USA',1),(10087,105,5,1,'Nedda','J','Lapree','714-284-0500','360-330-6532',11.71,'2018-04-13','nlapree1@e-recht24.de','nlapree1@photobucket.com','1154','Stang','59892','Santa Ana','CA','USA',1),(10088,105,5,1,'Sammy','H','Chestnutt','571-919-0083','816-576-7381',11.08,'2014-05-10','schestnutt2@pen.io','schestnutt2@yahoo.com','7437','Twin Pines','54708','Arlington','VA','USA',1),(10089,106,5,1,'Magnum','O','Lanon','206-767-8958','915-954-5372',11.8,'2017-05-31','mlanon0@unesco.org','mlanon0@devhub.com','571','Beilfuss','54641','Seattle','WA','USA',1),(10090,106,5,1,'Emery','P','Franzoli','682-744-4179','415-953-1942',11.22,'2018-05-05','efranzoli1@about.com','efranzoli1@goo.ne.jp','2586','Commercial','65245','Fort Worth','TX','USA',1),(10091,106,5,1,'Milka','A','Streather','860-610-0698','910-577-7243',10.7,'2016-03-12','mstreather2@joomla.org','mstreather2@typepad.com','5065','Wayridge','58043','Hartford','CT','USA',1),(10092,102,3,2,'Athene','S','Hazeldine','254-805-2154','412-941-8593',11.75,'2014-06-10','ahazeldine0@hud.gov','ahazeldine0@quantcast.com','1030','Debs','63416','Temple','TX','USA',1),(10093,103,3,2,'Davie','S','Storre','412-186-6314','860-779-9729',11.67,'2015-02-28','dstorre1@virginia.edu','dstorre1@vimeo.com','4599','Talisman','53331','Pittsburgh','PA','USA',1),(10094,104,3,2,'Jeanelle','S','McHale','513-741-8243','603-599-0038',13.04,'2015-03-07','jmchale2@google.nl','jmchale2@ox.ac.uk','5225','Susan','54369','Cincinnati','OH','USA',1),(10095,105,3,2,'Adriena','D','Barthropp','225-541-0939','304-189-0170',10.55,'2018-03-21','abarthropp3@abc.net.au','abarthropp3@vk.com','2342','Mosinee','72529','Baton Rouge','LA','USA',1),(10096,106,3,2,'Elsey','D','Roz','601-635-0075','202-257-2632',12.72,'2018-06-11','eroz4@moonfruit.com','eroz4@goo.ne.jp','2595','Armistice','71642','Jackson','MS','USA',1);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`masterUsername`@`%`*/ /*!50003 TRIGGER `PostOffice`.`Employee_AFTER_INSERT` AFTER INSERT ON `Employee` FOR EACH ROW
BEGIN
    IF 
		(SELECT COUNT(*) 
			FROM EmployeeLogin 
				WHERE NEW.EmployeeID = EmployeeLogin.EmployeeID) = 0 
    
    THEN
		INSERT INTO `PostOffice`.`EmployeeLogin`
		(`EmployeeID`,`EmployeePassword`)
		VALUES
		(NEW.EmployeeID, 'qwert');
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `EmployeeLogin`
--

DROP TABLE IF EXISTS `EmployeeLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmployeeLogin` (
  `EmployeeID` int(11) NOT NULL,
  `EmployeePassword` varchar(60) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `EmployeeID_UNIQUE` (`EmployeeID`),
  CONSTRAINT `fk_EmployeeLogin_Employee1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeLogin`
--

LOCK TABLES `EmployeeLogin` WRITE;
/*!40000 ALTER TABLE `EmployeeLogin` DISABLE KEYS */;
INSERT INTO `EmployeeLogin` VALUES (10003,'employee123'),(10004,'e'),(10031,'qwert'),(10032,'qwert'),(10033,'qwert'),(10034,'qwert'),(10035,'qwert'),(10036,'qwert'),(10037,'qwert'),(10038,'qwert'),(10039,'qwert'),(10040,'qwert'),(10041,'qwert'),(10042,'qwert'),(10043,'qwert'),(10044,'qwert'),(10045,'qwert'),(10046,'qwert'),(10047,'qwert'),(10048,'qwert'),(10049,'qwert'),(10050,'qwert'),(10051,'qwert'),(10052,'qwert'),(10053,'qwert'),(10054,'qwert'),(10055,'qwert'),(10056,'qwert'),(10057,'qwert'),(10058,'qwert'),(10059,'qwert'),(10060,'qwert'),(10061,'qwert'),(10062,'qwert'),(10063,'qwert'),(10064,'qwert'),(10065,'qwert'),(10066,'qwert'),(10067,'qwert'),(10068,'qwert'),(10069,'qwert'),(10070,'qwert'),(10071,'qwert'),(10072,'qwert'),(10073,'qwert'),(10074,'qwert'),(10075,'qwert'),(10076,'qwert'),(10077,'qwert'),(10078,'qwert'),(10079,'qwert'),(10080,'qwert'),(10081,'qwert'),(10082,'qwert'),(10083,'qwert'),(10084,'qwert'),(10085,'qwert'),(10086,'qwert'),(10087,'qwert'),(10088,'qwert'),(10089,'qwert'),(10090,'qwert'),(10091,'qwert'),(10092,'qwert'),(10093,'qwert'),(10094,'qwert'),(10095,'qwert'),(10096,'qwert');
/*!40000 ALTER TABLE `EmployeeLogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `LocationID` int(11) NOT NULL AUTO_INCREMENT,
  `Hours` varchar(10) NOT NULL,
  `BuildingNumber` varchar(10) NOT NULL,
  `Street` varchar(40) NOT NULL,
  `ZipCode` varchar(10) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Country` varchar(20) NOT NULL,
  PRIMARY KEY (`LocationID`),
  UNIQUE KEY `LocationID_UNIQUE` (`LocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (101,'07-17','725','Superior Way','77042','Houston','TX','USA'),(102,'07-19','123','sime street','77045','Houston','TX','USA'),(103,'07-18','5373','Oak','51455','Meridian','MS','USA'),(104,'07-18','1235','Killdeer','65384','Saint Cloud','MN','USA'),(105,'07-18','1104','Washington','98323','Santa Ana','CA','USA'),(106,'07-18','317','Algoma','61934','Atlanta','GA','USA');
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Online Products`
--

DROP TABLE IF EXISTS `Online Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Online Products` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(30) NOT NULL,
  `Stock` int(10) NOT NULL,
  `Price` double unsigned NOT NULL,
  `ReStockDate` date NOT NULL,
  `Available` tinyint(1) NOT NULL DEFAULT '1',
  `ImagePath` varchar(100) DEFAULT NULL,
  `Description` varchar(100) NOT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `ProductID_UNIQUE` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Online Products`
--

LOCK TABLES `Online Products` WRITE;
/*!40000 ALTER TABLE `Online Products` DISABLE KEYS */;
INSERT INTO `Online Products` VALUES (1,'George H.W. Bush',0,11,'0000-00-00',0,'gwbush01-T0.jpg','Forever 55¢'),(2,'U.S. Flag',100,11,'0000-00-00',1,'740104-T0.jpg','Forever 55¢'),(3,'Hot Wheels',100,11,'0000-00-00',1,'569004-T0.jpg','Forever 55¢'),(4,'\"Little Mo\"',100,11,'0000-00-00',1,'478804-T0.jpg','Forever 55¢'),(5,'Transcontinental Rail',100,9.9,'0000-00-00',1,'570404-T0.jpg','Forever 55¢'),(6,'Post Office Murals',100,5.5,'0000-00-00',1,'571104-T0.jpg','Forever 55¢'),(7,'Shoe Box',100,3,'0000-00-00',1,'box1-t0.jpg','Pack of 10, 7x5x14'),(8,'Dual Use',100,4,'0000-00-00',1,'box5-To.jpg','Pack of 10, 12x4x14'),(9,'Mail Box - 7',100,4,'0000-00-00',1,'box2-T0.jpg','Pack of 10, 12x12x8'),(10,'Medium Tube -1098',100,5,'0000-00-00',1,'box4-T0.jpg','Pack of 10, 38x6x5x5'),(11,'Variety Pack',100,1,'0000-00-00',1,'box3-t0.jpg','4 Boxes');
/*!40000 ALTER TABLE `Online Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order Details`
--

DROP TABLE IF EXISTS `Order Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order Details` (
  `ProductID` int(11) NOT NULL,
  `TransactionID` int(11) NOT NULL,
  `Quantity` int(10) unsigned NOT NULL,
  `UnitPrice` double unsigned NOT NULL,
  PRIMARY KEY (`ProductID`,`TransactionID`),
  KEY `fk_Online Products_has_Online Transactions_Online Transacti_idx` (`TransactionID`),
  KEY `fk_Online Products_has_Online Transactions_Online Products1_idx` (`ProductID`),
  CONSTRAINT `fk_Online Products_has_Online Transactions_Online Products1` FOREIGN KEY (`ProductID`) REFERENCES `Online Products` (`ProductID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Online Products_has_Online Transactions_Online Transactions1` FOREIGN KEY (`TransactionID`) REFERENCES `Transactions` (`TransactionID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order Details`
--

LOCK TABLES `Order Details` WRITE;
/*!40000 ALTER TABLE `Order Details` DISABLE KEYS */;
INSERT INTO `Order Details` VALUES (1,10530,4,11);
/*!40000 ALTER TABLE `Order Details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`masterUsername`@`%`*/ /*!50003 TRIGGER `PostOffice`.`Order Details_AFTER_INSERT` AFTER INSERT ON `Order Details` FOR EACH ROW
BEGIN
	UPDATE `Online Products`
	SET Stock = (Stock - NEW.Quantity)
    WHERE ProductID = NEW.ProductID;
    
    IF (SELECT Stock FROM `Online Products` WHERE ProductID = NEW.ProductID) <= 0 THEN
		UPDATE `Online Products`
		SET Available = 0
		WHERE ProductID = NEW.ProductID;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Package`
--

DROP TABLE IF EXISTS `Package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Package` (
  `PackageID` int(11) NOT NULL AUTO_INCREMENT,
  `TransactionID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `SendToHouseNumber` varchar(10) NOT NULL,
  `SendToStreet` varchar(40) NOT NULL,
  `SendToZipCode` varchar(10) NOT NULL,
  `SendToCity` varchar(20) NOT NULL,
  `SendToState` varchar(20) NOT NULL,
  `SendToCountry` varchar(20) NOT NULL,
  `PackageWeight` double unsigned NOT NULL,
  `PackageSize` double unsigned NOT NULL,
  `SentDate` datetime NOT NULL,
  `ETA` date NOT NULL,
  `PackageStateID` int(11) NOT NULL,
  `Subscribed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`PackageID`),
  UNIQUE KEY `PackageID_UNIQUE` (`PackageID`),
  KEY `fk_Package_Customer1_idx` (`CustomerID`),
  KEY `fk_Package_Package State1_idx` (`PackageStateID`),
  KEY `fk_Package_Transactions1_idx` (`TransactionID`),
  CONSTRAINT `fk_Package_Customer1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Package_Package State1` FOREIGN KEY (`PackageStateID`) REFERENCES `Package State` (`PackageStateID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Package_Transactions1` FOREIGN KEY (`TransactionID`) REFERENCES `Transactions` (`TransactionID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10455 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Package`
--

LOCK TABLES `Package` WRITE;
/*!40000 ALTER TABLE `Package` DISABLE KEYS */;
INSERT INTO `Package` VALUES (10439,10443,10063,'1000','FAKE','64796','Plano','TX','USA',19.81,12,'2019-01-01 00:00:00','2019-04-29',3,0),(10444,10500,10001,'2223','Main Street','77043','Houston ','TX','USA',13.2,12,'2019-04-22 14:04:01','2019-04-28',2,0),(10445,10501,10001,'4323','Yale Street','77023','Houston','TX','USA',1.02,1,'2019-04-21 15:04:28','2019-04-27',2,0),(10446,10502,10001,'1622','Conrad Sauer Dr.','77043','Houston','TX','USA',34.2,15,'2019-04-20 15:04:57','2019-04-28',2,0),(10447,10503,10001,'9232','This street','77032','Houston','TX','USA',13.1,12,'2019-04-22 15:04:51','2019-04-30',2,0),(10448,10523,10001,'1234','Main Street','77771','Somewhere','TX','USA',12.1,12,'2019-04-22 18:04:46','0000-00-00',2,0),(10449,10524,10001,'1211','Somewhere Dr.','12312','Houston','TX','USA',12.2,12,'2019-04-22 18:04:04','2019-04-29',2,0),(10450,10526,10001,'9999','Blahblah Dr.','23132','Texas City','TX','USA',12.2,12,'2019-04-22 18:04:52','2019-04-29',2,0),(10451,10527,10001,'12334','Johnson Dr.','12313','Townsville','NY','USA',12.2,12,'2019-04-22 18:04:47','2019-04-03',2,0),(10452,10528,10001,'1111','Blahblah Circle','12234','Townsville','NY','USA',12.1,12,'2019-04-22 18:04:06','2019-04-29',2,0),(10453,10529,10001,'3242','Clay Road','77054','Houston','TX','USA',14.5,12,'2019-04-22 18:04:48','2019-05-02',2,0),(10454,10531,10001,'3333','main street','77232','Houston','TX','USA',23.4,12,'0000-00-00 00:00:00','2019-05-02',2,0);
/*!40000 ALTER TABLE `Package` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`masterUsername`@`%`*/ /*!50003 TRIGGER `PostOffice`.`IncrementTotalPackagesSent` BEFORE INSERT ON `Package` FOR EACH ROW
BEGIN
#	update Customer
#   set TotalPackagesSent = TotalPackagesSent + 1
#   where Customer.CustomerID = NEW.CustomerID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`masterUsername`@`%`*/ /*!50003 TRIGGER `PostOffice`.`Package_AFTER_UPDATE` AFTER UPDATE ON `Package` FOR EACH ROW
BEGIN
IF 
		NEW.PackageStateID <> OLD.PackageStateID
THEN
    INSERT INTO `PostOffice`.`Emails_to_send`
		(`CustomerID`)
		SELECT CustomerID FROM PostOffice.Package WHERE OLD.CustomerID = Package.CustomerID;
	INSERT INTO `PostOffice`.`Emails_to_send`
		(`mTo`)
        SELECT Email FROM PostOffice.Customer WHERE `CustomerID` = Package.CustomerID;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Package State`
--

DROP TABLE IF EXISTS `Package State`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Package State` (
  `PackageStateID` int(11) NOT NULL AUTO_INCREMENT,
  `State` varchar(20) NOT NULL,
  PRIMARY KEY (`PackageStateID`),
  UNIQUE KEY `PackageStateID_UNIQUE` (`PackageStateID`),
  UNIQUE KEY `State_UNIQUE` (`State`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Package State`
--

LOCK TABLES `Package State` WRITE;
/*!40000 ALTER TABLE `Package State` DISABLE KEYS */;
INSERT INTO `Package State` VALUES (5,'arrived'),(1,'delivered'),(3,'delivering'),(4,'sorting'),(2,'transit');
/*!40000 ALTER TABLE `Package State` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment type`
--

DROP TABLE IF EXISTS `Payment type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment type` (
  `typeID` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentTypeName` varchar(15) NOT NULL,
  PRIMARY KEY (`typeID`),
  UNIQUE KEY `Name_UNIQUE` (`PaymentTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment type`
--

LOCK TABLES `Payment type` WRITE;
/*!40000 ALTER TABLE `Payment type` DISABLE KEYS */;
INSERT INTO `Payment type` VALUES (6,'American Expres'),(5,'Capital One'),(1,'Cash'),(4,'Discover Card'),(3,'Mastercard'),(2,'Visa');
/*!40000 ALTER TABLE `Payment type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Roles` (
  `RolesID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(20) NOT NULL,
  PRIMARY KEY (`RolesID`),
  UNIQUE KEY `RolesID_UNIQUE` (`RolesID`),
  UNIQUE KEY `RoleName_UNIQUE` (`RoleName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (1,'Clerk'),(5,'Driver'),(4,'HR'),(3,'Manager'),(2,'Sorter');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tracking`
--

DROP TABLE IF EXISTS `Tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tracking` (
  `ROW` int(11) NOT NULL AUTO_INCREMENT,
  `PackageID` int(11) NOT NULL,
  `TruckID` int(11) DEFAULT NULL,
  `HandlerID` int(11) NOT NULL,
  `CurrentLocationID` int(11) DEFAULT NULL,
  `GoingToHouseNumber` varchar(10) DEFAULT NULL,
  `GoingToStreet` varchar(40) DEFAULT NULL,
  `GoingToZipCode` varchar(10) DEFAULT NULL,
  `GoingToCity` varchar(20) DEFAULT NULL,
  `GoingToState` varchar(20) DEFAULT NULL,
  `GoingToCountry` varchar(20) DEFAULT NULL,
  `GoingToLocationID` int(11) DEFAULT NULL,
  `Date` datetime NOT NULL,
  `Delivered` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ROW`),
  UNIQUE KEY `ROW_UNIQUE` (`ROW`),
  KEY `fk_Tracking_Package1` (`PackageID`),
  KEY `fk_Tracking_Trucks1_idx` (`TruckID`),
  KEY `fk_Tracking_Employee1_idx` (`HandlerID`),
  KEY `fk_Tracking_Location1_idx` (`CurrentLocationID`),
  KEY `fk_Tracking_Location2_idx` (`GoingToLocationID`),
  CONSTRAINT `fk_Tracking_Employee1` FOREIGN KEY (`HandlerID`) REFERENCES `Employee` (`EmployeeID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Tracking_Location1` FOREIGN KEY (`CurrentLocationID`) REFERENCES `Location` (`LocationID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Tracking_Location2` FOREIGN KEY (`GoingToLocationID`) REFERENCES `Location` (`LocationID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Tracking_Package1` FOREIGN KEY (`PackageID`) REFERENCES `Package` (`PackageID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Tracking_Trucks1` FOREIGN KEY (`TruckID`) REFERENCES `Trucks` (`TruckID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1462 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tracking`
--

LOCK TABLES `Tracking` WRITE;
/*!40000 ALTER TABLE `Tracking` DISABLE KEYS */;
INSERT INTO `Tracking` VALUES (966,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(967,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(968,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(969,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(970,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(971,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(972,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(973,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(974,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(975,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(976,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(977,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(978,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(979,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(980,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(981,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(982,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(983,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(984,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(985,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(986,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(987,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(988,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(989,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(990,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(991,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(992,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(993,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(994,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(995,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(996,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(997,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(998,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(999,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1000,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1001,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1002,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1003,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1004,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1005,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1006,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1007,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1008,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1009,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1010,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1011,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1012,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1013,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1014,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1015,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1016,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1017,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1018,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1019,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1020,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1021,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1022,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1023,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1024,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1025,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1026,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1027,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1028,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1029,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1030,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1031,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1032,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1033,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1034,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1035,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1036,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1037,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1038,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1039,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1040,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1041,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1042,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1043,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1044,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1045,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1046,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1047,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1048,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1049,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1050,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1051,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1052,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1053,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1054,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1055,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1056,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1057,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1058,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1059,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1060,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1061,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1062,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1063,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1064,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1065,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1066,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1067,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1068,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1069,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1070,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1071,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1072,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1073,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1074,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1075,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1076,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1077,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1078,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1079,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1080,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1081,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1082,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1083,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1084,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1085,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1086,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1087,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1088,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1089,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1090,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1091,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1092,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1093,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1094,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1095,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1096,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1097,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1098,10439,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1099,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1100,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1101,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1102,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1103,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1104,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1105,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1106,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1107,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1108,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1109,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1110,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1111,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1112,10439,NULL,10006,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1113,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1114,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1115,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1116,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1117,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 00:00:00',0),(1118,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1119,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1120,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 00:00:00',0),(1121,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 03:00:00',0),(1122,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-21 02:00:00',0),(1123,10439,NULL,10031,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1125,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1126,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1127,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1128,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1129,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1130,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1131,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1132,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1133,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1134,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1135,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1136,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1137,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1138,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1139,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1140,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1141,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1142,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1143,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1144,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1145,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1146,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1147,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1148,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1149,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1150,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1151,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1152,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1153,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1154,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1155,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1156,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1157,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1158,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1159,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-02-02 01:00:00',0),(1160,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1161,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1162,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1163,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1164,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1165,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1166,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1167,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1168,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1169,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1170,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1171,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1172,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1173,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1174,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1175,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1176,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1177,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1178,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1179,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1180,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1181,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1182,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1183,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1184,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1185,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1186,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1187,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1188,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1189,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1190,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1191,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1192,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1193,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1194,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1195,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1196,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1197,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1198,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1199,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1200,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1201,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1202,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1203,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1204,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1205,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1206,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1207,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1208,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1209,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1210,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-04-22 01:00:00',0),(1211,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1212,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1213,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1214,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1215,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1216,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1217,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1218,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1219,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1220,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1221,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1222,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1223,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1224,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1225,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1226,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1227,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1228,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1229,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1230,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1231,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1232,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1233,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1234,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-03-02 01:00:00',0),(1235,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1236,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1237,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1238,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1239,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1240,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1241,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1242,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1243,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1244,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1245,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1246,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1247,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1248,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1249,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1250,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1251,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1252,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1253,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1254,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1255,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1256,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1257,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1258,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,101,'2019-01-02 01:00:00',0),(1259,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1260,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1261,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1262,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1263,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1264,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1265,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1266,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1267,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1268,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1269,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1270,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1271,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1272,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1273,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1274,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1275,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1276,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1277,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1278,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1279,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1280,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1281,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1282,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1283,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1284,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1285,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1286,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1287,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1288,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1289,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1290,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1291,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1292,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1293,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1294,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1295,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1296,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1297,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1298,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1299,10439,101,10007,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-02 01:00:00',0),(1300,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1301,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1302,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1303,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1304,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1305,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1306,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1307,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1308,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1309,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1310,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1311,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1312,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1313,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1314,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1315,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1316,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1317,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1318,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1319,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1320,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1321,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1322,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1323,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1324,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1325,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1326,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1327,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1328,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1329,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1330,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1331,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1332,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1333,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-02 01:00:00',0),(1334,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1335,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1336,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1337,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1338,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1339,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1340,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1341,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1342,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1343,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1344,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1345,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1346,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1347,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1348,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1349,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1350,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1351,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1352,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1353,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1354,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1355,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1356,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1357,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1358,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1359,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1360,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1361,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1362,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1363,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1364,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1365,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1366,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1367,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1368,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1369,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1370,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1371,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1372,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1373,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1374,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1375,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1376,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1377,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1378,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1379,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1380,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1381,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 01:00:00',0),(1382,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1383,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1384,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1385,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1386,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1387,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1388,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1389,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1390,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1391,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1392,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1393,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1394,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1395,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1396,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1397,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1398,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1399,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1400,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1401,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1402,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1403,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1404,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1405,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1406,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1407,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1408,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1409,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1410,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1411,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1412,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1413,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1414,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1415,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1416,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1417,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1418,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1419,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1420,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1421,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1422,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1423,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1424,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1425,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1426,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1427,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1428,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1429,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1430,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1431,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1432,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1433,10439,101,10005,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 01:00:00',0),(1434,10444,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 14:04:07',0),(1435,10445,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 15:04:33',0),(1436,10446,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-20 15:04:57',0),(1437,10447,101,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-20 15:04:57',0),(1440,10446,101,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,102,'2019-04-21 15:04:57',0),(1443,10446,101,10003,105,NULL,NULL,NULL,NULL,NULL,NULL,103,'2019-04-22 15:04:57',0),(1453,10446,104,10003,101,'1622','Conrad Sauer Dr.','77043','Houston','TX','USA',NULL,'2019-04-22 16:04:17',0),(1454,10448,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 18:04:53',0),(1455,10449,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 18:04:11',0),(1456,10450,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 18:04:58',0),(1457,10451,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 18:04:54',0),(1458,10452,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 18:04:11',0),(1459,10453,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00',0),(1460,10454,NULL,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-04-22 18:04:19',0),(1461,10454,104,10003,101,NULL,NULL,NULL,NULL,NULL,NULL,103,'2019-04-22 18:04:30',0);
/*!40000 ALTER TABLE `Tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transactions` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `DateOfSale` datetime NOT NULL,
  `TotalPrice` double unsigned NOT NULL,
  `FirstFourCC` varchar(4) DEFAULT NULL,
  `FnameCC` varchar(25) DEFAULT NULL,
  `LnameCC` varchar(25) DEFAULT NULL,
  `MInitCC` varchar(1) DEFAULT NULL,
  `PaymentTypeID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  UNIQUE KEY `TransactionID_UNIQUE` (`TransactionID`),
  KEY `fk_Online Transactions_Customer1_idx` (`CustomerID`),
  KEY `fk_Transactions_Payment type1_idx` (`PaymentTypeID`),
  KEY `fk_Transactions_Employee1_idx` (`EmployeeID`),
  CONSTRAINT `fk_Online Transactions_Customer1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Transactions_Employee1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Transactions_Payment type1` FOREIGN KEY (`PaymentTypeID`) REFERENCES `Payment type` (`typeID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10532 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
INSERT INTO `Transactions` VALUES (10443,10063,'2019-01-01 09:23:21',0,NULL,NULL,NULL,NULL,1,10003),(10444,10063,'2019-01-01 09:23:21',0,NULL,NULL,NULL,NULL,1,10006),(10445,10063,'2019-01-01 09:23:21',0,NULL,NULL,NULL,NULL,1,10008),(10446,10063,'2019-01-01 09:23:21',0,NULL,NULL,NULL,NULL,1,10031),(10500,10001,'2019-04-20 15:04:23',5.01,NULL,NULL,NULL,NULL,1,10003),(10501,10001,'2019-04-20 15:04:23',0.38,NULL,NULL,NULL,NULL,1,10003),(10502,10001,'2019-04-21 15:04:45',12.98,NULL,NULL,NULL,NULL,1,10003),(10503,10001,'2019-04-22 15:04:45',4.97,NULL,NULL,NULL,NULL,1,10003),(10515,10001,'2019-04-20 15:04:23',4.632949999999999,NULL,NULL,NULL,NULL,1,10003),(10516,10001,'2019-04-22 18:04:03',4.632949999999999,NULL,NULL,NULL,NULL,1,10003),(10517,10001,'2019-04-22 18:04:58',4.632949999999999,NULL,NULL,NULL,NULL,1,10003),(10518,10001,'2019-04-22 18:04:25',4.632949999999999,NULL,NULL,NULL,NULL,1,10003),(10519,10001,'2019-04-22 18:04:22',4.632949999999999,NULL,NULL,NULL,NULL,1,10003),(10520,10001,'2019-04-20 15:04:23',4.632949999999999,NULL,NULL,NULL,NULL,1,10003),(10521,10001,'2019-04-22 18:04:16',4.632949999999999,NULL,NULL,NULL,NULL,1,10003),(10522,10001,'2019-04-22 18:04:20',4.632949999999999,NULL,NULL,NULL,NULL,1,10003),(10523,10001,'2019-04-22 18:04:38',4.594975,NULL,NULL,NULL,NULL,1,10003),(10524,10001,'2019-04-20 15:04:23',4.632949999999999,NULL,NULL,NULL,NULL,1,10003),(10525,10001,'2019-04-22 18:04:47',4.632949999999999,NULL,NULL,NULL,NULL,1,10003),(10526,10001,'2019-04-22 18:04:46',4.632949999999999,NULL,NULL,NULL,NULL,1,10003),(10527,10001,'2019-04-22 18:04:38',4.632949999999999,NULL,NULL,NULL,NULL,1,10003),(10528,10001,'2019-04-20 15:04:23',4.594975,NULL,NULL,NULL,NULL,1,10003),(10529,10001,'2019-04-22 18:04:13',5.506374999999999,NULL,NULL,NULL,NULL,1,10003),(10530,10001,'2019-04-20 15:04:23',47.52,'1234','Kevin','Lucas','T',2,NULL),(10531,10001,'2019-04-22 18:04:54',8.886149999999999,NULL,NULL,NULL,NULL,1,10003);
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trucks`
--

DROP TABLE IF EXISTS `Trucks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Trucks` (
  `TruckID` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`TruckID`),
  UNIQUE KEY `TruckID_UNIQUE` (`TruckID`),
  KEY `fk_Trucks_Employee1_idx` (`EmployeeID`),
  CONSTRAINT `fk_Trucks_Employee1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trucks`
--

LOCK TABLES `Trucks` WRITE;
/*!40000 ALTER TABLE `Trucks` DISABLE KEYS */;
INSERT INTO `Trucks` VALUES (101,10005),(102,10009),(103,10011),(104,10077),(105,10078),(106,10079),(107,10080),(108,10081),(109,10082),(110,10083),(111,10084),(112,10085),(113,10086),(114,10087),(115,10088),(116,10089),(117,10090),(118,10091);
/*!40000 ALTER TABLE `Trucks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_system_mail_pickup`
--

DROP TABLE IF EXISTS `tbl_system_mail_pickup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_system_mail_pickup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mFrom` varchar(128) NOT NULL DEFAULT 'noreplyccms@YourDomain.co.uk',
  `mTo` varchar(128) NOT NULL,
  `mCC` varchar(128) DEFAULT NULL,
  `mBCC` varchar(128) DEFAULT NULL,
  `mSubject` varchar(254) DEFAULT NULL,
  `mBody` longtext,
  `added_by` varchar(36) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `added_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email_sent` bit(1) DEFAULT b'0',
  `send_tried` int(11) DEFAULT '0',
  `send_result` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_system_mail_pickup`
--

LOCK TABLES `tbl_system_mail_pickup` WRITE;
/*!40000 ALTER TABLE `tbl_system_mail_pickup` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_system_mail_pickup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-22 20:43:22
