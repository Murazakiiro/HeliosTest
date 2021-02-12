import 'dart:convert';

import 'package:HeliosTest/Model/People.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PeopleController {

  List allPeople = [];

  Future _getPeopleDart() async {


    this.allPeople.clear();

    for (var i=0;i<20;i++) {

      var json = await http.get("https://randomuser.me/api/");
      var data = jsonDecode(json.body);
      var results = data["results"][0];

      this.allPeople.add(new People(
        title: results["name"]["title"],
        nom: results["name"]["first"],
        prenom: results["name"]["last"],
        photo: results["picture"]["medium"]
      ));
    }

    print(this.allPeople.length);
  }

  Future reloadData() async {
    //await new Future.delayed(new Duration(seconds: 2));
    await this._getPeopleDart();
  }


  
}