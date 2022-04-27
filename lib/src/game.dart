import 'package:feso_app/src/game_controller.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var controller = GameController();

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: width,
                color: Colors.blue,
                child: Stack(children: [
                  ValueListenableBuilder(
                    valueListenable: controller.height,
                    builder: (context, value, child) {
                      return Positioned(
                        bottom: controller.height.value,
                        right: width / 2,
                        child: Container(
                          color: Colors.yellow,
                          width: 50,
                          height: 50,
                        ),
                      );
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: controller.pipe1,
                    builder: (context, value, child) {
                      return Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: width - controller.pipe1.value[1],
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.green[900],
                                  width: 100,
                                  height: controller.pipe1.value[1],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: controller.pipe1.value[0],
                            left: width - controller.pipe1.value[1],
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.green[700],
                                  width: 100,
                                  height: 200,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ]),
              ),
              flex: 7,
            ),
            Expanded(
              child: Container(
                width: width,
                color: Colors.green,
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                width: width,
                color: Colors.brown,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: const Text("Start"),
                      onPressed: controller.handleStart,
                    ),
                    ElevatedButton(
                      child: const Text("Stop"),
                      onPressed: controller.handleGameOver,
                    ),
                    ElevatedButton(
                      child: const Text("Pular"),
                      onPressed: controller.handleJump,
                    ),
                  ],
                ),
              ),
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class async {}
