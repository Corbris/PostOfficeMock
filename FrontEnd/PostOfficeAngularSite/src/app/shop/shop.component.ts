import { Component, OnInit, ViewChild, Inject } from '@angular/core';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { APIService } from '../_services/api.service';
import { MatSnackBar } from '@angular/material';

export interface Item {
  title: string;
  description: string;
  image: string;
  price: number;
}

export interface CartItem {
  item: Item;
  quantity: number;
}

var cartItems: CartItem[] = [];

@Component({
  selector: 'app-shop',
  templateUrl: './shop.component.html',
  styleUrls: ['./shop.component.css']
})
export class ShopComponent implements OnInit {
  constructor(public dialog: MatDialog,
    public api: APIService,
    private snackBar: MatSnackBar,) { }

  items: Item[] = [];


  ngOnInit() {
    this.api.shopProducts()
      .subscribe((res) => {
        for (var x in res) {
          this.items.push(
            {
              title: res[x].ProductName,
              description: res[x].Description,
              image: 'assets/shop_images/' + res[x].ImagePath,
              price: res[x].Price
            }
          );
        }
      });;
  }

  

  // cartItems: CartItem[] = [];

  getCartItems() {
    return cartItems;
  }

  getNumCartItems(): number {
    var result = 0;
    for (var i in cartItems) {
      result += cartItems[i].quantity;
    }
    console.log(result);
    return result;
  }

  openCart(): void {
    const dialogRef = this.dialog.open(ShoppingCartDialog, {
      width: '600px',
      data: cartItems
    });

    dialogRef.afterClosed().subscribe(
      result => {console.log('The dialog was closed');});
  }

  addToCart(item: Item) {
    var foundIndex;
    let found = cartItems.some(
      (element, index) => {
        foundIndex = index;
        return element.item.title == item.title;
      });
    if (!found) {
      let itemToPutInCart: CartItem = {item: item, quantity: 1};
      cartItems.push(itemToPutInCart);
    } else {
      cartItems[foundIndex].quantity += 1;
    }
    console.log(cartItems);
  }

}

@Component({
  selector: 'shopping-cart-dialog',
  templateUrl: './shopping-cart-dialog.html',
  styleUrls: ['./shop.component.css']
})
export class ShoppingCartDialog {
  constructor(
    public dialogRef: MatDialogRef<ShoppingCartDialog>,
    @Inject(MAT_DIALOG_DATA) public data: CartItem[]) {}

  getCartItems() {
    return cartItems;
  }

  inc(i: CartItem) {
    var foundIndex = -1;
    let found = cartItems.some(
      (element, index) => {
        foundIndex = index;
        return element.item.title == i.item.title;
      });
    cartItems[foundIndex].quantity += 1;
  }

  dec(i: CartItem) {
    var foundIndex = -1;
    let found = cartItems.some(
      (element, index) => {
        foundIndex = index;
        return element.item.title == i.item.title;
      });
    console.log(foundIndex);
    cartItems[foundIndex].quantity -= 1;

    if (cartItems[foundIndex].quantity == 0) {
      cartItems.splice(foundIndex, 1);
    }
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}
