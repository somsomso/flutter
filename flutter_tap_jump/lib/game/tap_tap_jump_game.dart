import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/events.dart';
import 'player.dart';
import 'obstacle.dart';
import '../state/game_state.dart';

class TapTapJumpGame extends FlameGame with TapCallbacks {
  late Player player;
  late Obstacle obstacle;
  final GameState gameState;

  TapTapJumpGame(this.gameState);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    player = Player();
    obstacle = Obstacle();

    add(player);
    add(obstacle);
  }

  @override
  void update(double dt) {
    super.update(dt);
    player.update(dt);
    obstacle.update(dt);

    if (player.toRect().overlaps(obstacle.toRect())) {
      gameState.gameOver();
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    if (gameState.isGameOver) {
      final textPainter = TextPainter(
        text: const TextSpan(
          text: 'Game Over',
          style: TextStyle(color: Colors.red, fontSize: 40),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
          canvas, Offset(size.x / 2 - textPainter.width / 2, size.y / 2 - textPainter.height / 2));
    }
  }

  @override
  void onTap() {
    player.jump();
  }
}
