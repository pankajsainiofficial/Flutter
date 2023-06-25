import 'package:flutterapplication/core/store.dart';
import 'package:flutterapplication/models/products.dart';
import 'package:velocity_x/velocity_x.dart';
class CartModel{


  //Catelog Fields --- collection of ids --- store ids of each items.
  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  // getter for catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    assert(newCatalog!= null);
    _catalog = newCatalog;
  }

  // get items in the cart

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price of the items

  num get totalPrice => 
      items.fold(0, (total, current) => total + current.price);



}

class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}
class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}