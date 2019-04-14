import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { APIService } from '../_services/api.service';

@Component({
  selector: 'app-user-account',
  templateUrl: './user-account.component.html',
  styleUrls: ['./user-account.component.css']
})
export class UserAccountComponent implements OnInit {
  userAccountForm: FormGroup;
  name = "FFFFF";
  InitCustomerData = [{ "CustomerID": 10001, "Fname": "Fname", "MInit": "M", "Lname": "Lname", "Email": "Email@gmail.com", "MobileNumber": "713-205-8901", "HouseNumber": "1622", "Street": "Conrad Sauer Dr.", "ZipCode": "77043", "City": "Houston", "State": "TX", "Country": "USA" }];
  CustomerData;
  constructor(private formBuilder: FormBuilder, public api: APIService) { }
  
  ngOnInit() {

    this.api.customerFromID(sessionStorage.getItem("ID"))
      .subscribe((Data) => {
        console.log(Data[0].Fname);
        this.CustomerData = Data[0];
        this.userAccountForm.controls.Fname.setValue(this.CustomerData.Fname);
        this.userAccountForm.controls.Mint.setValue(this.CustomerData.MInit);
        this.userAccountForm.controls.Lname.setValue(this.CustomerData.Lname);
        this.userAccountForm.controls.Email.setValue(this.CustomerData.Email);
        this.userAccountForm.controls.PhoneNumber.setValue(this.CustomerData.MobileNumber);
        this.userAccountForm.controls.HouseNumber.setValue(this.CustomerData.HouseNumber);
        this.userAccountForm.controls.Street.setValue(this.CustomerData.Street);
        this.userAccountForm.controls.City.setValue(this.CustomerData.City);
        this.userAccountForm.controls.State.setValue(this.CustomerData.State);
        this.userAccountForm.controls.Zip.setValue(this.CustomerData.ZipCode);

      });;

      this.userAccountForm = this.formBuilder.group({
        Fname: ['', Validators.compose([Validators.required])],
        Mint: ['', Validators.compose([Validators.required])],
        Lname: ['', Validators.compose([Validators.required])],
        Email: ['', Validators.compose([Validators.required])],
        PhoneNumber: ['', Validators.compose([Validators.required])],
        HouseNumber: ['', Validators.compose([Validators.required])],
        Street: ['', Validators.compose([Validators.required])],
        City: ['', Validators.compose([Validators.required])],
        State: ['', Validators.compose([Validators.required])],
        Zip: ['', Validators.compose([Validators.required])]
      });

  }


  submit() {
    //update API. 
  }



   
}
