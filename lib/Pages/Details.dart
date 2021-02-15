
import 'dart:ui';

import '../Controller/PeopleController.dart';
import '../Model/People.dart';
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
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(widget.people.photo),
                        radius: 50,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Text(widget.people.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20
                        ),
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
