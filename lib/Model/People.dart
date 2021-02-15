

class People {

  String title;
  String nom;
  String prenom;
  String photo;
  String details;


  People({Key,this.title,this.nom,this.prenom,this.photo,this.details}){
    this.photo=this.photo??"https://www.helios.do/assets/images/slider/3.jpg";
    this.nom=this.nom??"Non renseignée";
    this.prenom=this.prenom??"Non renseignée";
    this.title=this.title??"Non renseignée";
    this.details=this.details??"Non renseignée";
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