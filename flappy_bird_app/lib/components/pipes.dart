import 'package:flame/components.dart';
import 'package:flappy_bird_app/components/pipe.dart';
import 'package:flappy_bird_app/game/pipe_position.dart';

class Pipes extends PositionComponent{
  Pipes();

  @override
  Future<void> onLoad() async {
    addAll([
      Pipe(height: 200, pipePosition: PipePosition.top),
      Pipe(height: 100, pipePosition: PipePosition.bottom),
    ]);
  }
}