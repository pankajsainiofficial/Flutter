import 'package:flutterapplication/models/cart.dart';
import 'package:flutterapplication/models/products.dart';
import 'package:velocity_x/velocity_x.dart';



class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
