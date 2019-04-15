import { Component, OnInit } from '@angular/core';
import { APIService } from '../_services/api.service';
import { FormControl } from '@angular/forms';
import { MatSnackBar } from '@angular/material';

export interface TableElement {
  key :string;
  value :string;
}

@Component({
  selector: 'app-user-lookup',
  templateUrl: './user-lookup.component.html',
  styleUrls: ['./user-lookup.component.css']
})

export class UserLookupComponent implements OnInit {
  Email = new FormControl('');
  acquiredData = false;
  NameData: TableElement[] = [
    {key: "First Name",     value: "John"},
    {key: "Middle Initial", value: "X"},
    {key: "Last Name",      value: "Doe"},
  ];
  ContactData: TableElement[] = [
    {key: "Email",     value: "john@example.com"},
    {key: "Mobile Phone", value: "999-999-9999"},
    {key: "House Phone", value: "999-999-9999"},
  ];
  LocationData: TableElement[] = [
    {key: "House Number",     value: "1111"},
    {key: "Street", value: "Somewhere Ave."},
    {key: "City", value: "Beverly Hills"},
    {key: "State", value: "CA"},
    {key: "Zip Code", value: "90210"},
  ];

  displayedColumns = ['key', 'value'];
  // CustomerData;

  // user: CustomerData = {
  //   Fname: "John",
  //   MInit: "X",
  //   Lname: "Doe",
  // };

  constructor(public api: APIService,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
  }

  lookupUser()
  {
    if (!this.acquiredData) {
      this.snackBar.open("Could not find a customer with that email.", "Close", {
        duration: 2000,
      });
    }
  }
}
