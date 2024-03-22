import 'package:flame/game.dart';
import 'package:flappy_bird_app/components/background.dart';
import 'package:flappy_bird_app/components/ground.dart';

import '../components/bird.dart';

class FlappyBirdGame extends FlameGame {
  late Bird bird;
  
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      ]);

  }

}