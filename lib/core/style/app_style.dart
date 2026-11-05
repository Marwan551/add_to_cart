import 'package:flutter/material.dart';

abstract final class AppColors {
  static const primary = Color(0xFF5D4FBE);
  static const gradientStart = Color(0xFF7A6FE2);
  static const canvas = Color(0xFFF7F8FA);
  static const ink = Color(0xFF1E1E2D);
  static const muted = Color(0xFF8B8C9A);
  static const line = Color(0xFFE8E8EE);
  static const surface = Colors.white;
  static const error = Colors.red;
}

abstract final class AppRadii {
  static const card = BorderRadius.all(Radius.circular(14));
  static const field = BorderRadius.all(Radius.circular(12));
  static const pill = BorderRadius.all(Radius.circular(24));
}


String formatMoney(double value) => value % 1 == 0 ? '${value.toInt()} \$' : '${value.toStringAsFixed(2)} \$';
