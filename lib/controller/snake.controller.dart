import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/enums.dart';

class SnakeController extends ChangeNotifier {
  SnakeController() {
    snakeShape();
   
  }

  int foodPositionIndex = Random().nextInt(329);
  List<int> snakePosition = [];
  SnakePositions snakePositions = SnakePositions.right;
  int score = 0;

  bool gameStarted = false;
  Duration timeDuration = const Duration(milliseconds: 400);

//initialize the snake shape
  snakeShape() {
    for (int i = 0; i < 3; i++) {
      snakePosition.add(i);
    }
  }

  void onEatFood() {
    score++;
    while (snakePosition.contains(foodPositionIndex)) {
      foodPositionIndex = Random().nextInt(329);
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
    }

    //MOVE THE SNAKE TO THE DOWN
    else if (snakePositions == SnakePositions.down) {
      if (snakePosition.last > 315) {
        snakePosition.add(snakePosition.last - 314);
      } else {
        snakePosition.add(snakePosition.last + 15);
      }
    }

    //MOVE THE SNAKE POSITION TO LEFT
    else if (snakePositions == SnakePositions.left) {
      if (snakePosition.last % 15 == 0) {
        snakePosition.add(snakePosition.last + 14);
      } else {
        snakePosition.add(snakePosition.last - 1);
      }
    }

    // MOVE THE SANKE TO UPWARD DIRECTION
    else if (snakePositions == SnakePositions.up) {
      if (snakePosition.last < 14) {
        snakePosition.add(snakePosition.last + 315);
      } else {
        snakePosition.add(snakePosition.last - 15);
      }
    }

    if (snakePosition.last == foodPositionIndex) {
      onEatFood();
    } else {
      snakePosition.remove(snakePosition.first);
    }

    notifyListeners();
  }

  snakeMoveTimePeriod() {
    Timer.periodic(
      timeDuration,
      (time) {
        controllingTheSnakeMovingPosition();
        gameStarted = true;
        notifyListeners();
      },
    );
  }
}
