import 'package:flutter/material.dart';

class Food extends StatelessWidget {
  const Food({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: CircleAvatar(
        backgroundColor: Colors.green,
      ),
    );
  }
}
