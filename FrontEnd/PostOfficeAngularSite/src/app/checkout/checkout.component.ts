import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators} from '@angular/forms';
import { CartItem, cartItems, unsealCart, sealCart } from '../shop/shop.component';
import { APIService } from '../_services/api.service';
import { MatSnackBar } from '@angular/material';
import { formatDate } from '@angular/common';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})

export class CheckoutComponent implements OnInit {

  userCheckoutForm: FormGroup;
  showcart = true;

  constructor(private formBuilder: FormBuilder,
              public api: APIService,
              private snackBar: MatSnackBar) { }


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

  Total;
  computeTotal() {
    var total = 0;
    for (var i in cartItems) {
      total += this.computePrice(cartItems[i]);
    }
    total = total + total * .08;
    this.Total = '' + total;
    return total;
    // TODO: Tax?
  }

  checkoutComplete() {
    if (!this.userCheckoutForm.valid) {
      this.snackBar.open("Invalid billing data", "Close", {
        duration: 3000,
      });
      console.log(this.userCheckoutForm);


    }
    else { 
    console.log("something happened");
    console.log(this.userCheckoutForm);
    //make transaction

    let timeStamp = formatDate(new Date(), 'yyyy-MM-dd HH:MM:SS', 'en');
    this.api.onlineTransaction(sessionStorage.getItem("ID"), timeStamp, this.userCheckoutForm.value.CCnumber.substring(0,4) ,''+this.Total, this.userCheckoutForm.value.FnameCC, this.userCheckoutForm.value.LnameCC, this.userCheckoutForm.value.MInitCC, this.userCheckoutForm.value.CardType)
      .subscribe((res) => {
        console.log(res);
        console.log("made transaction");
        if (res != null || res != undefined) {
          console.log(res.insertId);
          for (var i in cartItems) {
            this.api.orderDetails(cartItems[i].item.title, res.insertId, ''+cartItems[i].quantity, ''+cartItems[i].item.price)
              .subscribe((res) => {
                console.log(res);
                console.log(cartItems[i].item.title, cartItems[i].item.price, cartItems[i].quantity);

                
              });
          }
          //done with cart
          this.clearCart();
          //show transactions
        }        
      });;
  }
  }

  clearCart() {
    
    let temp = localStorage.getItem("carts");
    temp = JSON.parse(temp);
    temp[0]['cartItems'] = [];
    localStorage.setItem("carts", JSON.stringify(temp));

    //this reload page

    this.snackBar.open("Thanks for your purchase", "Close", {
      duration: 8000,

    });
    
    
  }

  show() {

  }

  ngOnInit() {
    unsealCart();

    this.userCheckoutForm = this.formBuilder.group({
      FnameCC: [''],
      MInitCC: [''],
      LnameCC: [''],
      CCnumber: [''],
      CCexpiration: [''],
      CCcvv: [''],
      CardType: ['']
    });
  }


  



}
