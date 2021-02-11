import 'dart:convert';

import 'package:HeliosTest/object/people.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Services {

  static List<People> lesGens;


  Services() {
    _charge();
  }

  Future<List<People>> _getPeopleDart(int nbPersone) async{
    Map result;
    Map data;
    http.Response json;
    List<People> lesGens = new List();

    for (var i = 0 ;i<nbPersone;i++){
      json = await http.get("https://randomuser.me/api/");
      result = jsonDecode(json.body);
      data = result["results"][0];

      lesGens.add(new People(
          age: data["registered"]["age"],
          email: data["email"],
          title: data["name"]["title"],
          nom: data["name"]["last"],
          prenom: data["name"]["first"],
          phone: data["phone"]
      ));
    }
    
    return lesGens;

  }

  _charge() async {
    lesGens = await _getPeopleDart(20);
  }
  
}