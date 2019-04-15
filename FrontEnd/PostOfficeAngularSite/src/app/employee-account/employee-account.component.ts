import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { APIService } from '../_services/api.service';
import { MatSnackBar } from '@angular/material';

@Component({
  selector: 'app-employee-account',
  templateUrl: './employee-account.component.html',
  styleUrls: ['./employee-account.component.css']
})
export class EmployeeAccountComponent implements OnInit {
  employeeAccountForm: FormGroup;
  employeeData;
  employeeID = sessionStorage.getItem("ID");
  LocationID ="";
  EmployeeID ="";
  RoleID = "";
  AuthID = "";
  WorkEmail = "";
  WorkPhone = "";
  Wage = "";
  HiredOn = "";

  Roles = ["", "Clerk", "Sorter", "Manager", "HR", "Driver"];
  AuthLevel = ["", "Employee", "Manager", "Admin"];


  constructor(private formBuilder: FormBuilder, public api: APIService, private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.api.getEmployee(sessionStorage.getItem("ID"))
      .subscribe((Data) => {
        this.employeeData = Data[0];
        this.employeeAccountForm.controls.Fname.setValue(this.employeeData.Fname);
        this.employeeAccountForm.controls.Mint.setValue(this.employeeData.MInit);
        this.employeeAccountForm.controls.Lname.setValue(this.employeeData.Lname);
        this.employeeAccountForm.controls.Email.setValue(this.employeeData.PersonalEmail);
        this.employeeAccountForm.controls.PhoneNumber.setValue(this.employeeData.MobilePhone);
        this.employeeAccountForm.controls.HouseNumber.setValue(this.employeeData.HouseNumber);
        this.employeeAccountForm.controls.Street.setValue(this.employeeData.Street);
        this.employeeAccountForm.controls.City.setValue(this.employeeData.City);
        this.employeeAccountForm.controls.State.setValue(this.employeeData.State);
        this.employeeAccountForm.controls.Zip.setValue(this.employeeData.ZipCode);

        this.LocationID = this.employeeData.LocationID;
        this.EmployeeID = this.employeeData.EmployeeID;
        this.RoleID = this.Roles[this.employeeData.RoleID];
        this.AuthID = this.AuthLevel[this.employeeData.AuthID];
        this.WorkEmail = this.employeeData.WorkEmail;
        this.WorkPhone = this.employeeData.WorkPhone;
        this.Wage = this.employeeData.Wage;
        this.HiredOn = this.employeeData.HiredOn.substring(0,10);


      });;

      this.employeeAccountForm = this.formBuilder.group({
      Fname: ['', Validators.compose([Validators.required, Validators.minLength(2)])],
      Mint: ['', Validators.compose([Validators.required, Validators.maxLength(1)])],
      Lname: ['', Validators.compose([Validators.required, Validators.minLength(2)])],
      Email: ['', Validators.compose([Validators.required, Validators.minLength(5)])],
      PhoneNumber: ['', Validators.compose([Validators.required, Validators.minLength(9)])],
      HouseNumber: ['', Validators.compose([Validators.required, Validators.minLength(1)])],
      Street: ['', Validators.compose([Validators.required, Validators.minLength(2)])],
      City: ['', Validators.compose([Validators.required, Validators.minLength(2)])],
      State: ['', Validators.compose([Validators.required, Validators.maxLength(2)])],
      Zip: ['', Validators.compose([Validators.required, Validators.minLength(2)])]
    });
  }

  UpdateUser() {
    //update API.
    //customer & customer login page.
    if (this.employeeAccountForm.valid) {
      this.api.updateEmployeePersonal(this.employeeAccountForm.value.Fname, this.employeeAccountForm.value.Mint, this.employeeAccountForm.value.Lname, this.employeeAccountForm.value.Email, this.employeeAccountForm.value.PhoneNumber, this.employeeAccountForm.value.HouseNumber, this.employeeAccountForm.value.Street, this.employeeAccountForm.value.City, this.employeeAccountForm.value.State, this.employeeAccountForm.value.Zip, this.employeeID)
        .subscribe((res) => {
          console.log(res);
        });;

    }
    else {
      this.snackBar.open("INVALID Information", "Close", {
        duration: 2000,
      });

    }



  }

}
