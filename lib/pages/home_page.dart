import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapplication/core/store.dart';
import 'package:flutterapplication/models/cart.dart';
import 'package:flutterapplication/models/products.dart';
import 'package:flutterapplication/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import '../widgets/home_widgets/catalog_Header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import '../widgets/themes.dart';
import 'package:http/http.dart' as http;


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String disp = "";

  final int dart = 50;

  final String str = "MR. ANONYMOUS";
  final url ="https://api.jsonbin.io/v3/b/6482e69db89b1e2299ac3743/";

  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async {
    await Future.delayed(Duration(seconds: 3));
    // var catalogJson = await rootBundle.loadString("assets/files/products.json");

    var response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    print(catalogJson);
    var decodedData = jsonDecode(catalogJson);
    var productData = decodedData["record"]["products"]["phones"];

    CatalogModel.items = List.from(productData).map<Item>((item)=> Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.cardColor,

      floatingActionButton: VxBuilder(
        mutations: {AddMutation,RemoveMutation},
        builder:(ctx, _,__) =>FloatingActionButton(
          onPressed: ()=> Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: MyTheme.darkCreamColor,
          child: Icon(CupertinoIcons.cart,color: Colors.white,),
        ).badge(color: Vx.red500, size: 22, count: _cart.items.length,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          )
        ),
      ),
      body:  SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              catalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}






