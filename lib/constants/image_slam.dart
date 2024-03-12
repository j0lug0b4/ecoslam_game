import 'dart:math';

class ImageSlam {
  ImageSlam._();

  static const Map<String, int> basketballSprites = {


'11eco.png':4,
'12eco.png':4,
'13eco.png':4,
'14eco.png':4,
'15eco.png':4,
'16eco.png':4,


'17eco.png':3,
'18eco.png':3,
'19eco.png':3,
'20eco.png':3,
'21eco.png':3,

'1eco.png':1,
'2eco.png':1,
'3eco.png':1,
'4eco.png':1,
'5eco.png':1,


'6eco.png':2,
'7eco.png':2,
'8eco.png':2,
'9eco.png':2,
'22eco.png':2,
'23eco.png':2,
'24eco.png':2,
'10eco.png':2,
    // Agrega aquí más nombres de imágenes y sus valores asociados
  };

  static String getRandomBasketballSprite() {
    final Random random = Random();
    final String randomImageName = basketballSprites.keys.elementAt(random.nextInt(basketballSprites.length));
    return randomImageName;
  }

  static int getValueForImage(String imageName) {

    return basketballSprites[imageName] ?? 0; // Retorna 0 si no se encuentra la imagen en el mapa
  }

  
}
