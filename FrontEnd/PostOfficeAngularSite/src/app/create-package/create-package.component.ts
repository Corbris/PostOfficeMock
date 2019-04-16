import { Component, OnInit, ViewChild, Inject } from '@angular/core';
import { FormControl, FormGroup, FormBuilder, Validators} from '@angular/forms';
import { APIService } from '../_services/api.service';
import { DatePipe } from '@angular/common';
import { formatDate } from '@angular/common';
import { MatSnackBar } from '@angular/material';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';

export interface DialogData {
  title: string;
  // description: string;
  // image: string;
  // price: number;
}

@Component({
  selector: 'app-create-package',
  templateUrl: './create-package.component.html',
  styleUrls: ['./create-package.component.css']
})
export class CreatePackageComponent implements OnInit {
  CustomerEmail = new FormControl('');
  PackageForm: FormGroup;
  TransactionForm: FormGroup;

  // Cash = true;
  // CreditCard = false;
  PaymentKinds: string[] = ['Cash', 'Credit Card'];
  ChosenPaymentKind = 'Cash';

  dialogData: DialogData = {title: 'crapola'};

  Cost = 0.00;
  Tax = 0.00;
  Total = 0.00;

  TransactionID;
  PackageID;

  constructor(private formBuilder: FormBuilder,
              public api: APIService,
              private snackBar: MatSnackBar,
              public dialog: MatDialog) { }

  ngOnInit() {
    this.PackageForm = this.formBuilder.group({
      HouseNumber: ['', Validators.compose([Validators.required, Validators.minLength(2)])],
      Street: ['', Validators.compose([Validators.required, Validators.minLength(2)])],
      City: ['', Validators.compose([Validators.required, Validators.minLength(2)])],
      State: ['', Validators.compose([Validators.required, Validators.minLength(2)])],
      ZipCode: ['', Validators.compose([Validators.required, Validators.minLength(2)])],
      Weight: ['', Validators.compose([Validators.required, Validators.minLength(1)])],
      Size: ['', Validators.compose([Validators.required, Validators.minLength(2)])],
      ETA: ['', Validators.compose([Validators.required, Validators.minLength(2)])]
    });

    this.TransactionForm = this.formBuilder.group({
      FnameCC: ['', Validators.compose([Validators.minLength(2)])],
      MInitCC: ['', Validators.compose([Validators.minLength(2)])],
      LnameCC: ['', Validators.compose([Validators.minLength(2)])],
      CCnumner: ['', Validators.compose([Validators.minLength(2)])]
    });

    this.PackageForm.valueChanges.subscribe(() => {
      this.Cost = .35 * this.PackageForm.value.Weight;
      this.Tax = .085 * this.Cost;
      this.Total = this.Cost + this.Tax;
    });

  }

  CheckOut() {
    if (!this.PackageForm.valid) {
      this.snackBar.open("Same of the Package Information is Invalid", "Close", {
        duration: 8000,
      });
      return;
    }
    else if (!this.TransactionForm.valid) {
      this.snackBar.open("Same of the Transaction Information is Invalid", "Close", {
        duration: 8000,
      });
      return;
    }

    let now = '' + formatDate(new Date(), 'yyyy-MM-dd HH:MM:SS', 'en');
    let paymentType = '' + ((this.ChosenPaymentKind == 'Credit Card' ? 1 : 0) + 1);
    let total = '' + this.Total;

    //cash
    if (paymentType == '1') {
      this.api.packageTransactionCash(this.CustomerEmail.value, now, total, paymentType, sessionStorage.getItem("ID"))
        .subscribe((res) => {
          //we are returning the response
          if (res == null) {
            console.log(res);
            this.snackBar.open("Failed to perform transaction: check the customer's email", "Close", {
              duration: 8000,
            });
          }
          else {
            console.log("transaction was good");
            console.log(res['insertId']);
            this.TransactionID = res['insertId'];
            this.createPackage();

            const dialogRef = this.dialog.open(CreatePackageDialog, {
              width: '600px',
              data: this.dialogData
            });

            dialogRef.afterClosed().subscribe(
              result => {console.log('The dialog was closed');});
          }
        });;
    }

    //card
    else {
      this.api.packageTransactionCC(this.CustomerEmail.value, now, total, this.TransactionForm.value.CCnumner.substring(0, 4), this.TransactionForm.value.FnameCC, this.TransactionForm.value.LnameCC, this.TransactionForm.value.MInitCC, paymentType, sessionStorage.getItem("ID"))
        .subscribe((res) => {
          //we are returning the response
          if (res == null) {
            this.snackBar.open("Failed to Create the Transaction", "Close", {
              duration: 8000,
            });
          }
          else {
            console.log("transaction was good");
            this.TransactionID = res['insertId'];
            this.createPackage();
          }
        });;
    }

  }


  createPackage() {
    console.log("making the package");
    let now = '' + formatDate(new Date(), 'yyyy-MM-dd HH:MM:SS', 'en');
    this.api.createPackage(this.TransactionID, this.CustomerEmail.value, this.PackageForm.value.HouseNumber, this.PackageForm.value.Street, this.PackageForm.value.ZipCode, this.PackageForm.value.City, this.PackageForm.value.State, "USA", this.PackageForm.value.Weight, this.PackageForm.value.Size, now, this.PackageForm.value.ETA, "2")
      .subscribe((res) => {
        if (res == null) {
          console.log("error")
          this.snackBar.open("Failed to Create the Package", "Close", {
            duration: 8000,
          });
        }
        else {
          console.log("package was made ");
          this.PackageID = res['insertId'];
          this.updateTracking();
        }
      });;

  }

  updateTracking() {
    console.log("making the package");
    let now = '' + formatDate(new Date(), 'yyyy-MM-dd HH:MM:SS', 'en');
    this.api.updateTrackingNewPackage(this.PackageID, sessionStorage.getItem("ID"), now)
      .subscribe((res) => {
        if (res != null) {
          this.snackBar.open("Failed to update Tracking", "Close", {
            duration: 8000,
          });
        }
        else {
          console.log("tracking was updated");
        }
      });;
  }

}

@Component({
  selector: 'create-package-dialog',
  templateUrl: './create-package-dialog.html',
  styleUrls: ['./create-package.component.css']
})

export class CreatePackageDialog {
  constructor(
    public dialogRef: MatDialogRef<CreatePackageDialog>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData[]) {}
}
