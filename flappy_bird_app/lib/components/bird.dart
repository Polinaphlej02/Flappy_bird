import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappy_bird_app/components/config.dart';
import 'package:flappy_bird_app/game/bird_moving.dart';
import 'package:flappy_bird_app/game/assets.dart';
import 'package:flappy_bird_app/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class Bird extends SpriteGroupComponent<BirdMoving> with HasGameRef<FlappyBirdGame>, CollisionCallbacks{
  Bird();

  @override
  Future<void> onLoad() async {
    final birdUp = await gameRef.loadSprite(Assets.birdTwo);
    final birdDown = await gameRef.loadSprite(Assets.birdThree);
    final birdMid = await gameRef.loadSprite(Assets.birdOne);

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = BirdMoving.mid;
    sprites = {
      BirdMoving.up: birdUp,
      BirdMoving.down: birdDown,
      BirdMoving.mid: birdMid,
    };
    add(CircleHitbox());
  }

  void fly() {
    add(MoveByEffect(Vector2(0,Config.gravity), EffectController(duration: 0.2, curve: Curves.decelerate),
    onComplete: () => current = BirdMoving.down,));
    current = BirdMoving.up;
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
  }

  void gameOver(){
    gameRef.overlays.add("gameOver");
    gameRef.pauseEngine();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.birdVelocity * dt;
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
  }
}