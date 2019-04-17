import { Component, OnInit, ViewChild } from '@angular/core';
import { formatDate } from '@angular/common';
import { FormControl, FormBuilder, FormGroup, Validators } from '@angular/forms';

import { APIService } from '../_services/api.service';

@Component({
  selector: 'app-location-dashboard',
  templateUrl: './location-dashboard.component.html',
  styleUrls: ['./location-dashboard.component.css'],
})
export class LocationDashboardComponent implements OnInit {

  location = "";

  constructor(public api: APIService) { }

  ngOnInit() {
    this.query();
  }

  query() {

    this.api.locationOfEmployee(sessionStorage.getItem("ID"))
      .subscribe((data) => {
        this.location = data[0].LocationID;
      });;
  }
}
