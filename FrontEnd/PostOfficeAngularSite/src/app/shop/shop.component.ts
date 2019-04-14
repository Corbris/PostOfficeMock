import { Component, OnInit, ViewChild, Inject } from '@angular/core';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';

export interface DialogData {
  animal: string;
  name: string;
}

export interface Item {
  title: string;
  description: string;
  image: string;
  price: string;
}

@Component({
  selector: 'app-shop',
  templateUrl: './shop.component.html',
  styleUrls: ['./shop.component.css']
})
export class ShopComponent implements OnInit {
  constructor(public dialog: MatDialog) {}

  openCart(): void {
    const dialogRef = this.dialog.open(ShoppingCartDialog, {
      width: '250px',
      data: {name: "john", animal: "cat"}
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
    });
  }

  ngOnInit() {
  }

  items: Item[] = [
    {title:       'Thingamajig',
     description: 'it does something',
     image:       'assets/shop_images/box1.jpg',
     price:       '$500'},
    {title:       'Foobar',
     description: 'it does something',
     image:       'assets/shop_images/box2.jpg',
     price:       '$500'},
    {title:       'Placeholder',
     description: 'it does something',
     image:       'assets/shop_images/box3.jpg',
     price:       '$500'},
    {title:       'Whocares',
     description: 'it does something',
     image:       'assets/shop_images/box4.jpg',
     price:       '$500'},
  ];

}

@Component({
  selector: 'shopping-cart-dialog',
  templateUrl: './shopping-cart-dialog.html',
})
export class ShoppingCartDialog {

  constructor(
    public dialogRef: MatDialogRef<ShoppingCartDialog>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData) {}

  onNoClick(): void {
    this.dialogRef.close();
  }

}
