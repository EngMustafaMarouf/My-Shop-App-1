import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/my_provider.dart';
import 'favorites.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetails extends StatefulWidget {
  final String productId;
  final String productName;
  final String productImageUrl;
  final List<String> productDescription;
  final double productPrice;
  const ProductDetails(this.productId,this.productName,this.productImageUrl,this.productDescription,this.productPrice);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<MyProvider>(context).backColor,
      appBar: AppBar(
        title: Text(widget.productName,style: TextStyle(color: Provider.of<MyProvider>(context).backColor == Colors.white?Colors.black:Colors.white),),
        backgroundColor: Provider.of<MyProvider>(context).backColor ,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.asset(widget.productImageUrl,fit: BoxFit.fill,),
            ),
            Text("Description",
              style: TextStyle(color: Provider.of<MyProvider>(context).backColor == Colors.white?Colors.black:Colors.white,fontSize: 35,fontFamily: 'Belinda_Heylove',fontWeight: FontWeight.bold),),
            Container(
              height: 500,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Provider.of<MyProvider>(context).backColor == Colors.white?Colors.black:Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children:widget.productDescription.map((str) => Card(
                  elevation: 10,
                  color: Colors.orange,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(str,style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Provider.of<MyProvider>(context,).isFavorite(widget.productId)?Icons.favorite:Icons.favorite_border,color: Provider.of<MyProvider>(context,).isFavorite(widget.productId)?Colors.red:null,),
        onPressed:()=>Provider.of<MyProvider>(context,listen: false).add_Or_remove_FavoriteProduct(widget.productId),
      ),
    );
  }
}
