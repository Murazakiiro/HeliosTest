import 'package:HeliosTest/Controller/PeopleController.dart';
import 'package:HeliosTest/object/people.dart';
import 'package:flutter/material.dart';

class MyPreviousPage extends StatefulWidget {
  MyPreviousPage({Key key, this.title,this.primaryColor}) : super(key: key);


  final String title;
  final Color primaryColor;

  @override
  _MyPreviousPageState createState() => _MyPreviousPageState();
}

class _MyPreviousPageState extends State<MyPreviousPage> {

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
              Navigator.pushNamed(context, "home");
            }else if (value==0){
              Navigator.pushNamed(context, "next");
            }
            return true;
          },
        )
    );
  }
}
