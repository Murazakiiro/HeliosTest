import 'dart:convert';
import '../Model/People.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:http/http.dart' as http;

class PeopleController {

  static List allPeople = [];

  static Future _getPeopleAPI() async {


    //allPeople.clear();

    for (int i=0;i<20;i++) {

      http.Response json = await http.get("https://randomuser.me/api/");
      Map data = jsonDecode(json.body);
      Map results = data["results"][0];

      allPeople.add(new People(
        title: results["name"]["title"],
        prenom: results["name"]["last"],
        nom: results["name"]["first"],
        photo: results["picture"]["medium"],
        details: lipsum.createText()
      ));
    }
  }

  static Future reloadData() async {
    //await new Future.delayed(new Duration(seconds: 2));
    await _getPeopleAPI();
  }


  
}