
import 'dart:ui';

import 'package:HeliosTest/Controller/PeopleController.dart';
import 'package:HeliosTest/Model/People.dart';
import 'package:flutter/material.dart';



class MyDetailsPage extends StatefulWidget {
  MyDetailsPage({Key key, this.title,this.primaryColor,this.people}) : super(key: key);

  final People people;
  final String title;
  final Color primaryColor;

  @override
  _MyDetailsPageState createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {

  PeopleController controller = new PeopleController();
  bool isLoading = true;
  List<People> peoples = [];

  @override
  void initState() {
    _reload();
    super.initState();
  }

  Future _reload() async {

    //await new Future.delayed(new Duration(seconds: 2));
    await controller.reloadData();

    setState(() {
      peoples.addAll(controller.allPeople.cast());
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: widget.primaryColor,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.people.photo),
                      radius: 50,

                    ),
                    Text(widget.people.toString(),
                      style: TextStyle(
                          fontSize: 30
                      ),
                    )
                  ],
                )
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(widget.people.details),
              ),
            ),

          ],
        ),
      )
    );
  }
}
