import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
// import { MdRadioChange } from '@angular/material';

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
  LocationID    = new FormControl('');
  LocationKinds: string[] = ['Location ID', 'Address'];
  ChosenLocationKind :string = 'Location ID';

  constructor() { }

  ngOnInit() {
  }

  // radioChange(event: MdRadioChange) {
  //   this.filter['property'] = event.value;
  //   console.log(this.filter);
  // }
}
