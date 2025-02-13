import 'package:flutter/material.dart';
import 'package:amazonmini/model/my_produit.dart';
import 'package:amazonmini/view/my_background.dart';
import 'package:amazonmini/controller/my_firestore_helper.dart';

class MyDetailProduct extends StatefulWidget {
  MyProduct product;
  MyDetailProduct({super.key, required this.product});

  @override
  State<MyDetailProduct> createState() => _MyDetailProductState();
}

class _MyDetailProductState extends State<MyDetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.product.nom,
          style:
              const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: widget.product.nom,
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ],
                    image: DecorationImage(
                      image: NetworkImage(widget.product.photos[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.product.desc,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Prix : ${widget.product.prix} €",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Ajouter à l'historique des achats
                  MyFirestoreHelper().addToHistory(widget.product.uid);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Produit ajouté avec succès !"))
                  );
                },
                child: const Text(
                  "Acheter",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
