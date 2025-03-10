import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:amazonmini/view/my_background.dart';
import 'package:amazonmini/view/my_login_page.dart';
import 'package:amazonmini/view/my_register_page.dart';
import 'package:amazonmini/view/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AmazonMini',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Products app'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //variable
  int counter = 0;

  //méthode
  Widget choice() {
    switch (counter) {
      case 0:
        return const MyLoginView();
      case 1:
        return const MyRegisterView();
      default:
        return const Text("Erreur");
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Colors.transparent,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Products app"),
          elevation: 0,
          actions: [
            TextButton(
                child: const Text(
                  "Inscription",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    counter = 1;
                  });
                }),
            TextButton(
                child: const Text(
                  "Connexion",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    counter = 0;
                  });
                }),
          ]),
      extendBodyBehindAppBar: true,

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Stack(
          children: [
            const MyBackground(),
            Column(
              children: [
                const Spacer(),
                Center(
                  child: choice(),
                ),
                const Spacer()
              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
