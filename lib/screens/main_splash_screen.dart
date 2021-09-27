import 'package:flutter/material.dart';
import 'package:shop_app/screens/tab_screens.dart';
import 'package:splashscreen/splashscreen.dart';

import '../main.dart';

class MainSplashScreen extends StatefulWidget {
  @override
  State<MainSplashScreen> createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(
          backgroundColor: Colors.orange.withOpacity(0.7),
          image: Image.asset("assets/images/splash.jpg",),
          photoSize: 170,
          title: const Text("Welcome!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          seconds: 3,
          loaderColor: Colors.green,
          loadingText: const Text("waiting...",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          navigateAfterSeconds: TabScreen(),
        ),
      ),
    );
  }
}
