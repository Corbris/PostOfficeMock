import { Component, OnInit } from '@angular/core';
import { cartItems, unsealCart, sealCart } from '../shop/shop.component';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})
export class CheckoutComponent implements OnInit {

  constructor() { }

  getNumCartItems(): number {
    var result = 0;
    for (var i in cartItems) {
      result += cartItems[i].quantity;
    }
    return result;
  }

  ngOnInit() {
    unsealCart();
  }

}
