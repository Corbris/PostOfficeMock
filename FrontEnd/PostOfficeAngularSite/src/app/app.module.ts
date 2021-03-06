import { BrowserModule } from '@angular/platform-browser';
import { ReactiveFormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {
  MatAutocompleteModule,
  MatBadgeModule,
  MatBottomSheetModule,
  MatButtonModule,
  MatButtonToggleModule,
  MatCardModule,
  MatCheckboxModule,
  MatChipsModule,
  MatDatepickerModule,
  MatDialogModule,
  MatDividerModule,
  MatExpansionModule,
  MatGridListModule,
  MatIconModule,
  MatInputModule,
  MatListModule,
  MatMenuModule,
  MatNativeDateModule,
  MatPaginatorModule,
  MatProgressBarModule,
  MatProgressSpinnerModule,
  MatRadioModule,
  MatRippleModule,
  MatSelectModule,
  MatSidenavModule,
  MatSliderModule,
  MatSlideToggleModule,
  MatSnackBarModule,
  MatSortModule,
  MatStepperModule,
  MatTableModule,
  MatTabsModule,
  MatToolbarModule,
  MatTooltipModule,
  MatTreeModule,
} from '@angular/material';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';


import { AppComponent } from './app.component';
import { TrackingComponent } from './tracking/tracking.component';
import { AppRoutingModule } from './app-routing.module';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { MyPackagesComponent } from './my-packages/my-packages.component';
import { RegisterComponent } from './register/register.component';
import { NavBarComponent } from './nav-bar/nav-bar.component';
import { FindLocationComponent } from './find-location/find-location.component';
import { ShopComponent, ShoppingCartDialog } from './shop/shop.component';
import { UserAccountComponent } from './user-account/user-account.component';
import { CreatePackageComponent, CreatePackageDialog } from './create-package/create-package.component';
import { UpdateTrackingComponent } from './update-tracking/update-tracking.component';
import { EmployeeAccountComponent } from './employee-account/employee-account.component';
import { UserLookupComponent } from './user-lookup/user-lookup.component';
import { EmployeeLookupComponent } from './employee-lookup/employee-lookup.component';
import { LocationEmployeesComponent } from './location-employees/location-employees.component';
import { LocationDashboardComponent } from './location-dashboard/location-dashboard.component';


import { AuthService } from './_services/auth.service';
import { APIService } from './_services/api.service';
import { RoleGuardService } from './_services/role-guard.service';
import { ChartsModule } from 'ng2-charts';
import { CheckoutComponent } from './checkout/checkout.component';
import { PackageGraphComponent } from './package-graph/package-graph.component';
import { EmployeeSalesGraphComponent } from './employeeSales-graph/employeeSales-graph.component';
import { TransactionsComponent, TransactionDialog } from './transactions/transactions.component';

@NgModule({
  declarations: [
    AppComponent,
    TrackingComponent,
    HomeComponent,
    LoginComponent,
    MyPackagesComponent,
    RegisterComponent,
    NavBarComponent,
    FindLocationComponent,
    ShopComponent,
    UserAccountComponent,
    CreatePackageComponent,
    UpdateTrackingComponent,
    EmployeeAccountComponent,
    UserLookupComponent,
    EmployeeLookupComponent,
    LocationEmployeesComponent,
    LocationDashboardComponent,
    ShoppingCartDialog,
    CreatePackageDialog,
    CheckoutComponent,
    PackageGraphComponent,
    EmployeeSalesGraphComponent,
    TransactionsComponent,
    TransactionDialog
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
    MatAutocompleteModule,
    MatBadgeModule,
    MatBottomSheetModule,
    MatButtonModule,
    MatButtonToggleModule,
    MatCardModule,
    MatCheckboxModule,
    MatChipsModule,
    MatDatepickerModule,
    MatDialogModule,
    MatDividerModule,
    MatExpansionModule,
    MatGridListModule,
    MatIconModule,
    MatInputModule,
    MatListModule,
    MatMenuModule,
    MatNativeDateModule,
    MatPaginatorModule,
    MatProgressBarModule,
    MatProgressSpinnerModule,
    MatRadioModule,
    MatRippleModule,
    MatSelectModule,
    MatSidenavModule,
    MatSliderModule,
    MatSlideToggleModule,
    MatSnackBarModule,
    MatSortModule,
    MatStepperModule,
    MatTableModule,
    MatTabsModule,
    MatToolbarModule,
    MatTooltipModule,
    MatTreeModule,
    BrowserAnimationsModule,
    FormsModule,
    HttpClientModule,
    ChartsModule,
    NgbModule.forRoot(),
  ],
  exports: [
    MatAutocompleteModule,
    MatBadgeModule,
    MatBottomSheetModule,
    MatButtonModule,
    MatButtonToggleModule,
    MatCardModule,
    MatCheckboxModule,
    MatChipsModule,
    MatDatepickerModule,
    MatDialogModule,
    MatDividerModule,
    MatExpansionModule,
    MatGridListModule,
    MatIconModule,
    MatInputModule,
    MatListModule,
    MatMenuModule,
    MatNativeDateModule,
    MatPaginatorModule,
    MatProgressBarModule,
    MatProgressSpinnerModule,
    MatRadioModule,
    MatRippleModule,
    MatSelectModule,
    MatSidenavModule,
    MatSliderModule,
    MatSlideToggleModule,
    MatSnackBarModule,
    MatSortModule,
    MatStepperModule,
    MatTableModule,
    MatTabsModule,
    MatToolbarModule,
    MatTooltipModule,
    MatTreeModule,
    BrowserAnimationsModule,
    ChartsModule
  ],
  entryComponents: [ShoppingCartDialog, CreatePackageDialog, TransactionDialog],
  providers: [AuthService, APIService, RoleGuardService, HttpClientModule],
  bootstrap: [AppComponent]
})
export class AppModule { }
