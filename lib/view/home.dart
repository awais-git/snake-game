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
    //MOVE THE SNAKE TO THE RIGHT
    if (snakePositions == SnakePositions.right) {
      if (snakePosition.last % 15 == 14) {
        snakePosition.add(snakePosition.last + 1 - 15);
      } else {
        snakePosition.add(snakePosition.last + 1);
      }
      snakePosition.remove(snakePosition.first);
    }

    //MOVE THE SNAKE TO THE DOWN
    else if (snakePositions == SnakePositions.down) {
      if (snakePosition.last > 315) {
        snakePosition.add(snakePosition.last - 314);
      } else {
        snakePosition.add(snakePosition.last + 15);
      }
      snakePosition.remove(snakePosition.first);
    }

    //MOVE THE SNAKE POSITION TO LEFT
    else if (snakePositions == SnakePositions.left) {
      if (snakePosition.last % 15 == 0) {
        snakePosition.add(snakePosition.last + 14);
      } else {
        snakePosition.add(snakePosition.last - 1);
      }
      snakePosition.remove(snakePosition.first);
    }

    // MOVE THE SANKE TO UPWARD DIRECTION
    else {
      if (snakePosition.last < 14) {
        snakePosition.add(snakePosition.last + 315);
      } else {
        snakePosition.add(snakePosition.last - 15);
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
          snakePositions = SnakePositions.left;
        }

        setState(() {});
      },
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 0) {
          log("down swipe");

          snakePositions = SnakePositions.down;
        } else {
          snakePositions = SnakePositions.up;
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
                        return Boxes(
                          index: index,
                        );
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
