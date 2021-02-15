import 'package:HeliosTest/Controller/PeopleController.dart';
import 'package:HeliosTest/Model/People.dart';
import 'package:test/test.dart';


void main() {
  group('PeopleList', () {
    test('La taille de la liste doit être de 20', () async {

      await PeopleController.reloadData();
      await new Future.delayed(new Duration(seconds: 5));
      expect(PeopleController.allPeople.length, 20);
    });
  });
}