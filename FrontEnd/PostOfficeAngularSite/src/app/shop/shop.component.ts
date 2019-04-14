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

  cartItems: CartItem[] = [{}];

  openCart(): void {
    const dialogRef = this.dialog.open(ShoppingCartDialog, {
      width: '600px',
      data: this.cartItems
    });

    dialogRef.afterClosed().subscribe(
      result => {console.log('The dialog was closed');});
  }

  addToCart(item: Item) {
    var foundIndex;
    let found = this.cartItems.some(
      (element, index) => {
        foundIndex = index;
        return element.item.title == item.title;
      });
    if (!found) {
      let itemToPutInCart: CartItem = {item: item, quantity: 1};
      this.cartItems.push(itemToPutInCart);
    } else {
      this.cartItems[foundIndex].quantity += 1;
    }
    console.log(this.cartItems)
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

  onNoClick(): void {
    this.dialogRef.close();
  }

}
