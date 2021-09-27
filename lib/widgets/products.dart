import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/my_provider.dart';
import '../models/product.dart';
import '../screens/product_details.dart';

Widget buildProducts(BuildContext context){
  List<Productt> productList = Provider.of<MyProvider>(context).productList;
  return GridView.count(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisCount: 2,
    childAspectRatio: 2/2.2,
    crossAxisSpacing: 15,
    mainAxisSpacing: 25,
    children: productList.map((product) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> ProductDetails(product.id,product.name,product.imageUrl,product.description,product.price)));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight:Radius.circular(25))

          ),
          elevation: 15,
          shadowColor: Colors.red,
          child: Column(
            children: [
              Container(
                  height:150,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                      child: Image.asset(product.imageUrl,fit: BoxFit.fill,),

                  ),

              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(product.name,style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Text("\$${product.price}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)
                ],
              ),
            ],
          ),

        ),
      ),
    )).toList(),

  );
}