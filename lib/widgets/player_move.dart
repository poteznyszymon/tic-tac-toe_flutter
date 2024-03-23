import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerMove extends StatefulWidget {
  final int side;
  final bool playerOneMove;
  const PlayerMove({
    super.key,
    required this.side,
    required this.playerOneMove,
  });

  @override
  State<PlayerMove> createState() => _PlayerMoveState();
}

class _PlayerMoveState extends State<PlayerMove> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
        color: widget.playerOneMove == true
            ? const Color.fromRGBO(242, 150, 121, 1)
            : const Color.fromRGBO(75, 73, 95, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: widget.side == 1
              ? const Radius.circular(40)
              : const Radius.circular(0),
          topLeft: widget.side == 1
              ? const Radius.circular(0)
              : const Radius.circular(40),
          topRight: widget.side == 1
              ? const Radius.circular(40)
              : const Radius.circular(0),
          bottomRight: widget.side == 1
              ? const Radius.circular(0)
              : const Radius.circular(40),
        ),
      ),
      child: Center(
        child: Text(
          widget.side == 1 ? 'Player one' : 'Player two',
          style: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}


