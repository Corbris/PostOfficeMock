import { Component, OnInit, ViewChild} from '@angular/core';
import { APIService } from '../_services/api.service';
import { MatSnackBar } from '@angular/material';
import { MatPaginator, MatTableDataSource, MatSort } from '@angular/material';
import { FormControl, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { formatDate } from '@angular/common';

@Component({
  selector: 'app-location-employees',
  templateUrl: './location-employees.component.html',
  styleUrls: ['./location-employees.component.css']
})

export class LocationEmployeesComponent implements OnInit {

  acquiredData = false;
  displayedColumns: string[] = ['EmployeID', 'Name', 'Role', 'WorkEmail', 'PersonalEmail', 'WorkPhone', 'PersonalPhone'];
  RolesID = ["", "Clerk", "Sorter", "Manager", "HR", "Driver"];
  location = "";

  MyEmployees: employee[] = [];
  dataSource = new MatTableDataSource<employee>(this.MyEmployees);
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  EmployeeWorkDataForm: FormGroup;
  newEployeeShow = false;


  constructor(public api: APIService, private snackBar: MatSnackBar, public formBuilder: FormBuilder) {


    this.query();


      this.EmployeeWorkDataForm = this.formBuilder.group({
        Fname: ['', Validators.compose([Validators.required])],
        MInit: ['', Validators.compose([Validators.required])],
        Lname: ['', Validators.compose([Validators.required])],

        PersonalEmail: ['', Validators.compose([Validators.required, Validators.email])],
        PersonalPhone: ['', Validators.compose([Validators.minLength(10)])],

        HouseNumber: ['', Validators.compose([Validators.required])],
        Street: ['', Validators.compose([Validators.required])],
        City: ['', Validators.compose([Validators.required])],
        State: ['', Validators.compose([Validators.required, Validators.maxLength(2)])],
        ZipCode: ['', Validators.compose([Validators.required])],

        LocationID: [this.location, Validators.compose([Validators.required])],
        CurrentlyEmployed: ['', Validators.compose([Validators.required])],
        AuthLevel: ['', Validators.compose([Validators.required])],

        WorkEmail: ['', Validators.compose([Validators.required, Validators.email])],
        WorkPhone: ['', Validators.compose([Validators.minLength(10)])],

        RoleID: ['', Validators.compose([Validators.required])],
        Wage: ['', Validators.compose([Validators.required])]
      });
  }

  query() {
    this.api.employeesFromManager(sessionStorage.getItem("ID"))
      .subscribe((res) => {
        this.location = res[0].LocationID;
        for (var x in res) {
          this.MyEmployees.push(
            {
              EmployeID: res[x].EmployeeID,
              Fname: res[x].Fname,
              MInit: res[x].MInit,
              Lname: res[x].Lname,
              Role: this.RolesID[res[x].RoleID],
              WorkEmail: res[x].WorkEmail,
              PersonalEmail: res[x].PersonalEmail,
              WorkPhone: res[x].WorkPhone,
              PersonalPhone: res[x].MobilePhone,
            });
        }
        this.dataSource.paginator = this.paginator;
        this.acquiredData = false;
        this.acquiredData = true;
      });;
  }



  ngAfterViewInit() {

  }

  ngOnInit() {
  }
  applyFilter(filterValue: string) {
    filterValue = filterValue.trim(); // Remove whitespace
    filterValue = filterValue.toLowerCase(); // Datasource defaults to lowercase matches
    this.dataSource.filter = filterValue;
  }

  newEmployee() {
    this.newEployeeShow = !this.newEployeeShow;
  }

  saveNewEmployee() {
    console.log(this.EmployeeWorkDataForm);
    let date = formatDate(new Date(), 'yyyy-MM-dd', 'en');
    console.log(date);

    if (this.EmployeeWorkDataForm.valid) {

      this.api.createEmployee(this.location, this.EmployeeWorkDataForm.value.RoleID, this.EmployeeWorkDataForm.value.AuthLevel, this.EmployeeWorkDataForm.value.Fname, this.EmployeeWorkDataForm.value.MInit, this.EmployeeWorkDataForm.value.Lname, this.EmployeeWorkDataForm.value.PersonalPhone, this.EmployeeWorkDataForm.value.Wage, date, this.EmployeeWorkDataForm.value.WorkEmail, this.EmployeeWorkDataForm.value.PersonalEmail, this.EmployeeWorkDataForm.value.HouseNumber, this.EmployeeWorkDataForm.value.Street, this.EmployeeWorkDataForm.value.ZipCode, this.EmployeeWorkDataForm.value.City, this.EmployeeWorkDataForm.value.State, this.EmployeeWorkDataForm.value.CurrentlyEmployed, this.EmployeeWorkDataForm.value.WorkPhone)
        .subscribe((err) => {
          console.log(err);
          console.log(this.EmployeeWorkDataForm);
          if (err == null) {
            this.snackBar.open("Created New Employee", "Close", {
              duration: 3500,
            });
            this.newEployeeShow = false;
            this.query();

          }
          else {
            this.snackBar.open(err.sqlMessage, "close", {
              duration: 3500,
            });
          }

        });;
    }
    else {
      this.snackBar.open("forms are not valid", "close", {
        duration: 3500,
      });
    }

  }

}


export interface employee {
  EmployeID: string;
  Fname: string;
  MInit: string;
  Lname: string;
  Role: string;
  WorkEmail: string;
  PersonalEmail: string;
  WorkPhone: string;
  PersonalPhone: string;
}


