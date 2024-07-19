import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

extension IconDataExtension on String {
  IconData toIconData({Color? color, double size = 24}) {
    switch (this) {
      case 'burger':
        return FontAwesomeIcons.hamburger;
      case 'plane':
        return FontAwesomeIcons.plane;
      case 'mugHot':
        return FontAwesomeIcons.mugHot;
      case 'heartPulse':
        return FontAwesomeIcons.heartPulse;
      case 'home':
        return FontAwesomeIcons.home;
      case 'bagShopping':
        return FontAwesomeIcons.bagShopping;
      case 'dumbbell':
        return FontAwesomeIcons.dumbbell;

      case 'arrow_downward_outlined':
        return Icons.arrow_downward_outlined;
      // Add more cases for additional icons
      default:
        return FontAwesomeIcons
            .questionCircle; // Default icon for unknown strings
    }
  }
}
