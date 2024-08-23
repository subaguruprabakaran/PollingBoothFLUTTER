import 'package:flutter/material.dart';
import 'package:untitled3/test%20gtpoll/color10.dart';
class dym extends StatefulWidget {
  const dym({super.key});

  @override
  State<dym> createState() => _dymState();
}

class _dymState extends State<dym> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bac,
      body: Column(
        children: [
          Icon(Icons.poll,color: Colors.white,)
        ],
      ),
    );
  }
}
