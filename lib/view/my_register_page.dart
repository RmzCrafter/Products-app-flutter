import 'package:flutter/material.dart';
import 'package:amazonmini/controller/constante.dart';
import 'package:amazonmini/controller/my_firestore_helper.dart';
import 'package:amazonmini/view/home_page.dart';

class MyRegisterView extends StatefulWidget {
  const MyRegisterView({super.key});

  @override
  State<MyRegisterView> createState() => _MyRegisterView();
}

class _MyRegisterView extends State<MyRegisterView> {
  //variable
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();

  //méthode
  popUp() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            title: const Text("Message erreur"),
            content: const Text("Il y a une erreur lors de votre saisie"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("ok")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: nom,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person),
            hintText: "Entrer votre prénom",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),

      TextField(
        controller: prenom,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person),
            hintText: "Entrer votre nom",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),

      //champs adresse Mail

      TextField(
        controller: mail,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.mail),
            hintText: "Entrer votre adresse mail",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),

      const SizedBox(
        height: 10,
      ),

      //champs de mot de passe
      TextField(
        controller: password,
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            hintText: "Entrer votre mot de passe",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),

      const SizedBox(
        height: 10,
      ),

      //bouton connexion
      ElevatedButton(
        child: const Text("Connexion"),
        onPressed: () {
          print("Je suis connecté");

          MyFirestoreHelper()
              .registerUser(
                  password: password.text,
                  email: mail.text,
                  lastName: nom.text,
                  name: prenom.text)
              .then((onValue) {
            setState(() {
              me = onValue;
            });

            print(me.mail);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomePage()));
          }).catchError((onError) {
            popUp();
          });
        },
      ),
    ]);
  }
}
