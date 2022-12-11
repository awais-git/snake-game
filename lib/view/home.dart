import 'dart:developer' as log;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake_game/utils/enums.dart';
import 'package:snake_game/widgets/food.dart';
import 'package:snake_game/widgets/snake.box.dart';

import '../controller/snake.controller.dart';
import '../widgets/snake.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final snakeController = Provider.of<SnakeController>(context, listen: true);

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 0) {
          log.log("Right swipe");
          snakeController.snakePositions = SnakePositions.right;
        } else {
          log.log("left swipe");
          snakeController.snakePositions = SnakePositions.left;
        }

        // setState(() {});
      },
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 0) {
          log.log("down swipe");

          snakeController.snakePositions = SnakePositions.down;
        } else {
          snakeController.snakePositions = SnakePositions.up;
          log.log("up swipe");
        }

        // setState(() {});
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 330,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 2,
                                crossAxisCount: 15,
                                mainAxisSpacing: 2),
                        itemBuilder: (context, index) {
                          if (index == snakeController.foodPositionIndex) {
                            return const Food();
                          } else if (snakeController.snakePosition
                              .contains(index)) {
                            return const Snake();
                          } else {
                            return const Boxes();
                          }
                        }),
                    const Spacer(),
                    Consumer<SnakeController>(
                      builder: (context, controller, child) {
                        return controller.gameStarted == true
                            ? const SizedBox.shrink()
                            : MaterialButton(
                                textColor: Colors.black,
                                color: Colors.white,
                                onPressed: () {
                                  controller. snakeMoveTimePeriod();
                                },
                                child: const Text("Start game"),
                              );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Score : ${snakeController.score}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
