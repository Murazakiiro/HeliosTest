import 'package:lipsum/lipsum.dart' as lipsum;

class People {

  String title;
  String nom;
  String prenom;
  String photo;
  String details;


  People({Key,this.title,this.nom,this.prenom,this.photo}){
    this.details= lipsum.createText();
  }

  @override
  String toString() {
    StringBuffer sb = new StringBuffer();

    sb.write(this.title);
    sb.write(" ");
    sb.write(this.nom);
    sb.write(" ");
    sb.write(this.prenom);

    return sb.toString();
  }
}