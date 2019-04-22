import { Component, OnInit } from '@angular/core';
import { MatDatepickerInputEvent } from '@angular/material/datepicker';
import { formatDate } from '@angular/common';
import { FormBuilder, FormGroup, Validators, FormControl } from '@angular/forms';
import { APIService } from '../_services/api.service';

@Component({
  selector: 'app-employeeSales-graph',
  templateUrl: './employeeSales-graph.component.html',
  styleUrls: ['./employeeSales-graph.component.css']
})
export class EmployeeSalesGraphComponent implements OnInit {
  showGraph = false;

  public pieChartLabels = [0];
  public pieChartData = [0];
  public pieChartType = 'pie';

  locationID = "";

  //curernt time on load.
  dateFormControl = new FormControl(new Date());
  selectedDateStart;
  selectedDateEnd;

  constructor(public api: APIService) { }

  ngOnInit() {
    this.selectedDateStart = formatDate(this.dateFormControl.value, 'yyyy-MM-dd 00:00:00', 'en');
    this.selectedDateEnd = formatDate(this.dateFormControl.value, 'yyyy-MM-dd 23:59:59', 'en');
    console.log(this.selectedDateStart);
    console.log(this.selectedDateEnd);
    this.querry();
  }

  addEvent(event: MatDatepickerInputEvent<Date>) {
    this.selectedDateStart = formatDate(`${event.value.toJSON()}`, 'yyyy-MM-dd 00:00:00', 'en');
    this.selectedDateEnd = formatDate(`${event.value.toJSON()}`, 'yyyy-MM-dd 23:59:59', 'en');
    console.log(this.selectedDateStart);
    console.log(this.selectedDateEnd);
    this.querry();
  }

  querry() {


  this.pieChartLabels = [];
  this.pieChartData = [];
    this.api.locationOfEmployee(sessionStorage.getItem("ID"))
      .subscribe((location) => {
        console.log("got location ID");
        this.locationID = location[0].LocationID;
        if (location != null) {
          this.api.employeeClerksFromManager(sessionStorage.getItem("ID"))
            .subscribe((employees) => {
              console.log("got employees");
              console.log(employees);
              if (employees != null) { 
                for (var x in employees) {
                  this.pieChartLabels[x]=(employees[x].EmployeeID);
                  this.api.employeeClerksPackages(''+this.selectedDateStart, ''+this.selectedDateEnd, ''+employees[x].EmployeeID)
                    .subscribe((numbers) => {
                      if (numbers != null) {
                        console.log("got numbers");
                        console.log(numbers);
                        this.pieChartData.push((numbers[0]['COUNT(*)'])+1);
                        console.log(this.pieChartData);
                        this.showGraph = false;
                        this.showGraph = true;
                      }
                    });;

                }
              }
            });;
        }
      });;

  }


}
