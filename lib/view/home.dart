import 'package:flutter/material.dart';
import 'package:snake_game/widgets/snake.box.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                itemCount: 330,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 2,
                    crossAxisCount: 15,
                    mainAxisSpacing: 2),
                itemBuilder: (context, index) {
                  
                  return const Boxes(
                    
                  );
                }),
          ),
        ],
      ),
    );
  }
}
