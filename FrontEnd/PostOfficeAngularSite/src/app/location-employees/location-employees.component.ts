import { Component, OnInit } from '@angular/core';
import { APIService } from '../_services/api.service';
import { FormControl } from '@angular/forms';
import { MatSnackBar } from '@angular/material';

@Component({
  selector: 'app-location-employees',
  templateUrl: './location-employees.component.html',
  styleUrls: ['./location-employees.component.css']
})

export class LocationEmployeesComponent implements OnInit {

  acquiredData = false;
  displayedColumns: string[] = ['EmployeID', 'Name', 'Role', 'WorkEmail', 'PersonalEmail', 'WorkPhone', 'PersonalPhone'];
  MyEmployees: any = [];
  RolesID = ["", "Clerk", "Sorter", "Manager", "HR", "Driver"];
  location;

  constructor(public api: APIService,
    private snackBar: MatSnackBar) { }

  ngOnInit() {
    //api call;
    this.api.employeesFromManager(sessionStorage.getItem("ID"))
      .subscribe((res) => {
        this.update(res);
        this.location = res[0].LocationID;
      });;
  }

  update(res) {
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
    this.acquiredData = true;
  }

}


