import 'package:flutter/material.dart';

import '../models/products.dart';

class itemWidget extends StatelessWidget {
  final Item item;

  const itemWidget({super.key, required this.item}) ;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
          debugPrint("${item.name} pressed");
        },
        leading: Image.network(item.imageUrl),
        title: Text(item.name),
        subtitle: Text(item.date),
        trailing: Text("\$${item.price}",
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}
