import 'dart:ui';

import 'package:ecoslam_game/components/backboard.dart';
import 'package:ecoslam_game/components/ball.dart';
import 'package:ecoslam_game/components/boundary.dart';
import 'package:ecoslam_game/components/mural_component.dart';
import 'package:ecoslam_game/components/rim.dart';
import 'package:ecoslam_game/constants/audio.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

import 'package:flame_forge2d/flame_forge2d.dart' hide Timer;
import 'package:flutter/foundation.dart';

// declaring all game overlays here
enum GameOverlays { gameOver, main, scoreboard }

class BasketBallGame extends Forge2DGame
    with HasDraggables, HasCollisionDetection {
  late Timer _timer;

  // Timer for the game
  ValueNotifier<int> timer = ValueNotifier(60);

  // Notifier for the game score
  ValueNotifier<int> score = ValueNotifier(0);
  bool startedGame = false;

  // Tamaño del juego


  BasketBallGame() {
    // Resto del código de inicialización del juego
    // ...
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Cargar todos los componentes del juego
    await loadAllComponents();
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Actualizar el temporizador
    _timer.update(dt);
  }

  // Resetear el temporizador cuando el juego termina
  void resetTimer() {
    timer.value = 60;
  }

  // Resetear la puntuación cuando el juego termina
  void resetScore() {
    score.value = 0;
  }

  // Añadir una superposición al juego
  void addMenu(GameOverlays overlay) {
    overlays.add(overlay.name);
  }

  // Función para cargar todos los componentes e iniciar el temporizador
  Future<void> loadAllComponents() async {
    // Configurar la cuenta atrás del temporizador
    _timer = Timer(
      1,
      repeat: true,
      onTick: () {
        if (timer.value == 0) {
          // Pausar el juego, pausar la canción de fondo y eliminar todas las bolas con los componentes del marcador
          pauseEngine();
          removeWhere((component) => component is BallComponent);
   

          overlays.remove(GameOverlays.scoreboard.name);
          overlays.add(GameOverlays.gameOver.name);
          // Mostrar el menú de fin de juego.
        } else {
          // Decrementar el tiempo en un segundo.
          timer.value -= 1;
        }
      },
    );

    // Establecer límites para la pantalla del juego
    final boundaries = createBoundaries(this);
    boundaries.forEach(add);


    Vector2 gameSize = screenToWorld(camera.viewport.effectiveSize);


    addAll([
      MuralComponent(),
      BackboardComponent(gameSize),



      RimComponent(Vector2((gameSize.x / 2) - 6.7, 28), false),

      BackRimComponent(Vector2((gameSize.x / 2) - 6.7, 28),1),



      

      BallComponent(Vector2((gameSize.x / 2) - 6.7, 28),1),
    ]);
  }
}
