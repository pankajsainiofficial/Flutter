import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapplication/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/products.dart';
import '../../widgets/themes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    // super.key,
    required this.catalog,
  });


  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if(!isInCart){
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkCreamColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
