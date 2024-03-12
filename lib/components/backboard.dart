import 'dart:ui';

import 'package:ecoslam_game/constants/image_assets.dart';
import 'package:ecoslam_game/game/basketball_game.dart';
import 'package:flame/components.dart';

class BackboardComponent extends SpriteComponent with HasGameRef<BasketBallGame> {
   Vector2? gameSize;

  BackboardComponent(this.gameSize) : super(priority: 1);

  @override
  void onLoad() async {
    // Cargar el componente del tablero trasero
    super.onLoad();

    sprite = await gameRef.loadSprite(ImageAssets.stand);
    position = Vector2(gameSize!.x * 0.02, 7.5);
    width = gameSize!.x * 0.94;
    height = gameSize!.y * 0.9;
    //anchor = Anchor.center;
  }
}
