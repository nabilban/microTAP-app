import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFF0B1015);
  static const Color surface = Color(0xFF151C24);
  static const Color surfaceContainer = Color(0xFF1C242E);
  static const Color primary = Color(0xFF007AFF);
  static const Color onPrimary = Colors.white;
  static const Color onSurface = Colors.white;
  static const Color onSurfaceVariant = Color(0xFF8E99A3);

  static const Color accentBlue = Color(0xFF0091FF);

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1A212A),
      Color(0xFF0D1218),
    ],
  );

  static const LinearGradient activeGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF007AFF),
      Color(0xFF00C7FF),
    ],
  );
}
