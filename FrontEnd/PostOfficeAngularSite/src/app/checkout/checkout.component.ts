import { Component, OnInit } from '@angular/core';
import {CartItem, cartItems, unsealCart, sealCart } from '../shop/shop.component';

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
  }

}
