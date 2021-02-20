import 'package:HeliosTest/Controller/PeopleController.dart';

import 'Pages/Details.dart';
import 'package:HeliosTest/Pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


void main() {
  PeopleController.reloadData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Helios Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChargeScreen(),
      routes: {
        'home': (context) => MyHomePage(title: "HeliosTest",primaryColor: Colors.blue,),
        'details': (context) => MyDetailsPage(title: "Details",primaryColor: Colors.purple)
      }
    );
  }
}

class ChargeScreen extends StatefulWidget {

  @override
  _ChargeScreenState createState() => _ChargeScreenState();
}

class _ChargeScreenState extends State<ChargeScreen> {

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new MyHomePage(title: "HeliosTest",primaryColor: Colors.green,),
      title: new Text(
        'Bienvenue sur helios test',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.white),
      ),
      image: new Image.network(
          'https://adn-co.news/uploads/images/2020/06/26/daa2d0d6485c5d49658f24b771f2e0db.jpeg',
      ),
      backgroundColor: Colors.green,
      loaderColor: Colors.white,
    );
  }
}
