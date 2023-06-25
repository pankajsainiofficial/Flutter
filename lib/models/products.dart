class CatalogModel{

  static List<Item> items=[];

  //get item by id

  Item getById(int id)=>
      items.firstWhere((element) => element.id == id, orElse: null);

  //get item by position

  Item getByPosition (int pos)=>items[pos];

}

class Item{
  final int id;
  final String date;
  final String name;
  final num price;
  final String imageUrl;

  Item({required this.id, required this.date, required this.name, required this.price, required this.imageUrl});

  factory Item.fromMap(Map<String, dynamic> map){
    return Item(
      id: map["id"],
      date: map["date"],
      name: map["name"],
      price: map["price"],
      imageUrl: map["imageUrl"]
    );
  }

  toMap()=>{
    "id" : id,
    "date" : date,
    "name" : name,
    "price" : price,
    "imageUrl" : imageUrl,
  };

}