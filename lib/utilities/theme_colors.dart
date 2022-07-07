import 'package:flutter/material.dart';
import './config.dart';

class ThemeColors {
  // Define color theme
  static bool isDarkMode = false;
  static Color primary= isDarkMode ? Config.PRIMARY : Config.PRIMARY;
}
