import 'package:flutter/material.dart';

class Boxes extends StatelessWidget {
  const Boxes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(8)),
    );
  }
}
