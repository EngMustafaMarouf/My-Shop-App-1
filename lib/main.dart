import 'package:flutter/material.dart';
import 'package:shop_app/widgets/products.dart';
import './screens/main_splash_screen.dart';
import 'Providers/my_provider.dart';
import 'screens/page_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/image_slider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var decision = prefs.getBool('x');
  prefs.setBool('color', true);   //used in product details screen
  Widget screen;
  screen = (decision == false || decision == null)?MainPageView():MainSplashScreen();


  runApp(ChangeNotifierProvider(create:(_)=>MyProvider(),child: screen));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Provider.of<MyProvider>(context).backColor,
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            children: [
              Container(
                height: 270,
                  child: buildCarousel(context),
              ),
              Divider(color: Colors.white,),
              buildProducts(context),


            ],
          ),
      ),

    );
  }
}
