import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'app-update-tracking',
  templateUrl: './update-tracking.component.html',
  styleUrls: ['./update-tracking.component.css']
})
export class UpdateTrackingComponent implements OnInit {
  PackageID     = new FormControl('');
  TruckNum      = new FormControl('');
  HouseNumber   = new FormControl('');
  StreetAddress = new FormControl('');
  State         = new FormControl('');
  ZipCode       = new FormControl('');

  constructor() { }

  ngOnInit() {
  }

}
