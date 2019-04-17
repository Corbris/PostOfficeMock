const express = require('express');
const router = express.Router();

var mysql = require('mysql')

// Connect


const connection = mysql.createConnection({
  host: 'mysqlinstance.c0mjh6ewr0w9.us-east-2.rds.amazonaws.com',
  user: 'masterUsername',
  password: 'admin123',
  database: 'PostOffice'
});


connection.connect(function (err) {
    if (err) {
      console.error('error connecting: ' + err.stack);
      return;
    }

    console.log('connected as id ' + connection.threadId);
});

//LOGIN
//return ID of the User that logged in. email & password as params
router.get('/userLogin', (req, res) => {
  Email = req.query.email;
  Password = req.query.password
  connection.query('SELECT CustomerID FROM Customer WHERE Email = (SELECT CustomerEmail FROM CustomerLogin WHERE CustomerEmail = ? AND CustomerPassword = ?)', [Email, Password], function (err, rows, fields) {
    if (err) throw err
    res.json(rows);
    });
});


//LOGIN
//return authlevel of the employee that logged in. employeeID & password as params
router.get('/employeeLogin', (req, res) => {
  connection.query('SELECT AuthenticationLevel FROM Authentication WHERE AuthenticationID = (SELECT AuthID FROM Employee WHERE EmployeeID = (SELECT EmployeeID FROM EmployeeLogin WHERE EmployeeID = ? AND EmployeePassword = ?))', [req.query.id, req.query.password], function (err, rows, fields) {
    if (err) throw err
    res.json(rows);
  });
});



//TRACKING by ID return DATE Location City & state Package Send to address & status based on row
router.get('/packageTracking', (req, res) => {
  console.log(req.query.id);
  connection.query(
    //'SELECT Tracking.TruckID, Tracking.GoingToLocationID, Tracking.Date, Location.City, Location.State, Package.SendToHouseNumber, Package.SendToStreet FROM Tracking LEFT JOIN Location ON Tracking.CurrentLocationID = Location.LocationID LEFT JOIN Package ON Package.PackageID = Tracking.PackageID WHERE Tracking.PackageID = ?',[req.query.id], function (err, rows, fields) {
     'SELECT Tracking.TruckID, Tracking.GoingToLocationID, Tracking.Date, Location.City, Location.State, Tracking.GoingToHouseNumber, Tracking.GoingToStreet FROM Tracking LEFT JOIN Location ON Tracking.CurrentLocationID = Location.LocationID WHERE Tracking.PackageID = ?',[req.query.id], function (err, rows, fields) {
    if (err) throw err
      for (var x in rows) {
        //last in tracking
        if (x == rows.length - 1) {
          //first time in tracking, waiting to go on truck
          if(rows[x].TruckID == null)
          {
            rows[x].Status = "sorting";
          }
          else if (rows[x].GoingToLocationID == null)
          {
            rows[x].Status = "delivering";
            rows[x].City = rows[x].GoingToHouseNumber;
            rows[x].State = rows[x].GoingToStreet;
          }
          else {
            rows[x].Status = "in transit";
          }
        }
        //arived
        else if (x < rows.length - 1) {
          rows[x].Status = "arived";
        }
     
      }
    res.json(rows);
  });
});


//myPackages by user ID Return Package ID, SendTO address, ETA, status
router.get('/myPackages', (req, res) => {
  connection.query('SELECT Package.PackageID, Package.SendToHouseNumber, Package.SendToStreet, Package.SendToCity, Package.SendToState, Package.ETA, `Package State`.State FROM Package LEFT JOIN `Package State` ON `Package State`.PackageStateID = Package.PackageStateID WHERE CustomerID = ? ORDER BY Package.SentDate ASC', [req.query.id], function (err, rows, fields) {
    if (err) throw err
    res.json(rows);
  });
});


//packages going to Users ADDRESS by id RETURN Package ID, SendTO address, ETA, status
router.get('/packagesToAddress', (req, res) => {
  connection.query('SELECT Package.PackageID, Package.SendToHouseNumber, Package.SendToStreet, Package.SendToCity, Package.SendToState, Package.ETA, `Package State`.State FROM Package LEFT JOIN `Package State` ON `Package State`.PackageStateID = Package.PackageStateID LEFT JOIN Customer ON Package.SendToHouseNumber = Customer.HouseNumber AND Package.SendToStreet = Customer.Street AND Package.SendToZipCode = Customer.ZipCode  WHERE Customer.CustomerID = ?', [req.query.id], function (err, rows, fields) {
    if (err) throw err
    res.json(rows);
  });
});


