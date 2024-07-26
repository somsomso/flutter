import 'package:flame/components.dart';
import 'dart:ui';

class Obstacle extends PositionComponent {
  Obstacle() {
    position = Vector2(400, 300);
    size = Vector2(50, 50);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= 200 * dt;
    if (position.x < -size.x) {
      position.x = 400;
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(toRect(), Paint()..color = const Color(0xFFFF0000));
  }
}
