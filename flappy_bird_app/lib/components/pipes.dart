import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird_app/components/config.dart';
import 'package:flappy_bird_app/components/pipe.dart';
import 'package:flappy_bird_app/game/flappy_bird_game.dart';
import 'package:flappy_bird_app/game/pipe_position.dart';
import 'package:flappy_bird_app/main.dart';
import 'package:flutter/material.dart';

class Pipes extends PositionComponent with HasGameRef<FlappyBirdGame>{
  Pipes();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightWithoutGround = gameRef.size.y - Config.groundHeight;
    final space = 100 + _random.nextDouble() * (heightWithoutGround / 4);
    final centerY = space + _random.nextDouble() * (heightWithoutGround - space);

    addAll([
      Pipe(height: centerY - space / 2, pipePosition: PipePosition.top),
      Pipe(height: heightWithoutGround - (centerY + space / 2), pipePosition: PipePosition.bottom),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -10) {
      removeFromParent();
      debugPrint("Removed");
    }
  }
}