import 'package:flame/game.dart';
import 'package:flappy_bird_app/screens/game_over_screen.dart';
import 'package:flappy_bird_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

import 'game/flappy_bird_game.dart';


void main() {
  final game = FlappyBirdGame();
  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const [MainScreen.id],
    overlayBuilderMap: {
      'mainMenu': (context, _) => MainScreen(game: game),
      'gameOver': (context, _) => GameOver(game: game),
    }
  ));
}

