import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { APIService } from '../_services/api.service';
import { formatDate } from '@angular/common';
import { MatSnackBar } from '@angular/material';

@Component({
  selector: 'app-update-tracking',
  templateUrl: './update-tracking.component.html',
  styleUrls: ['./update-tracking.component.css']
})
export class UpdateTrackingComponent implements OnInit {
  PackageID     = new FormControl('');
  TruckNum: string = "";
  HouseNumber   = new FormControl('');
  StreetAddress = new FormControl('');
  City          = new FormControl('');
  State         = new FormControl('');
  ZipCode       = new FormControl('');
  LocationID: string = "";
  LocationKinds: string[] = ['Location ID', 'Address'];
  ChosenLocationKind: string = 'Location ID';

  trucks = [];
  locations = [];
  constructor(public api: APIService, private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.api.getTrucks()
      .subscribe((res) => {
        this.trucks = res;
      });;

      this.api.getLocations()
        .subscribe((res) => {
          this.locations = res;
        });;


  }

  scanPackage() {
    //ChosenLocationKind = location ID
    //PackageID, TruckNum, LocationID

    let EmployeeID = sessionStorage.getItem("ID");
    let timeDate = formatDate(new Date(), 'yyyy-MM-dd HH:MM:SS', 'en');

    if (this.ChosenLocationKind == 'Location ID') {
      this.api.updateTrackingToLocation(this.PackageID.value, this.TruckNum['TruckID'], EmployeeID, this.LocationID['LocationID'], timeDate)
        .subscribe((res) => {
          console.log(res);
          //no errors
          if (res == null) {
            this.snackBar.open("Successfully Scaned Package", "Close", {
              duration: 2000,
            });
          }
          else {
            if (res['sqlMessage'].indexOf("FOREIGN KEY (`PackageID`)") >= 0){
              this.snackBar.open("Package number does not exist", "Close", {
                duration: 2000,
              });
            }

            if (res['sqlMessage'].indexOf("FOREIGN KEY (`TruckID`)") >= 0) {
              this.snackBar.open("Select a TruckID", "Close", {
                duration: 2000,
              });
            }

            if (res['sqlMessage'].indexOf("FOREIGN KEY (`GoingToLocationID`)") >= 0) {
              this.snackBar.open("Select a going to LocationID", "Close", {
                duration: 2000,
              });
            }
            
          }
        });;
    }

    else if (this.ChosenLocationKind == 'Address') {
      this.api.updateTrackingToAddress(this.PackageID.value, this.TruckNum['TruckID'], EmployeeID, this.HouseNumber.value, this.StreetAddress.value, this.City.value, this.State.value, this.ZipCode.value, timeDate)
        .subscribe((res) => {
          //no errors
          if (res == null) {
            //no errors
            if (res == null) {
              this.snackBar.open("Successfully Scaned Package", "Close", {
                duration: 2000,
              });
            }
            else {
              if (res['sqlMessage'].indexOf("FOREIGN KEY (`PackageID`)") >= 0) {
                this.snackBar.open("Package number does not exist", "Close", {
                  duration: 2000,
                });
              }

              if (res['sqlMessage'].indexOf("FOREIGN KEY (`TruckID`)") >= 0) {
                this.snackBar.open("Select a TruckID", "Close", {
                  duration: 2000,
                });
              }
            }
          }
        });;

    }


    //ChosenLocationKind = Address
    //PackageID, TruckNum, HouseNumber, StreetAddress, State, ZipCode
  }
}
