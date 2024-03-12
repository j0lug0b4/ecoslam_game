import 'package:ecoslam_game/components/ball.dart';
import 'package:ecoslam_game/game/basketball_game.dart';
import 'package:ecoslam_game/screens/menu/main_menu.dart';
import 'package:ecoslam_game/widgets/scoreboard.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class GameOverScreen extends StatelessWidget {
  final BasketBallGame game;

  const GameOverScreen({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Size screenSize = MediaQuery.of(context).size;
    
        BasketBallGame basketballGame = BasketBallGame();

    return Center(
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          width: screenSize.width * 0.9,
          height: screenSize.height * 0.4,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
   
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Text(
                  'You scored ${game.score.value} points',
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Enhanced LED Board-7',
                      fontSize: 17),
                ),
              ),
              SizedBox(
                  height: 40,
                  width: screenSize.width * 0.7,
                  child: ElevatedButton(
                      onPressed: () {
                        game.resetScore();
                        game.resetTimer();
                        game.resumeEngine();
                        game.overlays.remove(GameOverlays.gameOver.name);
                        game.overlays.add(GameOverlays.scoreboard.name);
                   
                         Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GameWidget(
                                              game: basketballGame,
                                              overlayBuilderMap: {
                                                GameOverlays.scoreboard.name:
                                                    (ctx, Game game) =>
                                                        ScoreBoard(
                                                            game:
                                                                basketballGame),
                                                GameOverlays.gameOver.name:
                                                    (ctx, Game game) =>
                                                        GameOverScreen(
                                                            game:
                                                                basketballGame),
                                                GameOverlays.main.name:
                                                    (BuildContext context,
                                                            BasketBallGame
                                                                gameRef) =>
                                                         MainMenuScreen(),
                                              },
                                              initialActiveOverlays: [
                                                GameOverlays.scoreboard.name
                                              ],
                                            )));
                      },
                      child: const Text(
                        'Play Again',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Enhanced LED Board-7',
                            fontSize: 14),
                      ).animate().fade(duration: 500.ms).scale(delay: 500.ms)))
            ],
          ),
        ),
      ),
    );
  }
}
