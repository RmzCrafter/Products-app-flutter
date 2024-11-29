import 'package:flutter/material.dart';
import 'package:amazonmini/controller/my_custom_path.dart';

class MyBackground extends StatefulWidget {
  const MyBackground({super.key});

  @override
  State<MyBackground> createState() => _MyBackgroundState();
}

class _MyBackgroundState extends State<MyBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 241, 239, 243),
            Color.fromARGB(255, 243, 242, 247),
          ],
        ),
      ),
    );
  }
}
