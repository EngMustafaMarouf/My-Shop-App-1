import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/my_provider.dart';

Widget buildCarousel(BuildContext ctx) {
  List<String> imgList = Provider.of<MyProvider>(ctx).imgList;
  return ListView(
    children: [
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Products",style:TextStyle(fontSize: 25,fontWeight:FontWeight.bold,color:Provider.of<MyProvider>(ctx).backColor == Colors.white?Colors.black:Colors.white),textAlign: TextAlign.center,),
          InkWell(
              onTap:()=>Provider.of<MyProvider>(ctx,listen: false).changeColor(),
              child: Icon(Icons.wb_sunny,color:Provider.of<MyProvider>(ctx).backColor == Colors.white?Colors.black:Colors.white,size: 30,)),
        ],
      ),

      SizedBox(height: 10,),
      CarouselSlider(
          items: imgList
              .map((imgUrl) => Container(
                    width: double.infinity,
                    child: ClipRRect(
                      child: Image.asset(imgUrl,fit: BoxFit.fill,),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            onPageChanged: (val, _) {
              Provider.of<MyProvider>(ctx, listen: false).currentIndex = val;
            },
            initialPage: 0,
            height: 186,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayInterval: Duration(seconds: 2),
          )),
    ],
  );
}
