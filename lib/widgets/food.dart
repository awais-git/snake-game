import 'package:flutter/material.dart';

class Food extends StatelessWidget {
  const Food({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const CircleAvatar(
        backgroundColor: Colors.green,
      ),
    );
  }
}
