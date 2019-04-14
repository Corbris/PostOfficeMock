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
  CustomerData;
  UserID = sessionStorage.getItem("ID");


  constructor(private formBuilder: FormBuilder, public api: APIService) { }
  
  ngOnInit() {
    this.api.customerFromID(sessionStorage.getItem("ID"))
      .subscribe((Data) => {
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


  UpdateUser() {
    //update API.
    //customer & customer login page.
    this.api.updateUser(this.userAccountForm.value.Fname, this.userAccountForm.value.Mint, this.userAccountForm.value.Lname, this.userAccountForm.value.Email, this.userAccountForm.value.PhoneNumber, this.userAccountForm.value.HouseNumber, this.userAccountForm.value.Street, this.userAccountForm.value.City, this.userAccountForm.value.State, this.userAccountForm.value.Zip, this.UserID)
      .subscribe((res) => {
        console.log(res);
      });;
    


  }



   
}
