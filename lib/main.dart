import 'package:flutter/material.dart';
import 'package:flutterapplication/core/store.dart';
import 'package:flutterapplication/pages/cart_page.dart';
import 'package:flutterapplication/pages/loginpage.dart';
import 'package:flutterapplication/utils/routes.dart';
import 'package:flutterapplication/widgets/themes.dart';
import 'pages/home_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'dart:ui';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),


      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context)=> LoginPage(),
        MyRoutes.cartRoute: (context)=> CartPage(),
      },
    );
  }
}
