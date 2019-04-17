import { Component, OnInit, ViewChild } from '@angular/core';
import { formatDate } from '@angular/common';
import { FormControl, FormBuilder, FormGroup, Validators } from '@angular/forms';

import { MatDatepickerInputEvent } from '@angular/material/datepicker';
import { MatDatepicker } from '@angular/material/datepicker';
import { DateAdapter, MAT_DATE_FORMATS, MAT_DATE_LOCALE } from '@angular/material/core';
import { MomentDateAdapter } from '@angular/material-moment-adapter';

import { APIService } from '../_services/api.service';

import * as _moment from 'moment';
import { default as _rollupMoment, Moment } from 'moment';
const moment = _rollupMoment || _moment;


export const MY_FORMATS = {
  parse: {
    dateInput: 'MM/YYYY',
  },
  display: {
    dateInput: 'MM/YYYY',
    monthYearLabel: 'MMM YYYY',
    dateA11yLabel: 'LL',
    monthYearA11yLabel: 'MMMM YYYY',
  },
};

@Component({
  selector: 'app-package-graph',
  templateUrl: './package-graph.component.html',
  styleUrls: ['./package-graph.component.css'],
  providers: [
    { provide: DateAdapter, useClass: MomentDateAdapter, deps: [MAT_DATE_LOCALE] },
    { provide: MAT_DATE_FORMATS, useValue: MY_FORMATS },
  ],
})
export class PackageGraphComponent implements OnInit {

  lableStartDate = new FormControl(moment().subtract(3, 'months').startOf('month'));
  startdate = moment().subtract(3, 'months').startOf('month');
  lableEndDate = new FormControl(moment().endOf('month'));
  enddate = moment().endOf('month');

  showGraph = false;

  location = "";

  constructor(public api: APIService) { }


  maxStartDate = formatDate(new Date(), 'yyyy-MM-dd 00:00:00', 'en');
  maxEndDate = formatDate(new Date(), 'yyyy-MM-dd 23:59:59', 'en');

  FinalStart;
  startDate = {
    year: this.startdate.year(),
    month: this.startdate.month(),
    day: 0
  };

  FinalEnd;
  endDate = {
    year: this.enddate.year(),
    month: this.enddate.month(),
    day: 31
  };

  Diffrence = 3;

  //set start time
  chosenYearHandlerStart(normalizedYear: Moment) {
    const ctrlValue = this.lableStartDate.value;
    ctrlValue.year(normalizedYear.year());
    this.lableStartDate.setValue(ctrlValue);
    console.log(this.lableStartDate);

    this.startDate.year = (normalizedYear.year());
  }

  chosenMonthHandlerStart(normalizedMonth: Moment, datepicker: MatDatepicker<Moment>) {
    normalizedMonth = normalizedMonth.startOf('month');
    const ctrlValue = this.lableStartDate.value;
    ctrlValue.month(normalizedMonth.month());
    this.lableStartDate.setValue(ctrlValue);

    this.startDate.month = (normalizedMonth.month());
    datepicker.close();
    this.barChartData[0].data = [];
    this.barChartLabels = [];
    this.query();
  }

  //set end time
  chosenYearHandlerEnd(normalizedYear: Moment) {
    const ctrlValue = this.lableEndDate.value;
    ctrlValue.year(normalizedYear.year());
    this.lableEndDate.setValue(ctrlValue);

    this.endDate.year = (normalizedYear.year());
  }

  chosenMonthHandlerEnd(normalizedMonth: Moment, datepicker: MatDatepicker<Moment>) {
    normalizedMonth = normalizedMonth.endOf('month');
    const ctrlValue = this.lableEndDate.value;
    ctrlValue.month(normalizedMonth.month());
    this.lableEndDate.setValue(ctrlValue);

    this.endDate.month = (normalizedMonth.month() + 1);
    datepicker.close();
    this.barChartData[0].data = [];
    this.barChartLabels = [];
    this.query();
  }



  //--------------------------------------------------------------------------------

  public barChartOptions = { scaleShowVerticalLines: false, responsive: true, pointRadius: 30 };
  public barChartLabels = [];
  public barChartType = 'bar';
  public barChartLegend = true;
  public barChartData = [
    {
      data: [],
      label: 'Packages that originated here',
      backgroundColor: 'rgb(0, 102, 255, .15)',
      borderColor: 'rgb(0, 102, 255)',
      pointBackgroundColor: 'rgb(0, 51, 128)',
      pointBorderColor: 'rgb(0, 102, 255)',
      pointHoverBackgroundColor: 'rgb(153, 194, 255)',
      pointHoverBorderColor: 'rgb(0, 102, 255)'
    },
    {
      data: [],
      label: 'Packages that passed threw',
      backgroundColor: 'rgb(255, 77, 196, .15)',
      borderColor: 'rgb(128, 0, 85)',
      pointBackgroundColor: 'rgb(179, 0, 119)',
      pointBorderColor: 'rgb(128, 0, 85)',
      pointHoverBackgroundColor: 'rgb(255, 128, 213)',
      pointHoverBorderColor: 'rgb(128, 0, 85)'
    },
    {
      data: [],
      label: 'Packages that we delivered',
      backgroundColor: 'rgb(0, 230, 77, .15)',
      borderColor: 'rgb(0, 128, 43)',
      pointBackgroundColor: 'rgb(0, 77, 26)',
      pointBorderColor: 'rgb(0, 128, 43)',
      pointHoverBackgroundColor: 'rgb(128, 255, 170)',
      pointHoverBorderColor: 'rgb(0, 128, 43)'

    }
  ];





  ngOnInit() {
    this.query();
  }


  //-------------------------------------------------------------------------------------------
  query() {

    this.FinalStart = new Date(this.startDate.year, this.startDate.month, 1);
    this.FinalEnd = new Date(this.endDate.year, this.endDate.month, this.endDate.day);

    this.Diffrence = (this.FinalEnd.getMonth() - this.FinalStart.getMonth() + (12 * (this.FinalEnd.getYear() - this.FinalStart.getYear())));


    this.api.locationOfEmployee(sessionStorage.getItem("ID"))
      .subscribe((data) => {
        this.location = data[0].LocationID;
        let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'July', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'];
        let count = this.Diffrence;

        for (var x = 0; x < this.Diffrence; x++) {

          this.barChartLabels[x] = months[(this.startDate.month + x) % 12];

          this.FinalStart.setMonth(this.FinalStart.getMonth() + (this.Diffrence - count));
          let date1 = this.FinalStart.toJSON().substring(0, 10);
          this.FinalStart.setMonth(this.FinalStart.getMonth() + (this.Diffrence - count + 1));
          let date2 = this.FinalStart.toJSON().substring(0, 10);


          this.api.locationPackagesDuringTime(date1, date2, data[0].LocationID)
            .subscribe((res) => {
              this.barChartData[0].data[this.Diffrence - count] = res[0]['originated'];
              this.barChartData[1].data[this.Diffrence - count] = (res[0]['passing']);
              this.barChartData[2].data[this.Diffrence - count] = (res[0]['delivered']);
              count--;
              if (count == 0) {
                this.showGraph = false;
                this.showGraph = true;
              }

            });;
        }
      });;
  }
}
