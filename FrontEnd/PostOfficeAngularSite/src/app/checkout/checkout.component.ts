import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators} from '@angular/forms';
import {CartItem, cartItems, unsealCart, sealCart } from '../shop/shop.component';
import { APIService } from '../_services/api.service';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})

export class CheckoutComponent implements OnInit {

  userCheckoutForm: FormGroup;
  CustomerData;
  UserID = sessionStorage.getItem("ID");

  constructor(public api: APIService) { }

  getNumCartItems(): number {
    var result = 0;
    for (var i in cartItems) {
      result += cartItems[i].quantity;
    }
    return result;
  }

  getCartItems() {
    return cartItems;
  }
  computePrice(i: CartItem): number {
    return i.item.price * i.quantity;
  }

  computeTotal() {
    var total = 0;
    for (var i in cartItems) {
      total += this.computePrice(cartItems[i]);
    }
    return total;
    // TODO: Tax?
  }

  ngOnInit() {
    unsealCart();


    this.api.customerFromID(sessionStorage.getItem("ID"))
    .subscribe((Data) => {
      this.CustomerData = Data[0];
      this.userCheckoutForm.controls.Fname.setValue(this.CustomerData.Fname);
      this.userCheckoutForm.controls.Lname.setValue(this.CustomerData.Lname);
      this.userCheckoutForm.controls.Email.setValue(this.CustomerData.Email);
      this.userCheckoutForm.controls.PhoneNumber.setValue(this.CustomerData.MobileNumber);
      this.userCheckoutForm.controls.HouseNumber.setValue(this.CustomerData.HouseNumber);
      this.userCheckoutForm.controls.Street.setValue(this.CustomerData.Street);
      this.userCheckoutForm.controls.City.setValue(this.CustomerData.City);
      this.userCheckoutForm.controls.State.setValue(this.CustomerData.State);
      this.userCheckoutForm.controls.Zip.setValue(this.CustomerData.ZipCode);

    });
  }

}
