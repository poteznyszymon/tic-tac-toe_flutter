import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/widgets/heading.dart';
import 'package:tic_tac_toe/widgets/player_move.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List positions = ['', '', '', '', '', '', '', '', ''];
  bool playerOneMove = true;
  bool playerTwoMove = false;
  bool gameEnded = false;

  void changePlayerMove() {
    setState(() {
      playerOneMove = !playerOneMove;
      playerTwoMove = !playerOneMove;
    });
  }

  void makeMove(int index) {
    setState(() {
      if (playerOneMove == true && positions[index] == '' && !gameEnded) {
        positions[index] = 'O';
        checkWhoWon();
        changePlayerMove();
      }
      if (playerTwoMove == true && positions[index] == '' && !gameEnded) {
        positions[index] = 'X';
        checkWhoWon();
        changePlayerMove();
      }
    });
  }

  void resetGame() {
    setState(() {
      positions = ['', '', '', '', '', '', '', '', ''];
      playerOneMove = true;
      playerTwoMove = false;
      gameEnded = false;
    });
  }

  bool playerOneWin() {
    if (positions[0] == 'O' && positions[1] == 'O' && positions[2] == 'O') {
      return true;
    } else if (positions[3] == 'O' &&
        positions[4] == 'O' &&
        positions[5] == 'O') {
      return true;
    } else if (positions[6] == 'O' &&
        positions[7] == 'O' &&
        positions[8] == 'O') {
      return true;
    } else if (positions[0] == 'O' &&
        positions[3] == 'O' &&
        positions[6] == 'O') {
      return true;
    } else if (positions[1] == 'O' &&
        positions[4] == 'O' &&
        positions[7] == 'O') {
      return true;
    } else if (positions[2] == 'O' &&
        positions[5] == 'O' &&
        positions[8] == 'O') {
      return true;
    } else if (positions[0] == 'O' &&
        positions[4] == 'O' &&
        positions[8] == 'O') {
      return true;
    } else if (positions[6] == 'O' &&
        positions[4] == 'O' &&
        positions[2] == 'O') {
      return true;
    } else {
      return false;
    }
  }

  void checkWhoWon() {
    if (playerOneWin()) {
      gameEnded = true;
    } else if (playerTwoWin()) {
      gameEnded = true;
    } else if (checkDraw()) {
      gameEnded = true;
    }
  }

  bool playerTwoWin() {
    if (positions[0] == 'X' && positions[1] == 'X' && positions[2] == 'X') {
      return true;
    } else if (positions[3] == 'X' &&
        positions[4] == 'X' &&
        positions[5] == 'X') {
      return true;
    } else if (positions[6] == 'X' &&
        positions[7] == 'X' &&
        positions[8] == 'X') {
      return true;
    } else if (positions[0] == 'X' &&
        positions[3] == 'X' &&
        positions[6] == 'X') {
      return true;
    } else if (positions[1] == 'X' &&
        positions[4] == 'X' &&
        positions[7] == 'X') {
      return true;
    } else if (positions[2] == 'X' &&
        positions[5] == 'X' &&
        positions[8] == 'X') {
      return true;
    } else if (positions[0] == 'X' &&
        positions[4] == 'X' &&
        positions[8] == 'X') {
      return true;
    } else if (positions[6] == 'X' &&
        positions[4] == 'X' &&
        positions[2] == 'X') {
      return true;
    } else {
      return false;
    }
  }

  bool checkDraw() {
    for (int i = 0; i < 9; i++) {
      if (positions[i] == '') {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 31, 47, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 80),
              HeadingWidget(
                playerOneWon: playerOneWin(),
                playerTwoWon: playerTwoWin(),
                isDraw: checkDraw(),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  shrinkWrap: true,
                  children: List.generate(
                    9,
                    (index) {
                      return GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(75, 73, 95, 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            positions[index],
                            style: GoogleFonts.inter(
                                color: Colors.white, fontSize: 70),
                          ),
                        ),
                        onTap: () => makeMove(index),
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 260,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PlayerMove(
                          side: 1,
                          playerOneMove: playerOneMove,
                        ),
                        PlayerMove(
                          side: 2,
                          playerOneMove: playerTwoMove,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(242, 150, 121, 1),
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () => resetGame(),
                      child: Text(
                        'Reset',
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
