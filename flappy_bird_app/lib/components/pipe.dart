import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird_app/components/config.dart';
import 'package:flappy_bird_app/game/assets.dart';
import 'package:flappy_bird_app/game/flappy_bird_game.dart';
import 'package:flappy_bird_app/game/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe(
    {
      required this.height,
      required this.pipePosition,
    }
  );

  @override
  final double height;
  final PipePosition pipePosition;

  Future<void> onLoad() async {
    final pipeOne = await Flame.images.load(Assets.pipeOne);
    final pipeTwo = await Flame.images.load(Assets.pipeTwo);
    size = Vector2(50, height);

    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeTwo);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipeOne);
        break;  
    }

    add(RectangleHitbox());
  }
  }