// import 'dart:async';

import 'package:cartrack/screens/signUpPage.dart';
import 'package:cartrack/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:cartrack/screens/homeScreen.dart';
import 'package:cartrack/screens/mainScreen.dart';
import 'package:cartrack/screens/myProfile.dart';
import 'package:cartrack/screens/signUpPage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // bool isSigned;
  // bool isSplashTimeout;

  // getDataFromSharedPrefs() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   bool is_signed = sharedPreferences.getBool("isSigned") ?? false;
  //   setState(() {
  //     if(is_signed){
  //       isSigned = true;
  //     }
  //   });

  // }

  // startTime() async {
  //     return new Timer(new Duration(seconds: 5), (){
  //       // setState(() {
  //       //   isSplashTimeout = true;
  //       // });
  //     }); // duration of splash to show
  // }

  // void navigationPage() {
  //   // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> isSigned == true ? MainScreen() : HomeScreen()));
  // }

  // @override
  // void initState() {
  //   // isSigned = false;
  //   // isSplashTimeout = false;
  //   // startTime();
  //   //  getDataFromSharedPrefs();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SupplyValid',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            // primaryColorDark: Color(0xff283643),
            fontFamily: 'Open Sans'
        ),
        home: SplashScreenPage()
        // Scaffold(
        //   backgroundColor: Colors.white,
        //   body: Container(
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         new Center(
        //           child: Text("Dashboard"),
        //           // child: new Image.asset('assets/images/splash.gif',fit: BoxFit.contain,),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
    );
  }
}
