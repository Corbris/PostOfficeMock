import { Injectable } from '@angular/core';
import { HttpClientModule, HttpHeaders, HttpErrorResponse, HttpParams, HttpClient  } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { map, catchError, tap } from 'rxjs/operators';

const endpoint = 'http://localhost:3000/api/';
const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
};

@Injectable({
  providedIn: 'root'
})
export class APIService {

  constructor(private http: HttpClient) {}

  private extractData(res: Response) {
    let body = res;
    return body || {};
  }

  //USER LOGIN WITH EMAIL & PASSWORD
  userLoginAuth(email : string, password : string): Observable<any> {
    const params = new HttpParams().set('email', email).set('password', password);
    return this.http.get('http://localhost:3000/api/userLogin', { params });
  }

  employeeLoginAuth(id: string, password: string): Observable<any> {
    const params = new HttpParams().set('id', id).set('password', password);
    return this.http.get('http://localhost:3000/api/employeeLogin', { params });
  }

  //tracking package with ID
  packageTracking(id: string): Observable<any> {
    const params = new HttpParams().set('id', id);
    return this.http.get('http://localhost:3000/api/packageTracking', { params });
  }

  //myPackages by user id
  myPackages(id: string): Observable<any> {
    const params = new HttpParams().set('id', id);
    return this.http.get('http://localhost:3000/api/myPackages', { params });
  }

  //packages to address by user id
  packagesToAddress(id: string): Observable<any> {
    const params = new HttpParams().set('id', id);
    return this.http.get('http://localhost:3000/api/packagesToAddress', { params });
  }

  //closest location based on zip
  findLocation(zip: string): Observable<any> {
    const params = new HttpParams().set('zip', zip);
    return this.http.get('http://localhost:3000/api/findLocation', { params });
  }

  //register User in Customer Table
  registerUser(Fname: string, MInit: string, Lname: string, Email: string, MobileNumber: string, HouseNumber: string, Street: string, City: string, State: string, ZipCode: string): Observable<any> {
    const params = new HttpParams().set('Fname', Fname).set('MInit', MInit).set('Lname', Lname).set('Email', Email).set('MobileNumber', MobileNumber).set('HouseNumber', HouseNumber).set('Street', Street).set('City', City).set('State', State).set('ZipCode', ZipCode);
    return this.http.get('http://localhost:3000/api/registerUser', { params });
  }


  //user to Login table
  registerUserLogin(Email: string, Password: string): Observable<any> {
    const params = new HttpParams().set('Email', Email).set('Password', Password);
    return this.http.get('http://localhost:3000/api/registerUserLogin', { params });
  }

  //customer info from id
  customerFromID(id: string): Observable<any> {
    const params = new HttpParams().set('id', id);
    return this.http.get('http://localhost:3000/api/customerFromID', { params });
  }

  //update user
  updateUser(Fname: string, MInit: string, Lname: string, Email: string, MobileNumber: string, HouseNumber: string, Street: string, City: string, State: string, ZipCode: string, id: string): Observable<any> {
    const params = new HttpParams().set('id', id).set('Fname', Fname).set('MInit', MInit).set('Lname', Lname).set('Email', Email).set('MobileNumber', MobileNumber).set('HouseNumber', HouseNumber).set('Street', Street).set('City', City).set('State', State).set('ZipCode', ZipCode);
    return this.http.get('http://localhost:3000/api/updateUser', { params });
  }

  //create transaction with cash a payment
  packageTransactionCash(Email: string, Date: string, Total: string, PaymentType: string, EmployeeID: string) {
    const params = new HttpParams().set('Email', Email).set('Date', Date).set('Total', Total).set('PaymentType', PaymentType).set('EmployeeID', EmployeeID);
    return this.http.get('http://localhost:3000/api/packageTransactionCash', { params });
  }
  //create transaction with creditcard a payment
  packageTransactionCC(Email: string, Date: string, Total: string, FirstFourCC: string, FnameCC: string, LnameCC: string, MinitCC: string, PaymentType: string, EmployeeID: string) {
    const params = new HttpParams().set('Email', Email).set('Date', Date).set('Total', Total).set('FirstFourCC', FirstFourCC).set('FnameCC', FnameCC).set('LnameCC', LnameCC).set('MinitCC', MinitCC).set('PaymentType', PaymentType).set('EmployeeID', EmployeeID);
    return this.http.get('http://localhost:3000/api/packageTransactionCC', { params });
  }
  //createpackage
  createPackage(transactionID: string, CustomerEmail: string, SendToHouseNumber: string, SendToStreet: string, SendToZipCode: string, SendToCity: string, SendToState: string, SendToCountry: string, PackageWeight: string, PackageSize: string, SentDate: string, ETA: string, PackageStateID:string) {
    const params = new HttpParams().set('transactionID', transactionID).set('CustomerEmail', CustomerEmail).set('SendToHouseNumber', SendToHouseNumber).set('SendToStreet', SendToStreet).set('SendToZipCode', SendToZipCode).set('SendToCity', SendToCity).set('SendToState', SendToState).set('SendToCountry', SendToCountry).set('PackageWeight', PackageWeight).set('PackageSize', PackageSize).set('SentDate', SentDate).set('ETA', ETA).set('PackageStateID', PackageStateID);
    return this.http.get('http://localhost:3000/api/createPackage', { params });
  }

