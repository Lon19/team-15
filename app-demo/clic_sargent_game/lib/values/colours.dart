import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

// App Colour Scheme
const int primaryColourInt = 0xFF011B2F;
const int whiteInt = 0xFFFFFFFF;
const int greyInt = 0xFFEFEFEF;
const int blackInt = 0xFF000000;
const int blueInt = 0xFF062288;

const Color primaryColour = Color(primaryColourInt);
const Color whiteColour = Color(whiteInt);
const Color greyColour = Color(greyInt);
const Color blackColour = Color(blackInt);
const Color blueColour = Color(blueInt);

MaterialColor materialPrimary = const MaterialColor(primaryColourInt,
    <int, Color>{
      50: primaryColour,
      100: primaryColour,
      200: primaryColour,
      300: primaryColour,
      400: primaryColour,
      500: primaryColour,
      600: primaryColour,
      700: primaryColour,
      800: primaryColour,
      900: primaryColour,
    }
);

MaterialColor materialWhite = const MaterialColor(whiteInt,
    <int, Color>{
      50: whiteColour,
      100: whiteColour,
      200: whiteColour,
      300: whiteColour,
      400: whiteColour,
      500: whiteColour,
      600: whiteColour,
      700: whiteColour,
      800: whiteColour,
      900: whiteColour,
    }
);

MaterialColor materialGrey = const MaterialColor(greyInt,
    <int, Color>{
      50: greyColour,
      100: greyColour,
      200: greyColour,
      300: greyColour,
      400: greyColour,
      500: greyColour,
      600: greyColour,
      700: greyColour,
      800: greyColour,
      900: greyColour,
    }
);

MaterialColor materialBlack = const MaterialColor(blackInt,
    <int, Color>{
      50: blackColour,
      100: blackColour,
      200: blackColour,
      300: blackColour,
      400: blackColour,
      500: blackColour,
      600: blackColour,
      700: blackColour,
      800: blackColour,
      900: blackColour,
    }
);

MaterialColor materialBlue = const MaterialColor(blueInt,
    <int, Color>{
      50: blueColour,
      100: blueColour,
      200: blueColour,
      300: blueColour,
      400: blueColour,
      500: blueColour,
      600: blueColour,
      700: blueColour,
      800: blueColour,
      900: blueColour,
    }
);