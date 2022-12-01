import 'package:flutter/material.dart';

class Boxes extends StatelessWidget {
  final int index;
  const Boxes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      child: Text(index.toString() ,style: const TextStyle(color: Colors.black),),
    );
  }
}
