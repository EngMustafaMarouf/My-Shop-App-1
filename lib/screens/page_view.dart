import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/my_provider.dart';
import 'package:shop_app/models/page_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_splash_screen.dart';

class MainPageView extends StatefulWidget {
  @override
  _MainPageViewState createState() => _MainPageViewState();
}

int currentIndex = 0;
class _MainPageViewState extends State<MainPageView> {
  PageController _controller = PageController(initialPage: 0);


  @override
  Widget build(BuildContext context) {
    List<PageData> pageList = context.read<MyProvider>().pageList;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            //page view
            Builder(
              builder: (ctx) {
                return PageView(
                  controller: _controller,
                  children: pageList.map((page) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(page.imageUrl),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(color:Colors.black.withOpacity(0.7),child: Text(page.title,style: TextStyle(fontSize: 20,color: Colors.white),)),
                        Container(color:Colors.black.withOpacity(0.7),child: Text(page.description,style: TextStyle(fontSize: 20,color: Colors.white,overflow: TextOverflow.ellipsis),maxLines: 2,)),
                      ],
                    ),

                  )).toList(),

                  onPageChanged: (val){
                    setState(() {
                      currentIndex = val;
                      //if(currentIndex == 3){

                     // }
                    });
                  },
                );
              }
            ),
            //indicator
            Indicator(),
            if(currentIndex == pageList.length-1)
              Builder(
                builder: (ctx) {
                  return Align(
                    alignment: Alignment(0,0.6),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.orange,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 40),
                        child: Text("Start",style: TextStyle(fontSize: 23),),
                      ),
                      onPressed: ()async{

                          Future.delayed(Duration(seconds: 2),()=>Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>MainSplashScreen()), (route) => false)); //false mean that you can not return to pageview
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool('x', true);


                      },),
                  );
                }
              )
          ],
        ),
      ),
    );
  }
}



Widget Indicator(){

  return Align(
    alignment: Alignment(0,0.8),
    child: Container(
      height: 50,
      width: 150,
      color: Colors.black54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildCircleAvatar(currentIndex == 0?Colors.green:Colors.red),
          buildCircleAvatar(currentIndex == 1?Colors.green:Colors.red),
          buildCircleAvatar(currentIndex == 2?Colors.green:Colors.red),
          buildCircleAvatar(currentIndex == 3?Colors.green:Colors.red),
        ],
      ),
    ),
  );

}

Padding buildCircleAvatar(Color color){
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: CircleAvatar(
      radius: 8.0,
      backgroundColor: color,
    ),
  );
}