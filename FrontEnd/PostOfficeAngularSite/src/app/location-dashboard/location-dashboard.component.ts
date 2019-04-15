import { Component, OnInit, ViewChild } from '@angular/core';
import { Chart } from 'chart.js'
// import { Chart } from 'chart.js';

@Component({
  selector: 'app-location-dashboard',
  templateUrl: './location-dashboard.component.html',
  styleUrls: ['./location-dashboard.component.css']
})
export class LocationDashboardComponent implements OnInit {
  // public pieChartLabels = ['Sales Q1', 'Sales Q2', 'Sales Q3', 'Sales Q4'];
  // public pieChartData = [120, 150, 180, 90];
  // public pieChartType = 'pie';
  chart: any;

  constructor() {
  }

  ngOnInit() {
    let chartData = [
      {
        x: '1',
        y: '45'
      },
      {
        x: '2',
        y: '94'
      },
      {
        x: '3',
        y: '100'
      },
      {
        x: '4',
        y: '12'
      },
    ];
    let labels = ['January', 'February', 'March', 'April'];
    this.chart = new Chart('canvas', {
      type: 'line',
      data: {
        labels: labels,
        datasets: [
          {
            data: chartData,
            borderColor: '#3cba9f',
            fill: false
          },
        ]
      },
      options: {
        legend: {
          display: false
        },
        scales: {
          xAxes: [{
            display: true
          }],
          yAxes: [{
            display: true
          }]
        }
      }
    })
  }
}
