import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/my_provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/product_details.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    List<Productt> favoritesList = Provider.of<MyProvider>(context).favoritesList;
    return Scaffold(
      backgroundColor: Provider.of<MyProvider>(context).backColor,
      appBar: AppBar(
        title: Text("Your Favorites",style: TextStyle(color: Provider.of<MyProvider>(context).backColor == Colors.white?Colors.black:Colors.white),),
        backgroundColor: Provider.of<MyProvider>(context).backColor,
      ),
      body: favoritesList.isEmpty?Center(child: Text("No Favorites added yet!",style: TextStyle(color: Provider.of<MyProvider>(context).backColor == Colors.white?Colors.black:Colors.white,fontWeight: FontWeight.bold,fontSize: 23),)):SingleChildScrollView(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children:favoritesList.map((product) => Column(
            children: [
              InkWell(
                onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> ProductDetails(product.id,product.name,product.imageUrl,product.description,product.price))),
                child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height:230,
                          width: double.infinity,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                              child: Image.asset(product.imageUrl,fit: BoxFit.fill,)),
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(product.name,style: TextStyle(fontSize: 25),),
                            SizedBox(width: 20,),
                            Text("\$ ${product.price}",style: TextStyle(fontSize: 25,color: Colors.red),)
                          ],
                        ),
                      ],
                    )),
              ),

            ],
          )).toList(),
        ),
      ),

    );
  }
}
