import 'package:flutter/material.dart';
import 'package:amazonmini/controller/my_firestore_helper.dart';
import 'package:amazonmini/controller/constante.dart';
import 'package:amazonmini/view/home_page.dart';

class MyLoginView extends StatefulWidget {
  const MyLoginView({super.key});

  @override
  State<MyLoginView> createState() => _MyLoginView();
}

class _MyLoginView extends State<MyLoginView> {
  //variable
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();



  //méthode
  popUp(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context)
        {
          return  AlertDialog.adaptive(
            title:  const Text("Message erreur"),
            content:  const Text("Il y a une erreur lors de votre saisie"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("ok")
              ),
            ],

          );
        }


    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[







        //champs adresse Mail


          TextField(
            controller: mail,
            decoration: InputDecoration(
                prefixIcon:const Icon(Icons.mail),
                hintText: "Entrer votre adresse mail",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),

        const SizedBox(height: 10,),


        //champs de mot de passe
        TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon:const Icon(Icons.lock),
                hintText: "Entrer votre mot de passe",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),

        const SizedBox(height: 10,),


        //bouton connexion
        ElevatedButton(
            child: const Text("Connexion"),
            onPressed: (){
              print("Je suis connecté");

              MyFirestoreHelper().connexion(mail.text, password.text).then((onValue){
                setState((){
                  me = onValue;
                });

                print(me.mail);
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const HomePage()
                  )
                );
              }).catchError((onError){
                popUp();
              });


            },
          ),



      ]

    );
  }
}