//find location based on ABS of ZipCode
router.get('/findLocation', (req, res) => {
  connection.query('SELECT Location.LocationID, Location.BuildingNumber, Location.ZipCode, Location.City, Location.State, Location.Hours FROM Location ORDER BY ABS(Location.ZipCode - ?) ASC', [req.query.zip], function (err, rows, fields) {
    if (err) throw err
    res.json(rows);
  });
});

router.get('/registerUser', (req, res) => {
  console.log(req.query);
  connection.query('INSERT INTO Customer (`Fname`, `MInit`, `Lname`, `Email`, `MobileNumber`, `HouseNumber`, `Street`, `ZipCode`, `City`, `State`, `Country`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "USA")', [req.query.Fname, req.query.MInit, req.query.Lname, req.query.Email, req.query.MobileNumber, req.query.HouseNumber, req.query.Street, req.query.ZipCode, req.query.City, req.query.State], function (err, rows, fields) {
    if (err) console.log(err);
    res.json(err);

  });
});


router.get('/registerUserLogin', (req, res) => {
  console.log(req.query);
  connection.query('INSERT INTO CustomerLogin (`CustomerEmail`, `CustomerPassword`) VALUES (?, ?)', [req.query.Email, req.query.Password], function (err, rows, fields) {
    if (err) console.log(err);
    res.json(err);
  });
});


//customerFromID
router.get('/customerFromID', (req, res) => {
  console.log(req.query);
  connection.query('SELECT * FROM Customer WHERE CustomerID = ?', [req.query.id], function (err, rows, fields) {
    if (err) console.log(err);
    res.json(rows);
  });
});

//UpdateUser
router.get('/updateUser', (req, res) => {
  console.log(req.query);
  connection.query('UPDATE Customer SET `Fname`= ?, `MInit`= ?, `Lname`= ?, `Email`= ?, `MobileNumber`= ?, `HouseNumber`= ?, `Street`= ?, `ZipCode`= ?, `City`= ?, `State`= ? WHERE CustomerID = ? ',
    [req.query.Fname, req.query.MInit, req.query.Lname, req.query.Email, req.query.MobileNumber, req.query.HouseNumber, req.query.Street, req.query.ZipCode, req.query.City, req.query.State, req.query.id],
    function (err, rows, fields)
    {

    if (err) console.log(err);
    res.json(err);

  });
});

//insert transaction using CC
router.get('/packageTransactionCC', (req, res) => {
  console.log(req.query);
  connection.query('INSERT INTO Transactions (`CustomerID`, `DateOfSale`, `TotalPrice`, `FirstFourCC`, `FnameCC`, `LnameCC`, `MInitCC`, `PaymentTypeID`, `EmployeeID`) VALUES ((SELECT CustomerID FROM Customer WHERE Email = ?), ?, ?,?,?,?,?,?, ?)',
    [req.query.Email, req.query.Date, req.query.Total, req.query.FirstFourCC, req.query.FnameCC, req.query.LnameCC, req.query.MinitCC, req.query.PaymentType, req.query.EmployeeID],
    function (err, rows, fields) {

      if (err) console.log(err);
      res.json(rows);

    });
});

//insert transaction using Cash
router.get('/packageTransactionCash', (req, res) => {
  console.log(req.query);
  connection.query('INSERT INTO Transactions (`CustomerID`, `DateOfSale`, `TotalPrice`, `PaymentTypeID`, `EmployeeID`) VALUES ((SELECT CustomerID FROM Customer WHERE Email = ?), ?,?,?,?)',
    [req.query.Email, req.query.Date, req.query.Total, req.query.PaymentType, req.query.EmployeeID],
    function (err, rows, fields) {

      if (err) console.log(err);
      res.json(rows);

    });
});

//create a package
router.get('/createPackage', (req, res) => {
  console.log(req.query);
  connection.query(' INSERT INTO Package (`TransactionID`, `CustomerID`, `SendToHouseNumber`, `SendToStreet`, `SendToZipCode`, `SendToCity`, `SendToState`, `SendToCountry`, `PackageWeight`, `PackageSize`, `SentDate`, `ETA`, `PackageStateID`, `Subscribed`) VALUES (?, (SELECT CustomerID FROM Customer WHERE Email = ?), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)',
    [req.query.transactionID, req.query.CustomerEmail, req.query.SendToHouseNumber, req.query.SendToStreet, req.query.SendToZipCode, req.query.SendToCity, req.query.SendToState, req.query.SendToCountry, req.query.PackageWeight, req.query.PackageSize, req.query.SentDate, req.query.ETA, req.query.PackageStateID],
    function (err, rows, fields) {

      if (err) console.log(err);
      res.json(rows);

    });
});

