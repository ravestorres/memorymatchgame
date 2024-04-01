import 'package:flutter/material.dart';

enum CardState { hidden, visible, guessed }

class CardItem {
  CardItem({
    required this.value,
    required this.imagePath,
    this.color = Colors.white,
    this.state = CardState.hidden,
  });

  final int value;
  final String imagePath;
  final Color color;
  CardState state;
}
