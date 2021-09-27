

import 'package:flutter/cupertino.dart'; //to use required keyword

class Productt {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final List<String> description;

  Productt({@required this.id,@required this.name,@required this.imageUrl,@required this.price,this.description});

}