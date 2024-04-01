import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:the_memory_match_game/models/card_item.dart';

class Game {
  Game(this.gridSize) {
    generateCards();
  }

  final int gridSize;
  List<CardItem> cards = [];
  bool isGameOver = false;

  void generateCards() {
    cards = [];
    final List<String> imagePaths = [
      'assets/images/anthem.png',
      'assets/images/ph.png',
      'assets/images/anahaw.webp',
      'assets/images/bahaykubo.webp',
      'assets/images/joserizal.webp',
      'assets/images/sampaguita.webp',
      'assets/images/perlas.webp',
      'assets/images/pheagle.webp',
      'assets/images/arnix.jpg',
      'assets/images/bakya.jpg',
      'assets/images/bangus.jpg',
      'assets/images/barong.jpg',
      'assets/images/barotsaya.jpg',
      'assets/images/carabao.jpg',
      'assets/images/jeepney.jpg',
      'assets/images/manga.jpg',
      'assets/images/narra.jpg',
      'assets/images/sorbetes.jpg',
      'assets/images/tarsier.jpg',
      'assets/images/mayon.jpg',
      'assets/images/luneta.jpg',
      'assets/images/rice_terraces.jpg',
      'assets/images/chocolatehills.jpg',
      'assets/images/taal.jpg',
      'assets/images/magellans_cross.jpg',
      'assets/images/bonifaciio_shrine.png',
      'assets/images/leyte_landing.jpg',
      'assets/images/lapulapu.jpg',
      'assets/images/malacanang_palace.jpg',
      'assets/images/burnham.jpg',
      'assets/images/binondo.jpg',
      'assets/images/fort_santiago.jpg',
      'assets/images/hanging_cofins.jpg',
      'assets/images/hundred_islands.jpg',
      'assets/images/corregidor.jpg',
      'assets/images/quiapo.jpg',
    ];

    for (int i = 0; i < (gridSize * gridSize / 2); i++) {
      final cardValue = i + 1;
      final String imagePath = imagePaths[i % imagePaths.length];
      final List<CardItem> newCards = _createCardItems(imagePath, cardValue);
      cards.addAll(newCards);
    }
    cards.shuffle(Random());
  }

  List<CardItem> _createCardItems(String imagePath, int cardValue) {
    return List.generate(
      2,
      (index) => CardItem(
        value: cardValue,
        imagePath: imagePath,
      ),
    );
  }

  void resetGame() {
    generateCards();
    isGameOver = false;
  }

  void onCardPressed(int index) {
    cards[index].state = CardState.visible;
    final List<int> visibleCardIndexes = _getVisibleCardIndexes();
    if (visibleCardIndexes.length == 2) {
      final CardItem card1 = cards[visibleCardIndexes[0]];
      final CardItem card2 = cards[visibleCardIndexes[1]];
      if (card1.value == card2.value) {
        card1.state = CardState.guessed;
        card2.state = CardState.guessed;
        isGameOver = _isGameOver();
      } else {
        Future.delayed(const Duration(milliseconds: 1000), () {
          card1.state = CardState.hidden;
          card2.state = CardState.hidden;
        });
      }
    }
  }

  List<int> _getVisibleCardIndexes() {
    return cards
        .asMap()
        .entries
        .where((entry) => entry.value.state == CardState.visible)
        .map((entry) => entry.key)
        .toList();
  }

  bool _isGameOver() {
    return cards.every((card) => card.state == CardState.guessed);
  }
}
