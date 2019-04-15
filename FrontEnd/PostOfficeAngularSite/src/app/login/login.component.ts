import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../_services/auth.service';
import { APIService } from '../_services/api.service';
import { MatSnackBar } from '@angular/material';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  loginForm: FormGroup;
  // errorMessage = '';

  constructor(private formBuilder: FormBuilder,
              public auth: AuthService,
              public api: APIService,
              public myRoute: Router,
              private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.loginForm = this.formBuilder.group({
      email: ['', Validators.compose([Validators.required])],
      password: ['', Validators.compose([Validators.required])]
    });
  }

  login() {
    //login forms were filled out
    if (this.loginForm.valid) {
      if (this.loginForm.value.email.indexOf('\u0040') > 0) {
        this.api.userLoginAuth(this.loginForm.value.email, this.loginForm.value.password)
          .subscribe((data: {}) => {
            //we have logged in a nd API returns user ID
            if (data[0] != undefined) {
              this.snackBar.open("Logged in.", "Close", {
                duration: 2000,
              });
              console.log("User: " + data[0].CustomerID + " has logged in");
              this.auth.sendToken("user", data[0].CustomerID);
              this.myRoute.navigate(["home"]);
            }

            else {
              this.snackBar.open("Incorrect Email/Password!", "Close", {
                duration: 2000,
              });
            }
          });;
      }


      //employee login
      else {
        this.api.employeeLoginAuth(this.loginForm.value.email, this.loginForm.value.password)
          .subscribe((data: {}) => {
            //we have logged in a nd API returns user ID
            if (data[0] != undefined) {
              this.snackBar.open("Logged in.", "Close", {
                duration: 2000,
              });
              console.log(data[0].AuthenticationLevel + ": " + this.loginForm.value.email + " has logged in");
              this.auth.sendToken(data[0].AuthenticationLevel, this.loginForm.value.email);
              this.myRoute.navigate(["home"]);
            }

            else {
              this.snackBar.open("Incorrect Email/Password!", "Close", {
                duration: 2000,
              });
            }
          });;

      }


    }
    //something was missing.
    else {
      this.snackBar.open("One of the fields is missing!", "Close", {
        duration: 2000,
      });
    }
  }
}
