import 'package:flutter/material.dart';

class Snake extends StatelessWidget {
  const Snake({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const CircleAvatar(
        backgroundColor: Colors.red,
      ),
    );
  }
}
