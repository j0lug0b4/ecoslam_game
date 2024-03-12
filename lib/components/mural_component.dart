import 'package:ecoslam_game/constants/image_assets.dart';
import 'package:flame/components.dart';


import 'package:ecoslam_game/game/basketball_game.dart';
class MuralComponent extends SpriteComponent with HasGameRef<BasketBallGame> {

  MuralComponent(): super(priority: 0);
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(ImageAssets.bg);
    size = gameRef.size;
  }
}
