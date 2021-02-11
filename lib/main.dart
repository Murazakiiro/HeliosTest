import 'package:HeliosTest/Controller/PeopleController.dart';
import 'package:HeliosTest/MyNextPage.dart';
import 'package:HeliosTest/MyPreviousPage.dart';
import 'package:HeliosTest/object/people.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Helios Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'HeliosTest',primaryColor: Colors.blue),
      routes: {
        'home': (context) => MyHomePage(title: "HeliosTest",primaryColor: Colors.red,),
        'next': (context) => MyNextPage(title: "HeliosTest",primaryColor: Colors.blue,),
        'previous': (context) => MyPreviousPage(title: "HeliosTest",primaryColor: Colors.purple,),

      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,this.primaryColor}) : super(key: key);


  final String title;
  final Color primaryColor;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState(){
    super.initState();
    new Services();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.primaryColor,
        title: Text(widget.title),
      ),
      body: NotificationListener<ScrollEndNotification>(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context,index){
            return new Card(
              child: ListTile(
                title: Text(
                    Services.lesGens[index].prenom
                ),
              ),
            );
          },
        ),
        onNotification: (notification) {
          int value = notification.metrics.pixels.hashCode;
          if (value==586){
            Navigator.pushNamed(context, 'next');
          }else if (value==0){
            Navigator.pushNamed(context, 'previous');
          }
          return true;
        },
      )
    );
  }
}
