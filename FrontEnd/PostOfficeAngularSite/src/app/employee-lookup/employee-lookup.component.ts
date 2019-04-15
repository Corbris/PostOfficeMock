import { Component, OnInit } from '@angular/core';
import { APIService } from '../_services/api.service';
import { FormControl, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material';

@Component({
  selector: 'app-employee-lookup',
  templateUrl: './employee-lookup.component.html',
  styleUrls: ['./employee-lookup.component.css']
})
export class EmployeeLookupComponent implements OnInit {
  Email = new FormControl('');
  acquiredData = false;

  NameData: any = [];
  ContactData: any = [];
  LocationData: any = [];

  displayedAccountColumns = ['key', 'value'];
  RolesID = ["", "Clerk", "Sorter", "Manager", "HR", "Driver"];
  AuthID = ["", "employee", "manager", "admin"];
  Empolyed = ["No", "Yes"];

  EmployeeWorkDataForm: FormGroup;
  EmployeeData;

  constructor(public api: APIService,
    private snackBar: MatSnackBar,
    public formBuilder: FormBuilder) { }

  ngOnInit() {
    this.EmployeeWorkDataForm = this.formBuilder.group({
      LocationID: ['', Validators.compose([Validators.required])],
      Employed: ['', Validators.compose([Validators.required])],
      AuthLevel: ['', Validators.compose([Validators.required])],
      Email: ['', Validators.compose([Validators.required])],
      PhoneNumber: ['', Validators.compose([Validators.required])],
      Role: ['', Validators.compose([Validators.required])],
      HiredOn: ['', Validators.compose([Validators.required])],
      Wage: ['', Validators.compose([Validators.required])]
    });
  }

  lookupUser() {
    this.api.employeeFromId(this.Email.value)
      .subscribe((res) => {
        this.EmployeeData = res[0];
        console.log(res);
        if (res != null) {
          this.NameData = [
            { key: "First Name", value: res[0].Fname },
            { key: "Middle Initial", value: res[0].MInit },
            { key: "Last Name", value: res[0].Lname },
          ];

          this.ContactData = [
            { key: "Email", value: res[0].PersonalEmail },
            { key: "Mobile Phone", value: res[0].MobilePhone }
          ];

          this.LocationData = [
            { key: "House Number", value: res[0].HouseNumber },
            { key: "Street", value: res[0].Street },
            { key: "City", value: res[0].City },
            { key: "State", value: res[0].State },
            { key: "Zip Code", value: res[0].City },
          ];

          this.EmployeeWorkDataForm.controls.LocationID.setValue(this.EmployeeData.LocationID);
          this.EmployeeWorkDataForm.controls.Employed.setValue(this.Empolyed[this.EmployeeData.CurrentlyEmployed]);
          this.EmployeeWorkDataForm.controls.AuthLevel.setValue(this.AuthID[this.EmployeeData.AuthID]);
          this.EmployeeWorkDataForm.controls.Email.setValue(this.EmployeeData.WorkEmail);
          this.EmployeeWorkDataForm.controls.PhoneNumber.setValue(this.EmployeeData.WorkPhone);
          this.EmployeeWorkDataForm.controls.Role.setValue(this.RolesID[this.EmployeeData.RoleID]);
          this.EmployeeWorkDataForm.controls.HiredOn.setValue(this.EmployeeData.HiredOn.substring(0,10));
          this.EmployeeWorkDataForm.controls.Wage.setValue(this.EmployeeData.Wage);


          this.acquiredData = true;

        }
        else {
          this.snackBar.open("Could not find a customer with that email.", "Close", {
            duration: 2000,
          });
        }

      });

    //call api

  }

}
