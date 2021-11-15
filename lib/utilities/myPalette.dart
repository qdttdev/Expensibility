// I use this to pick the color I want to use from an image:
// https://imagecolorpicker.com/

// I use this website to make tints and shade for this palete:
// https://maketintsandshades.com/#dc5b44

// I use this website to create a brand logo:
// https://spark.adobe.com/express-apps/logo-maker/preview

import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor redShade = const MaterialColor(
    0xffdc5b44, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffe06b57), //10%
      100: const Color(0xffe37c69), //20%
      200: const Color(0xffe78c7c), //30%
      300: const Color(0xffea9d8f), //40%
      400: const Color(0xffeeada2), //50%
      500: const Color(0xfff1bdb4), //60%
      600: const Color(0xfff5cec7), //70%
      700: const Color(0xfff8deda), //80%
      800: const Color(0xfffcefec), //90%
      900: const Color(0xffffffff), //100%
    },
  );
}
