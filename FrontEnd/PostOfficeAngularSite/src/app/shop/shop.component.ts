import { Component, OnInit, ViewChild, Inject } from '@angular/core';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';

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
  constructor(public dialog: MatDialog) {}

  items: Item[] = [
    {title:       'Thingamajig',
     description: 'it does something',
     image:       'assets/shop_images/box1.jpg',
     price:       500},
    {title:       'Foobar',
     description: 'it does something',
     image:       'assets/shop_images/box2.jpg',
     price:       500},
    {title:       'Placeholder',
     description: 'it does something',
     image:       'assets/shop_images/box3.jpg',
     price:       500},
    {title:       'Whocares',
     description: 'it does something',
     image:       'assets/shop_images/box4.jpg',
     price:       500},
  ];

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

  ngOnInit() {
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
