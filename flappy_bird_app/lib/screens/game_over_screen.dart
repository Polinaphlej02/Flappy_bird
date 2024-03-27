import 'package:flappy_bird_app/game/assets.dart';
import 'package:flappy_bird_app/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  static const String id = "gameOver";
  final FlappyBirdGame game;
  const GameOver({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black26,
      child: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.gameOver),
          ElevatedButton(onPressed: onRestart,
           style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 150, 26, 26)),
           child: const Text(
            "Restart",
            style: TextStyle(fontSize: 20, color: Colors.white),
           ))
        ],

      ),),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove("gameOver");
    game.resumeEngine();
  }
}