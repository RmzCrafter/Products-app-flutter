import 'package:cloud_firestore/cloud_firestore.dart';
class MyProduct{
  late String uid;
  late String nom;
  late String desc;
  late List photos;
  late int prix;


  MyProduct(DocumentSnapshot snapshot){
    uid = snapshot.id;
    Map<String,dynamic> datas = snapshot.data() as Map<String,dynamic>;
    nom = datas["NOM"];
    desc = datas["DESC"];
    photos = datas["PHOTOS"];
    double prixProvisoire = datas["PRIX"];
    prix = prixProvisoire.toInt();

  }

}