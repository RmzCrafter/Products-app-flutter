import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:amazonmini/model/my_user.dart';

class MyFirestoreHelper{
  final cloudUtilisateurs = FirebaseFirestore.instance.collection("UTILISATEURS");
  final cloudProduits = FirebaseFirestore.instance.collection("PRODUITS");
  final auth = FirebaseAuth.instance;




  Future<MyUser>registerUser({required String email, required String password, required String name, required String lastName}) async {

    UserCredential credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    String uid = credential.user!.uid;
    Map<String,dynamic> datas = {
      "NOM":lastName,
      "PRENOM":name,
      "EMAIL":email
    };
    addUser(uid: uid, data: datas);
    return getUser(uid);



  }


  addUser({required String uid, required Map<String,dynamic> data}){
    cloudUtilisateurs.doc(uid).set(data);
  }

  Future<MyUser>connexion(String email,String password) async{
    UserCredential credential = await auth.signInWithEmailAndPassword(email: email,password: password);
    String uid = credential.user!.uid;
    return getUser(uid);

  }

  //recuperer un UTILISATEURS
  Future <MyUser>getUser(uid) async{
    DocumentSnapshot snapshot = await cloudUtilisateurs.doc(uid).get();
    return MyUser(snapshot);

  }

  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("Erreur de réinitialisation : $e");
      throw e;
    }
  }

  Future<void> updatePassword(String newPassword) async {
    try {
      await auth.currentUser?.updatePassword(newPassword);
    } catch (e) {
      print("Erreur de mise à jour : $e");
      throw e;
    }
  }

  Future<void> addToHistory(String productId) async {
    final user = auth.currentUser;
    if (user != null) {
      await cloudUtilisateurs.doc(user.uid).update({
        'PRODUITS': FieldValue.arrayUnion([productId])
      });
    }
  }









}