import 'package:flutter/material.dart';

class Responsive {
  static late double _scaleFactor;

  static void init(BuildContext context, {double referenceWidth = 412}) {
    double screenWidth = MediaQuery.of(context).size.width;
    _scaleFactor = screenWidth / referenceWidth;
  }

  static double scale(double value) {
    return value * _scaleFactor;
  }
}
