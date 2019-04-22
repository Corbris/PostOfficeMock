import { Component, OnInit, ViewChild, Inject } from '@angular/core';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { APIService } from '../_services/api.service';
import { MatSnackBar } from '@angular/material';
import { Router, RouterEvent, NavigationStart, NavigationEnd, NavigationError, NavigationCancel, RoutesRecognized } from '@angular/router';
import { of, from } from 'rxjs';
import { tap, map, filter } from 'rxjs/operators';
import { first } from 'rxjs/operators';

export interface Item {
  title: string;
  ID: string;
  description: string;
  image: string;
  price: number;
}

export interface CartItem {
  item: Item;
  quantity: number;
}

export var cartItems: CartItem[] = [];

export function sealCart() {
  let id = sessionStorage.getItem('ID');
  let table = {id: id, cartItems: cartItems};

  if (localStorage.getItem('carts')) {
    var carts = JSON.parse(localStorage.getItem('carts'));
    var found = false;
    for (var i in carts) {
      if (carts[i].id == id) {
        carts[i].cartItems = cartItems;
        found = true;
        break;
      }
    }

    if (!found) {
      carts.push(table);
    }

    localStorage.setItem('carts', JSON.stringify(carts));


  } else {
    localStorage.setItem('carts', JSON.stringify([table]));
  }
}

export function unsealCart(): CartItem[] {
  let id = sessionStorage.getItem('ID');
  if (localStorage.getItem('carts')) {
    console.log('attempting unseal of carts');
    var carts = JSON.parse(localStorage.getItem('carts'));
    for (var i in carts) {
      if (carts[i].id == id) {
        cartItems = carts[i].cartItems;
        return cartItems;
      }
    }
  } else {
    console.log('no carts to unseal');
  }

  cartItems = [];
  return cartItems;
}

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
    unsealCart();
    this.api.shopProducts()
      .subscribe((res) => {
        for (var x in res) {
          this.items.push(
            {
              title: res[x].ProductName,
              ID: res[x].ProductID,
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
    sealCart();
  }

}

@Component({
  selector: 'shopping-cart-dialog',
  templateUrl: './shopping-cart-dialog.html',
  styleUrls: ['./shop.component.css']
})
export class ShoppingCartDialog implements OnInit {
  constructor(
    public dialogRef: MatDialogRef<ShoppingCartDialog>,
    @Inject(MAT_DIALOG_DATA) public data: CartItem[],
    private router: Router) {}

  ngOnInit() {
    // this.router.events.pipe(
    //   filter((event: RouterEvent) => event instanceof NavigationStart),
    //   tap(() => this.dialogRef.close())
    // ).subscribe();
    // this._routerSubscription = this._router.events
    //   .pipe(
    //     filter((event: RouterEvent) => event instanceof NavigationStart),
    //     filter(() => !!this.dialogRef)
    //   )
    //   .subscribe(() => {
    //     this.dialogRef.close();
    //   });
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

  inc(i: CartItem) {
    var foundIndex = -1;
    let found = cartItems.some(
      (element, index) => {
        foundIndex = index;
        return element.item.title == i.item.title;
      });
    cartItems[foundIndex].quantity += 1;
    sealCart();
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
    sealCart();
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

  navigateToCheckout(event) {
    // this.dialogRef.afterClosed.pipe(
    //   tap(() => this.router.navigate(['checkout'])),
    //   first()
    // ).subscribe();
    this.dialogRef.close();
    this.router.navigate(['checkout']);
  }
}
