import 'package:flutter/material.dart';
import 'package:pollibg_booth/sprint1/color.dart';
class sam extends StatefulWidget {
  const sam({super.key});

  @override
  State<sam> createState() => _samState();
}

class _samState extends State<sam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.poll,size: 70,color: Colors.white,)
        ],
      ),
    );
  }
}