  //updatetracking to location ID
  updateTrackingToLocation(PackageID: string, TruckID: string, HandlerID: string, GoingToLocationID:string, Date:string) {
    const params = new HttpParams().set('PackageID', PackageID).set('TruckID', TruckID).set('HandlerID', HandlerID).set('GoingToLocationID', GoingToLocationID).set('Date', Date);
    return this.http.get('http://localhost:3000/api/updateTrackingToLocation', { params });
  }

  /*//updatetracking to house address
  updateTrackingToAddress(PackageID: string, TruckID: string, HandlerID: string, GoingToHouseNumber: string, GoingToStreet: string, GoingToCity: string, GoingToState: string, GoingToZipCode: string, Date: string) {
    const params = new HttpParams().set('PackageID', PackageID).set('TruckID', TruckID).set('HandlerID', HandlerID).set('GoingToHouseNumber', GoingToHouseNumber).set('GoingToStreet', GoingToStreet).set('GoingToCity', GoingToCity).set('GoingToState', GoingToState).set('GoingToZipCode', GoingToZipCode).set('Date', Date);
    return this.http.get('http://localhost:3000/api/updateTrackingToAddress', { params });
  }*/

  updateTrackingToAddress(PackageID: string, TruckID: string, HandlerID: string, Date: string) {
    const params = new HttpParams().set('PackageID', PackageID).set('TruckID', TruckID).set('HandlerID', HandlerID).set('Date', Date);
    return this.http.get('http://localhost:3000/api/updateTrackingToAddress', { params });
  }

  //location
  getLocations(): Observable<any> {
    return this.http.get('http://localhost:3000/api/getLocations');
  }

  //get trucks
  getTrucks(): Observable<any> {
    return this.http.get('http://localhost:3000/api/getTrucks');
  }

  //getEmployee ID
  getEmployee(id: string): Observable<any> {
    const params = new HttpParams().set('id', id);
    return this.http.get('http://localhost:3000/api/getEmployee', {params});
  }

  //update emplooyee person info
  updateEmployeePersonal(Fname: string, MInit: string, Lname: string, Email: string, MobileNumber: string, HouseNumber: string, Street: string, City: string, State: string, ZipCode: string, id: string): Observable<any> {
    const params = new HttpParams().set('id', id).set('Fname', Fname).set('MInit', MInit).set('Lname', Lname).set('Email', Email).set('MobileNumber', MobileNumber).set('HouseNumber', HouseNumber).set('Street', Street).set('City', City).set('State', State).set('ZipCode', ZipCode);
    return this.http.get('http://localhost:3000/api/updateEmployeePersonal', { params });
  }

  //customer info from Email
  customerFromEmail(Email: string): Observable<any> {
    const params = new HttpParams().set('Email', Email);
    return this.http.get('http://localhost:3000/api/customerFromEmail', { params });
  }

  updateTrackingNewPackage(PackageID: string, HandlerID: string, Date: string) {
    const params = new HttpParams().set('PackageID', PackageID).set('HandlerID', HandlerID).set('Date', Date);
    return this.http.get('http://localhost:3000/api/updateTrackingNewPackage', { params });
  }

  //customer info from Email
  employeeFromId(id: string): Observable<any> {
    const params = new HttpParams().set('id', id);
    return this.http.get('http://localhost:3000/api/employeeFromId', { params });
  }

  //employees from managers id
  employeesFromManager(id: string): Observable<any> {
    const params = new HttpParams().set('id', id);
    return this.http.get('http://localhost:3000/api/employeesFromManager', { params });
  }

  //shopproducts
  shopProducts(): Observable<any> {
    return this.http.get('http://localhost:3000/api/shopProducts');
  }

  locationPackagesDuringTime(startDate: string, endDate: string, locationID: string): Observable<any> {
    const params = new HttpParams().set('startDate', startDate).set('endDate', endDate).set('locationID', locationID);
  return this.http.get('http://localhost:3000/api/locationPackagesDuringTime', { params });
  }

  locationOfEmployee(EmployeeID: string): Observable<any> {
    console.log(EmployeeID);
    const params = new HttpParams().set('id', EmployeeID);
    return this.http.get('http://localhost:3000/api/locationOfEmployee', { params });
  }


  employeeClerksFromManager(id: string): Observable<any> {
    const params = new HttpParams().set('id', id);
    return this.http.get('http://localhost:3000/api/employeeClerksFromManager', { params });
  }


  employeeClerksPackages(startDate: string, endDate: string, employeeID: string): Observable<any> {
    const params = new HttpParams().set('startDate', startDate).set('endDate', endDate).set('id', employeeID);
    return this.http.get('http://localhost:3000/api/employeeClerksPackages', { params });
  }

  createEmployee(LocationID: string, RoleID: string, AuthID: string, Fname: string, MInit: string, Lname: string, MobilePhone: string, Wage: string, HiredOn: string, WorkEmail: string, PersonalEmail: string, HouseNumber: string, Street: string, ZipCode: string, City: string, State: string, CurrentlyEmployed: string, WorkPhone: string): Observable<any> {
    const params = new HttpParams().set('LocationID', LocationID).set('RoleID', RoleID).set('AuthID', AuthID).set('Fname', Fname).set('MInit', MInit).set('Lname', Lname).set('MobilePhone', MobilePhone).set('Wage', Wage).set('HiredOn', HiredOn).set('WorkEmail', WorkEmail).set('PersonalEmail', PersonalEmail).set('HouseNumber', HouseNumber).set('Street', Street).set('ZipCode', ZipCode).set('City', City).set('State', State).set('CurrentlyEmployed', CurrentlyEmployed).set('WorkPhone', WorkPhone);
    return this.http.get('http://localhost:3000/api/createEmployee', { params });
  }

}




