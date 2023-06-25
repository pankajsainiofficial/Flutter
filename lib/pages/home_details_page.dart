import 'package:flutter/material.dart';
import 'package:flutterapplication/widgets/home_widgets/add_to_cart.dart';
import 'package:flutterapplication/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/products.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog,).wh(130, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.imageUrl))
                .h32(context),
            Expanded(
                child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(context.accentColor)
                              .bold
                              .make(),
                          catalog.date.text
                              .textStyle(context.captionStyle)
                              .xl
                              .make(),
                          10.heightBox,
                          "Use the factory keyword when implementing a constructor that doesn’t always create a new instance of its class. For example, a factory constructor might return an instance from a cache, or it might return an instance of a subtype. Another use case for factory constructors is initializing a final variable using logic that can’t be handled in the initializer list."
                              .text
                              .textStyle(context.captionStyle)
                              .make().p16(),
                        ],
                      ).py64(),
                    ))),
          ],
        ),
      ),
    );
  }
}
