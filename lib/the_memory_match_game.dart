import 'package:flutter/material.dart';
import 'package:the_memory_match_game/ui/pages/startup_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_memory_match_game/utils/constants.dart';

class TheMemoryMatchGame extends StatelessWidget {
  const TheMemoryMatchGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const StartUpPage(),
      title: 'The MemoryMatch Game',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          primary: darkPrimaryColor,
          secondary: darkAccentColor,
        ),
        scaffoldBackgroundColor: darkBackgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme()
            .apply(
              bodyColor: darkTextColor,
              displayColor: darkTextColor,
            )
            .copyWith(
              headline1: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
              headline2: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
            ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
