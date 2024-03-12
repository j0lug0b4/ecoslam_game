import 'dart:ui';

import 'package:ecoslam_game/game/basketball_game.dart';
import 'package:ecoslam_game/screens/menu/game_over.dart';
import 'package:ecoslam_game/widgets/scoreboard.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../constants/image_assets.dart';
import 'package:add_to_google_wallet/widgets/add_to_google_wallet_button.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
class MainMenuScreen extends StatelessWidget {
   MainMenuScreen({Key? key}) : super(key: key);

   final String _passId = const Uuid().v4();
 String _passClass = 'ecoslam';
 String _issuerId = '3388000000022325287';
 String _issuerEmail = 'j0lug0b4@gmail.com';



  @override
  Widget build(BuildContext context) {
    final String _examplePass = """ 
    {
      "iss": "$_issuerEmail",
      "aud": "google",
      "typ": "savetowallet",
      "origins": [],
      "payload": {
        "genericObjects": [
          {
            "id": "$_issuerId.$_passId",
            "classId": "$_issuerId.$_passClass",
            "genericType": "GENERIC_TYPE_UNSPECIFIED",
            "hexBackgroundColor": "#4285f4",
            "logo": {
              "sourceUri": {
                "uri": "https://storage.googleapis.com/wallet-lab-tools-codelab-artifacts-public/pass_google_logo.jpg"
              }
            },
            "cardTitle": {
              "defaultValue": {
                "language": "en",
                "value": "Google I/O '22 [DEMO ONLY]"
              }
            },
            "subheader": {
              "defaultValue": {
                "language": "en",
                "value": "Attendee"
              }
            },
            "header": {
              "defaultValue": {
                "language": "en",
                "value": "Alex McJacobs"
              }
            },
            "barcode": {
              "type": "QR_CODE",
              "value": "$_passId"
            },
            "heroImage": {
              "sourceUri": {
                "uri": "https://storage.googleapis.com/wallet-lab-tools-codelab-artifacts-public/google-io-hero-demo-only.jpg"
              }
            },
            "textModulesData": [
              {
                "header": "POINTS",
                "body": "1234",
                "id": "points"
              }
            ]
          }
        ]
      }
    }
""";
     void _showSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
        Size screenSize = MediaQuery.of(context).size;
    BasketBallGame basketballGame = BasketBallGame();

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/${ImageAssets.mural2}',
            width: screenSize.width,
            height: screenSize.height,
            fit: BoxFit.cover,
          ),
         
      
          Center(
            child: Container(
              alignment: Alignment.center,
              height: screenSize.height * 0.7,
              width: screenSize.width * 0.8,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Ecosalm game developed with Flame',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Enhanced LED Board-7',
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: SizedBox(
                          width: screenSize.width * 0.8,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
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
                                'Start Game',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Enhanced LED Board-7',
                                    fontSize: 14),
                              )
                                  .animate()
                                  .fade(duration: 500.ms)
                                  .scale(delay: 500.ms))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
