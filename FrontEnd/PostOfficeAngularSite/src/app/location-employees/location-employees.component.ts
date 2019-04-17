import { Component, OnInit, ViewChild} from '@angular/core';
import { APIService } from '../_services/api.service';
import { FormControl } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { MatPaginator, MatTableDataSource, MatSort } from '@angular/material';

@Component({
  selector: 'app-location-employees',
  templateUrl: './location-employees.component.html',
  styleUrls: ['./location-employees.component.css']
})

export class LocationEmployeesComponent implements OnInit {

  acquiredData = false;
  displayedColumns: string[] = ['EmployeID', 'Name', 'Role', 'WorkEmail', 'PersonalEmail', 'WorkPhone', 'PersonalPhone'];
  RolesID = ["", "Clerk", "Sorter", "Manager", "HR", "Driver"];
  location;

  MyEmployees: employee[] = [];
  dataSource = new MatTableDataSource<employee>(this.MyEmployees);
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  

  constructor(public api: APIService, private snackBar: MatSnackBar)
  {
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


