import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_app/components/background.dart';
import 'package:flappy_bird_app/components/config.dart';
import 'package:flappy_bird_app/components/ground.dart';
import 'package:flappy_bird_app/components/pipes.dart';

import '../components/bird.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection{
  FlappyBirdGame();

  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat:true);

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      ]);

    interval.onTick =() => add(Pipes());
  }

  @override
  void onTap(){
    super.onTap();
    bird.fly();
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}