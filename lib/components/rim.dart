

import 'package:ecoslam_game/game/basketball_game.dart';
import 'package:ecoslam_game/constants/image_assets.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class RimComponent extends BodyComponent with ContactCallbacks {
  final Vector2 position;
  final bool collidesWithBall;

  RimComponent(this.position, this.collidesWithBall) : super(priority: 3);

  @override
  Body createBody() {
    renderBody = false;
    Filter filter = Filter()
      ..categoryBits = collidesWithBall ? 0x0001 : 0x0002
      ..maskBits = collidesWithBall ? 0x0002 : 0x0004;
    Shape shape = CircleShape()..radius = 0.4;
    BodyDef bodyDef = BodyDef(
      userData: this,
      gravityScale: Vector2(0, 20),
      position: position,
      type: BodyType.static,
    );
    FixtureDef fixtureDef = FixtureDef(shape,
        friction: .0, restitution: .15, density: 0, filter: filter);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
class BackRimComponent extends SpriteComponent with HasGameRef<BasketBallGame> {
   Vector2 gameSize;
int entero;
  BackRimComponent( this.gameSize,this.entero) : super(priority: 4);

  @override
  void onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite(ImageAssets.backRim4);
    position = Vector2(gameSize.x, gameSize.y);
    width = gameRef.size.x * 0.37;
    height = 5.4;
  }
}


