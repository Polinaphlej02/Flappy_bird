import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game/flappy_bird_game.dart';

final game = FlappyBirdGame();
void main() {
  runApp(GameWidget(game: game));
}

