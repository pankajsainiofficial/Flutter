import 'package:flutter/material.dart';
import 'package:flutterapplication/models/cart.dart';
import 'package:flutterapplication/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      title: "Cart".text.make(),
      ),
        body: Column(
          children: [
            _CartList().p32().expand(),
            const Divider(),
            const _cardTotal(),
          ],
        )
    );

  }
}

class _cardTotal extends StatelessWidget {
  const _cardTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
              notifications: {},
              mutations: {RemoveMutation},
              builder: (context,_,__){
                return "\$${_cart.totalPrice}"
                    .text
                    .xl4
                    .color(context.theme.hintColor)
                    .make();
          }),
          30.widthBox,
           ElevatedButton(
             onPressed: (){
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                 content: "Buying Not Supported yet".text.make(),
               ));
             },
             style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all(context.theme.primaryColorDark)
             ),
             child: "Buy".text.color(Colors.white).make(),
           ).w32(context),
        ],

      ),
    );
  }
}
class _CartList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty? "Nothing in the cart".text.xl3.makeCentered() : ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context, index) =>ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () =>
            RemoveMutation(_cart.items[index])
          ,
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}

