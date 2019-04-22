import { Component, OnInit, Inject } from '@angular/core';
import { APIService } from '../_services/api.service';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';

export interface DialogData {
  PackageID: string;
  SentDate: string;
}

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
  constructor(public api: APIService, public dialog: MatDialog) { }

  openDialog(event){
    console.log(event);
    const dialogRef = this.dialog.open(TransactionDialog, {
      width: '400px',
      data: { PackageID: event, SentDate: "2019-04-22" }
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
    });
  }

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




@Component({
  selector: 'transactions-dialog',
  templateUrl: 'transactions-dialog.html',
})
export class TransactionDialog {

  constructor(
    public dialogRef: MatDialogRef<TransactionDialog>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData) { }

  onNoClick(): void {
    this.dialogRef.close();
  }

}