//update Tracking To Location
router.get('/updateTrackingToLocation', (req, res) => {
  console.log(req.query);
  connection.query('INSERT INTO Tracking (`PackageID`, `TruckID`, `HandlerID`, `CurrentLocationID`, `GoingToLocationID`, `Date`) VALUES (?, ?, ?, (SELECT LocationID FROM Employee WHERE EmployeeID = ?), ?, ?)', [req.query.PackageID, req.query.TruckID, req.query.HandlerID, req.query.HandlerID, req.query.GoingToLocationID, req.query.Date], function (err, rows, fields) {
    if (err) console.log(err);
    res.json(err);
  });
});

//update Tracking To Address
/*router.get('/updateTrackingToAddress', (req, res) => {
  console.log(req.query);
  connection.query('INSERT INTO Tracking (`PackageID`, `TruckID`, `HandlerID`, `CurrentLocationID`, `GoingToHouseNumber`, `GoingToStreet`, `GoingToZipCode`, `GoingToCity`, `GoingToState`, `GoingToCountry` , `Date`) VALUES (?, ?, ?, (SELECT LocationID FROM Employee WHERE EmployeeID=?),?,?,?,?,?,"USA",?)', [req.query.PackageID, req.query.TruckID, req.query.HandlerID, req.query.HandlerID, req.query.GoingToHouseNumber, req.query.GoingToStreet, req.query.GoingToZipCode, req.query.GoingToCity, req.query.GoingToState, req.query.Date], function (err, rows, fields) {
    if (err) console.log(err);
    res.json(err);
  });
});*/

router.get('/updateTrackingToAddress', (req, res) => {
  console.log(req.query);
  connection.query('INSERT INTO Tracking (`PackageID`, `TruckID`, `HandlerID`, `CurrentLocationID`, `GoingToHouseNumber`, `GoingToStreet`, `GoingToZipCode`, `GoingToCity`, `GoingToState`, `GoingToCountry` , `Date`) VALUES (?, ?, ?, (SELECT LocationID FROM Employee WHERE EmployeeID = ?), (SELECT SendToHouseNumber FROM Package WHERE PackageID = ?), (SELECT SendToStreet FROM Package WHERE PackageID = ?), (SELECT SendToZipCode FROM Package WHERE PackageID = ?), (SELECT SendToCity FROM Package WHERE PackageID = ?), (SELECT SendToState FROM Package WHERE PackageID = ?), "USA",?)', [req.query.PackageID, req.query.TruckID, req.query.HandlerID, req.query.HandlerID, req.query.PackageID, req.query.PackageID, req.query.PackageID, req.query.PackageID, req.query.PackageID, req.query.Date], function (err, rows, fields) {
    if (err) console.log(err);
    res.json(err);
  });
});




//getTrucks
router.get('/getTrucks', (req, res) => {
  connection.query('SELECT TruckID FROM Trucks', function (err, rows, fields) {
    if (err) throw err
    res.json(rows);
  });
});


//getLocations
router.get('/getLocations', (req, res) => {
  connection.query('SELECT LocationID FROM Location', function (err, rows, fields) {
    if (err) throw err
    res.json(rows);
  });
});


//get employee by id
router.get('/getEmployee', (req, res) => {
  connection.query('SELECT * FROM Employee WHERE EmployeeID = ?', [req.query.id], function (err, rows, fields) {
    if (err) throw err
    res.json(rows);
  });
});



//UpdateUser
router.get('/updateEmployeePersonal', (req, res) => {
  console.log(req.query);
  connection.query('UPDATE Employee SET `Fname`= ?, `MInit`= ?, `Lname`= ?, `PersonalEmail`= ?, `MobilePhone`= ?, `HouseNumber`= ?, `Street`= ?, `ZipCode`= ?, `City`= ?, `State`= ? WHERE EmployeeID = ? ',
    [req.query.Fname, req.query.MInit, req.query.Lname, req.query.Email, req.query.MobileNumber, req.query.HouseNumber, req.query.Street, req.query.ZipCode, req.query.City, req.query.State, req.query.id],
    function (err, rows, fields) {

      if (err) console.log(err);
      res.json(err);

    });
});


