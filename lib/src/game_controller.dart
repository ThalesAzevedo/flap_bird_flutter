import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

enum GameState { menu, pause, play, score }

class GameController extends ChangeNotifier {
  int gravity = 1;
  ValueNotifier state = ValueNotifier<GameState>(GameState.menu);
  ValueNotifier width = ValueNotifier<double>(0);
  ValueNotifier height = ValueNotifier<double>(0);
  ValueNotifier speed = ValueNotifier<double>(0);
  ValueNotifier pipe1 = ValueNotifier<List<double>>([500, 150]);
  // ValueNotifier pipe2 = ValueNotifier<List<double>>([]);
  // ValueNotifier pipe3 = ValueNotifier<List<double>>([]);
  Timer? tick;

  starTimer() {
    tick = Timer.periodic(
      Duration(milliseconds: 50),
      (timer) => refreshScreen(),
    );
  }

  stopTimer() {
    tick?.cancel();
  }

  // pipeHeight() {
  //   double pipePos = pipe1.value[0] - 100;
  //   double pipeHeight = (250 + Random().nextInt(150)).toDouble();
  //   pipe1.value = [pipeHeight, pipePos];
  // }

  handleStart() {
    state.value = GameState.play;
    starTimer();
  }

  refreshScreen() {
    calcBirdPosition();
    calcPipe1Position();
  }

  calcBirdPosition() {
    height.value <= 0 && speed.value < 0 ? 0 : height.value += speed.value;
    height.value <= 0 ? 0 : speed.value -= gravity;
  }

  calcPipe1Position() {
    double newPos = pipe1.value[1] - 1;
    pipe1.value = [pipe1.value[0], newPos];
  }

  handleGameOver() {
    state.value = GameState.menu;
    stopTimer();
  }

  handleMenu() {}
  handlePause() {}
  handleScore() {}

  handleJump() {
    speed.value += 10;
  }
}

class Bird {
  double Y;
  double X;

  Bird(this.X, this.Y);
}
