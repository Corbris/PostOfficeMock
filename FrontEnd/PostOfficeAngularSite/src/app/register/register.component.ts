import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { APIService } from '../_services/api.service';
import { AuthService } from '../_services/auth.service';
import { Router } from '@angular/router';
import { MatSnackBar } from '@angular/material';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  registerForm: FormGroup;

  constructor(private formBuilder: FormBuilder,
              public auth: AuthService,
              public api: APIService,
              public myRoute: Router,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.registerForm = this.formBuilder.group({
      Fname: ['', Validators.compose([Validators.required])],
      Mint: ['', Validators.compose([Validators.required])],
      Lname: ['', Validators.compose([Validators.required])],
      Email: ['', Validators.compose([Validators.required])],
      PhoneNumber: ['', Validators.compose([Validators.required])],
      HouseNumber: ['', Validators.compose([Validators.required])],
      Street: ['', Validators.compose([Validators.required])],
      City: ['', Validators.compose([Validators.required])],
      State: ['', Validators.compose([Validators.required])],
      Zip: ['', Validators.compose([Validators.required])],
      Password: ['', Validators.compose([Validators.required])],
    });
  }

  register() {
    if (!this.errors()) {  //basic error with out checking api(length, type ect.)
      // this.hideAlert = true;

      //call api, returns the error message.
      this.api.registerUser(this.registerForm.value.Fname, this.registerForm.value.Mint, this.registerForm.value.Lname, this.registerForm.value.Email, this.registerForm.value.PhoneNumber, this.registerForm.value.HouseNumber, this.registerForm.value.Street, this.registerForm.value.City, this.registerForm.value.State, this.registerForm.value.Zip)
        .subscribe((res) => {
          console.log(res);
          //return an error message
          if (res != null) {
            this.snackBar.open(res.sqlMessage, "Close", {
              duration: 2000,
            });
            // this.hideAlert = false;
          }

          //no error was good
          else {
            //add to customer login table
            this.userLoginTable();
          }

       });;

    }
    //if form not valid error
    // else {
    //   this.hideAlert = false;
    // }
  }

  userLoginTable() {
    var data = this.api.registerUserLogin(this.registerForm.value.Email, this.registerForm.value.Password)
      .subscribe((res) => {
      console.log(res);
      });;

      //added to table go to login page now
      this.myRoute.navigate(["login"]);
  }


  errors(): boolean{
    var result = false;
    var errorMessage = '';
    if (!this.registerForm.valid) {
      errorMessage = "One or more of the fields is missing.";
      result = true;
    }
    if (this.registerForm.value.Fname.length < 2) {
      errorMessage = "Enter a valid first name.";
      result = true;
    }
    if (this.registerForm.value.Mint.length > 1) {
      errorMessage = "Your middle initial should only be 1 letter.";
      result = true;
    }
    if (this.registerForm.value.Lname.length < 2) {
      errorMessage = "Enter a valid last name.";
      result = true;
    }
    if (this.registerForm.value.Email.length < 5 || this.registerForm.value.Email.indexOf('\u0040') <= 0) {
      errorMessage = "Enter a valid email.";
      result = true;
    }
    if (this.registerForm.value.State.length != 2) {
      errorMessage = "The state initial should only be 2 letters.";
      result = true;
    }

    if (result) {
      this.snackBar.open(errorMessage, "Close", {
        duration: 2000,
      });
    }

    return result;
  }

  // closeAlert() {
  //   this.hideAlert = true;
  // }

}