//customerFromEmail
router.get('/customerFromEmail', (req, res) => {
  console.log(req.query);
  connection.query('SELECT * FROM Customer WHERE Email = ?', [req.query.Email], function (err, rows, fields) {
    if (err) console.log(err);
    res.json(rows);
  });
});

router.get('/updateTrackingNewPackage', (req, res) => {
  console.log(req.query);
  connection.query('INSERT INTO Tracking (`PackageID`, `HandlerID`, `CurrentLocationID`, `Date`) VALUES (?, ?, (SELECT LocationID FROM Employee WHERE EmployeeID = ?), ?)', [req.query.PackageID, req.query.HandlerID, req.query.HandlerID, req.query.Date], function (err, rows, fields) {
    if (err) console.log(err);
    res.json(err);
  });
});

//get employee from id
router.get('/employeeFromId', (req, res) => {
  console.log(req.query);
  connection.query('SELECT * FROM Employee WHERE EmployeeID = ?', [req.query.id], function (err, rows, fields) {
    if (err) console.log(err);
    res.json(rows);
  });
});


router.get('/employeesFromManager', (req, res) => {
  console.log(req.query);
  connection.query('SELECT * FROM Employee WHERE LocationID = (SELECT LocationID FROM Employee WHERE EmployeeID = ?)', [req.query.id], function (err, rows, fields) {
    if (err) console.log(err);
    res.json(rows);
  });
});

//shop products
router.get('/shopProducts', (req, res) => {
  connection.query('SELECT * FROM `Online Products` WHERE Available = 1', function (err, rows, fields) {
    if (err) console.log(err);
    res.json(rows);
  });
});

//Location report
/*router.get('/locationPackagesDuringTime', (req, res) => {
  console.log(req.query);
  connection.query('SELECT COUNT(*) FROM Tracking WHERE (DATE(Tracking.Date) > ? AND DATE(Tracking.Date) < ?) AND Tracking.TruckID is null AND CurrentLocationID = ?', [req.query.startDate, req.query.endDate, req.query.locationID], function (err, rows, fields) { 
    if (err) console.log(err);
    res.json(rows);
  });
});*/

router.get('/locationPackagesDuringTime', (req, res) => {
  console.log(req.query);
  connection.query('SELECT (SELECT COUNT(*) FROM Tracking WHERE (DATE(Date) > ? AND DATE(Date) < ?) AND TruckID IS NULL AND CurrentLocationID = ?) AS originated, (SELECT COUNT(*) FROM Tracking WHERE (DATE(Date) > ? AND DATE(Date) < ?) AND TruckID IS NOT NULL AND CurrentLocationID = ?) AS passing, (SELECT COUNT(*) FROM Tracking WHERE (DATE(Date) > ? AND DATE(Date) < ?) AND TruckID IS NOT NULL AND GoingtoLocationID is null AND CurrentLocationID = ?) AS delivered',
    [req.query.startDate, req.query.endDate, req.query.locationID, req.query.startDate, req.query.endDate, req.query.locationID, req.query.startDate, req.query.endDate, req.query.locationID], function (err, rows, fields) {
    if (err) console.log(err);
    res.json(rows);
  });
});


//locationOfEmployee
router.get('/locationOfEmployee', (req, res) => {
  connection.query('SELECT LocationID FROM Employee WHERE EmployeeID = ?', [req.query.id], function (err, rows, fields) {
    if (err) console.log(err);
    res.json(rows);
  });
});

router.get('/employeeClerksFromManager', (req, res) => {
  console.log(req.query);
  connection.query('SELECT * FROM Employee WHERE LocationID = (SELECT LocationID FROM Employee WHERE EmployeeID = ?) AND RoleID = 1', [req.query.id], function (err, rows, fields) {
    if (err) console.log(err);
    res.json(rows);
  });
});


router.get('/employeeClerksPackages', (req, res) => {
  connection.query('SELECT COUNT(*) FROM Tracking WHERE ((Date) > ? AND (Date) < ?) AND HandlerID = ? AND TruckID is null', [req.query.startDate, req.query.endDate, req.query.id], function (err, rows, fields) {
    if (err) console.log(err);
    res.json(rows);
  });
});



module.exports = router;
