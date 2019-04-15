import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, FormBuilder, Validators} from '@angular/forms';
import { APIService } from '../_services/api.service';
import { DatePipe } from '@angular/common';
import { formatDate } from '@angular/common';

@Component({
  selector: 'app-create-package',
  templateUrl: './create-package.component.html',
  styleUrls: ['./create-package.component.css']
})
export class CreatePackageComponent implements OnInit {
  CustomerEmail = new FormControl('');
  PackageForm: FormGroup;
  TransactionForm: FormGroup;

  Cash = true;
  CreditCard = false;

  Cost = 0.00;
  Tax = 0.00;
  Total = 0.00;

  TransactionID;

  constructor(private formBuilder: FormBuilder,
    public api: APIService) { }

  ngOnInit() {
    this.PackageForm = this.formBuilder.group({
      HouseNumber: ['', Validators.compose([Validators.required])],
      Street: ['', Validators.compose([Validators.required])],
      City: ['', Validators.compose([Validators.required])],
      State: ['', Validators.compose([Validators.required])],
      ZipCode: ['', Validators.compose([Validators.required])],
      Weight: ['', Validators.compose([Validators.required])],
      Size: ['', Validators.compose([Validators.required])],
      ETA: ['', Validators.compose([Validators.required])]
    });

    this.TransactionForm = this.formBuilder.group({
      FnameCC: ['', Validators.compose([Validators.required])],
      MInitCC: ['', Validators.compose([Validators.required])],
      LnameCC: ['', Validators.compose([Validators.required])],
      CCnumner: ['', Validators.compose([Validators.required])]
    });

    this.PackageForm.valueChanges.subscribe(() => {
      this.Cost = .35 * this.PackageForm.value.Weight;
      this.Tax = .085 * this.Cost;
      this.Total = this.Cost + this.Tax;
    });

  }

  CheckOut() {
    let now = '' + Date.now();
    let paymentType = '' + ((this.CreditCard ? 1 : 0) + 1);
    let total = '' + this.Total;

    //cash
    if (paymentType == '1') {
      this.api.packageTransactionCash(this.CustomerEmail.value, now, total, paymentType, sessionStorage.getItem("ID"))
        .subscribe((res) => {
          //we are returning the response
          if (res == null) {
            console.log("error")
          }
          else {
            console.log("transaction was good");
            console.log(res['insertId']);
            this.TransactionID = res['insertId'];
            this.createPackage();
          }

        });;
    }

    //card
    else {
      this.api.packageTransactionCC(this.CustomerEmail.value, now, total, this.TransactionForm.value.CCnumner.substring(0, 4), this.TransactionForm.value.FnameCC, this.TransactionForm.value.LnameCC, this.TransactionForm.value.MInitCC, paymentType, sessionStorage.getItem("ID"))
        .subscribe((res) => {
          //we are returning the response
          if (res == null) {
            console.log("error")
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
    let now = '' + Date.now();
    this.api.createPackage(this.TransactionID, this.CustomerEmail.value, this.PackageForm.value.HouseNumber, this.PackageForm.value.Street, this.PackageForm.value.ZipCode, this.PackageForm.value.City, this.PackageForm.value.State, "USA", this.PackageForm.value.Weight, this.PackageForm.value.Size, now, this.PackageForm.value.ETA, "2")
      .subscribe((res) => {
        if (res == null) {
          console.log("error")

        }
        else {
          console.log("package was made ");
        }
      });;

  }

}
