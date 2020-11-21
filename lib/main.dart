import 'package:flutter/material.dart';
import 'package:mobtech/data/proveone.dart';
import 'package:mobtech/pages/categories.dart';
import 'package:mobtech/pages/choosecountry.dart';
import 'package:mobtech/pages/mobiledetails.dart';
import 'package:mobtech/pages/post.dart';
import 'package:mobtech/pages/smasung.dart';
import 'package:mobtech/pages/test.dart';
import './pages/login.dart';
// import 'package:mobtech/pages/test.dart';
import './pages/home.dart';
import './provider/provglobal.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return ProvGlobal();
        }),
        ChangeNotifierProvider(create: (context) {
          return ProvOne();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // Start
        title: "Mobtech",
        theme: ThemeData(fontFamily: 'Cairo'),
        home: Home(),
        routes: {
          'categories': (context) {
            return Categories();
          },
          'homepage': (context) {
            return Home();
          },
          "samsung": (context) {
            return Samsung();
          },
          "choosecountry": (context) {
            return ChooseCountry();
          },
          "login": (context) {
            return LogIn();
          },
          "post": (context) {
            return Post();
          }
        },
        // End
      ),
    );
  }
}

/*
MaterialApp(
      debugShowCheckedModeBanner: false,
      // Start
      title: "Mobtech",
      theme: ThemeData(fontFamily:'Cairo'  ),
        home: ChooseCountry(),
      routes: {
        
        'categories' : (context) {
          return Categories() ; 
        }  ,
        'homepage' : (context) {
          return Home() ; 
        } ,
        "samsung" : (context) {
          return Samsung() ; 
        },
        "choosecountry" : (context) {
          return ChooseCountry() ; 
        }
    
        
      },
      // End
    )
    */
