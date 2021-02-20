import 'dart:convert';
import '../Model/People.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:http/http.dart' as http;

class PeopleController {

  static List allPeople = [];

  static Future _getPeopleAPI() async {


    //allPeople.clear();

    http.Response json = await http.get("https://randomuser.me/api/?results=20");
    Map data = jsonDecode(json.body);
    List results = data["results"];


    results.forEach((result) {
      allPeople.add(new People(
          title: result["name"]["title"],
          prenom: result["name"]["last"],
          nom: result["name"]["first"],
          photo: result["picture"]["medium"],
          details: lipsum.createText()
      ));
    });
  }

  static Future reloadData() async {
    //await new Future.delayed(new Duration(seconds: 2));
    await _getPeopleAPI();
  }


  
}