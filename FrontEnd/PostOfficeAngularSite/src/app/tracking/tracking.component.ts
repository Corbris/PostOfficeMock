import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { APIService } from '../_services/api.service';
import { MatSnackBar } from '@angular/material';

@Component({
  selector: 'app-tracking',
  templateUrl: './tracking.component.html',
  styleUrls: ['./tracking.component.css']
})

export class TrackingComponent implements OnInit {
  IDForm = new FormControl('');
  hideTracking = true;
  panelOpenState = false;
  Response;

  constructor(public api: APIService, private snackBar: MatSnackBar) {}

  trackPackage() //validate the package id
  {
    this.api.packageTracking(this.IDForm.value)
      .subscribe((data: {}) => {
        //no package
        if (data[0] == undefined) {
          this.hideTracking = true;
          this.snackBar.open("No Package Was found with that ID", "Close", {
            duration: 8000,
          });
        }
        //found the package
        else if (data[0] != undefined) {
          this.Response = data;
          this.hideTracking = false;
        }
  });;
      
  }

  ngOnInit() {
  }

}
