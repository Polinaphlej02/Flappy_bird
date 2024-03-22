import 'package:flame/components.dart';
import 'package:flappy_bird_app/game/bird_moving.dart';
import 'package:flappy_bird_app/game/assets.dart';
import 'package:flappy_bird_app/game/flappy_bird_game.dart';

class Bird extends SpriteGroupComponent<BirdMoving> with HasGameRef<FlappyBirdGame>{
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
  }
}