import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:the_memory_match_game/ui/widgets/game_options.dart';
import 'package:the_memory_match_game/utils/constants.dart';

class StartUpPage extends StatelessWidget {
  const StartUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                gameTitle,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              GameOptions(),
            ],
          ),
        ),
      ),
    );
  }
}
