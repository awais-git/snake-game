import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:snake_game/utils/enums.dart';
import 'package:snake_game/widgets/food.dart';
import 'package:snake_game/widgets/snake.box.dart';

import '../widgets/snake.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    snakeShape();
    snakeMoveTimePeriod();
  }

  int foodPositionIndex = 200;
  List<int> snakePosition = [];
  SnakePositions snakePositions = SnakePositions.right;

  //initialize the snake shape
  snakeShape() {
    for (int i = 0; i < 3; i++) {
      snakePosition.add(i);
    }
  }

  controllingTheSnakeMovingPosition() {
    if (snakePositions == SnakePositions.right) {
      if (snakePosition.last % 15 == 14) {
        snakePosition.add(snakePosition.last + 1 - 15);
      } else {
        snakePosition.add(snakePosition.last + 1);
      }
      snakePosition.remove(snakePosition.first);
    }

    setState(() {});
  }

  snakeMoveTimePeriod() {
    Timer.periodic(
      const Duration(seconds: 1),
      (time) {
        controllingTheSnakeMovingPosition();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 0) {
          log("Right swipe");
          snakePositions = SnakePositions.right;
        } else {
          log("left swipe");
        }

        setState(() {});
      },
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 0) {
          log("down swipe");
        } else {
          log("up swipe");
        }

        setState(() {});
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.black,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 330,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 2,
                            crossAxisCount: 15,
                            mainAxisSpacing: 2),
                    itemBuilder: (context, index) {
                      if (index == foodPositionIndex) {
                        return const Food();
                      } else if (snakePosition.contains(index)) {
                        return const Snake();
                      } else {
                        return const Boxes();
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
