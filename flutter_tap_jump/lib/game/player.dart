import 'package:flame/components.dart';
import 'dart:ui';

class Player extends PositionComponent {
  static const double gravity = 800;
  static const double jumpForce = -300;
  double velocityY = 0;

  Player() {
    position = Vector2(50, 300);
    size = Vector2(50, 50);
  }

  @override
  void update(double dt) {
    super.update(dt);
    velocityY += gravity * dt;
    position.y += velocityY * dt;

    if (position.y > 300) {
      position.y = 300;
      velocityY = 0;
    }
  }

  void jump() {
    if (position.y >= 300) {
      velocityY = jumpForce;
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(toRect(), Paint()..color = const Color(0xFF00FF00));
  }
}
