import 'package:flutter/material.dart';

class MyConstant {
  static var educations = <String>[
    'มัธยม',
    'ป.ตรี',
    'สูงกว่า ป.ตรี',
  ];

  static Color primary = const Color.fromARGB(255, 38, 207, 226);
  static Color dark = const Color.fromARGB(255, 2, 26, 45);
  static Color light = const Color.fromARGB(255, 203, 48, 230);
  static Color active = const Color.fromARGB(255, 231, 34, 165);

  TextStyle h1Style() => TextStyle(
        fontSize: 48,
        fontFamily: 'Itim',
        fontWeight: FontWeight.bold,
        color: dark,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 24,
        fontFamily: 'Itim',
        fontWeight: FontWeight.w500,
        color: dark,
      );

  TextStyle h2WhiteStyle() => const TextStyle(
        fontSize: 24,
        fontFamily: 'Itim',
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 20,
        fontFamily: 'Itim',
        fontWeight: FontWeight.normal,
        color: dark,
      );

  TextStyle h3ActiveStyle() => TextStyle(
        fontSize: 22,
        fontFamily: 'Itim',
        fontWeight: FontWeight.w500,
        color: active,
      );

  BoxDecoration curveBorder() => BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(),
      );

  BoxDecoration bgBox() => const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg.png'),
          fit: BoxFit.cover,
        ),
      );
}
