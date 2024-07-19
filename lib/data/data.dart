import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> myData = [
  {
    'icon': const FaIcon(FontAwesomeIcons.burger),
    'color': Colors.yellow[700],
    'title': 'Food',
    'totalAmount': '- EGP 100.00',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.bagShopping),
    'color': Colors.purple,
    'title': 'Shopping',
    'totalAmount': '- EGP 45.00',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.heartPulse),
    'color': Colors.blue,
    'title': 'Health',
    'totalAmount': '- EGP 45.00',
    'date': 'Yasterday',
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.planeDeparture),
    'color': Colors.green,
    'title': 'travel',
    'totalAmount': '- EGP 45.00',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.dumbbell),
    'color': Colors.orange,
    'title': 'Gym',
    'totalAmount': '- EGP 350.00',
    'date': 'Today',
  },
];
