import { Component, OnInit } from '@angular/core';
import { APIService } from '../_services/api.service';

@Component({
  selector: 'app-transactions',
  templateUrl: './transactions.component.html',
  styleUrls: ['./transactions.component.css']
})
export class TransactionsComponent implements OnInit {
  PackageTrans;
  OnlineTrans;
  paymentType = ["", "Cash", "Visa", "MasterCard", "Discover Card", "Capital One", "AmericanExpress"];


  displayedPackageColumns = ['TransactionID', 'SaleDate', 'Cost', 'PaymentType', 'EmployeeID'];
  displayedPackageColumnsOnline = ['TransactionID', 'SaleDate','Cost', 'PaymentType', 'EmployeeID'];
  constructor(public api: APIService) { }



  ngOnInit() {
    var data = this.api.myPacakgeTrans(sessionStorage.getItem("ID"))
      .subscribe((data: {}) => {
        
        if (data != undefined) {
          this.PackageTrans = data;
          for (var x in this.PackageTrans) {
            this.PackageTrans[x].PaymentTypeID = this.paymentType[this.PackageTrans[x].PaymentTypeID];
            
          }
        }

      });;

      var data = this.api.myOnlineTrans(sessionStorage.getItem("ID"))
        .subscribe((data: {}) => {
          
          if (data != undefined) {
            this.OnlineTrans = data;
            for (var x in this.OnlineTrans) {
              this.OnlineTrans[x].PaymentTypeID = this.paymentType[this.OnlineTrans[x].PaymentTypeID];

            }
          }
        });;
  }

}
