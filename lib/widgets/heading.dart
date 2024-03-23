import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingWidget extends StatefulWidget {
  final bool playerOneWon;
  final bool playerTwoWon;
  final bool isDraw;
  const HeadingWidget({
    super.key,
    required this.playerOneWon,
    required this.playerTwoWon,
    required this.isDraw,
  });

  @override
  State<HeadingWidget> createState() => _HeadingWidgetState();
}

class _HeadingWidgetState extends State<HeadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(75, 73, 95, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            widget.playerOneWon
                ? 'One Won'
                : widget.playerTwoWon
                    ? 'Two Won'
                    : widget.isDraw
                        ? 'Draw'
                        : "Tic Tac Toe",
            style: GoogleFonts.inter(
              fontSize: 50,
              color: const Color.fromRGBO(242, 150, 121, 1),
            ),
          ),
        ),
      ),
    );
  }
}
