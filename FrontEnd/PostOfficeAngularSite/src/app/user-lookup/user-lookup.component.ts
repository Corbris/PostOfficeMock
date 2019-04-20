import { Component, OnInit } from '@angular/core';
import { APIService } from '../_services/api.service';
import { FormControl } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { formatDate } from '@angular/common';

export interface AccountElement {
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
  NameData: AccountElement[];
  ContactData: AccountElement[];
  LocationData: AccountElement[];

  MyPackages: any = [];
  ExpectedPackages: any = [];

  displayedAccountColumns = ['key', 'value'];
  displayedPackageColumns = ['packageID', 'sending To', 'ETA', 'status'];

  constructor(public api: APIService,
    private snackBar: MatSnackBar) { }

  ngOnInit() {

  }

  lookupUser() {
    this.api.customerFromEmail(this.Email.value)
      .subscribe((res) => {
        if (res != null) {
          this.NameData = [
            { key: "First Name", value: res[0].Fname },
            { key: "Middle Initial", value: res[0].MInit },
            { key: "Last Name", value: res[0].Lname },
          ];

          this.ContactData = [
            { key: "Email", value: res[0].Email },
            { key: "Mobile Phone", value: res[0].MobileNumber.substring(0, 3) + '-' + res[0].MobileNumber.substring(3, 6) + '-' + res[0].MobileNumber.substring(6, 10)}
          ];

          this.LocationData =[
            { key: "House Number", value: res[0].HouseNumber},
            { key: "Street", value: res[0].Street },
            { key: "City", value: res[0].City },
            { key: "State", value: res[0].State },
            { key: "Zip Code", value: res[0].City },
          ];
          this.getMyPackages(res[0].CustomerID);
        }
        else {
          this.snackBar.open("Could not find a customer with that email.", "Close", {
            duration: 2000,
          });
        }

      });

    //call api

  }

  getMyPackages(id) {
    this.api.myPackages(id)
      .subscribe((res) => {
        for (var x in res) {
          this.MyPackages.push(
            { PackageID: res[x].PackageID, SendToHouseNumber: res[x].SendToHouseNumber, SendToStreet: res[x].SendToStreet, SendToCity: res[x].SendToCity, SendToState: res[x].SendToState, ETA: res[x].ETA.substring(0,10), State: res[x].State }
          );
        }
        this.getPackagesComingToMe(id);
    });

  }


  getPackagesComingToMe(id) {
    this.api.packagesToAddress(id)
      .subscribe((res) => {
        for (var x in res) {
          this.ExpectedPackages.push(
            { PackageID: res[x].PackageID, SendToHouseNumber: res[x].SendToHouseNumber, SendToStreet: res[x].SendToStreet, SendToCity: res[x].SendToCity, SendToState: res[x].SendToState, ETA: res[x].ETA.substring(0, 10), State: res[x].State }
          );
        }
        this.acquiredData = true;
      });
  }

}
