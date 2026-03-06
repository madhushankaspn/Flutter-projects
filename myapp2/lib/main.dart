import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RockPaperScissors(),
    );
  }
}

class RockPaperScissors extends StatefulWidget {
  const RockPaperScissors({super.key});

  @override
  State<RockPaperScissors> createState() => _RockPaperScissorsState();
}

class _RockPaperScissorsState extends State<RockPaperScissors> {

  List<String> choices = ["Rock", "Paper", "Scissors"];

  String userChoice = "";
  String computerChoice = "";
  String result = "Make your move!";

  int userScore = 0;
  int computerScore = 0;

  void playGame(String choice) {

    final random = Random();
    String compChoice = choices[random.nextInt(3)];

    setState(() {
      userChoice = choice;
      computerChoice = compChoice;

      if (userChoice == computerChoice) {
        result = "It's a Draw!";
      }
      else if ((userChoice == "Rock" && computerChoice == "Scissors") ||
          (userChoice == "Paper" && computerChoice == "Rock") ||
          (userChoice == "Scissors" && computerChoice == "Paper")) {

        result = "You Win!";
        userScore++;

      }
      else {
        result = "Computer Wins!";
        computerScore++;
      }
    });
  }

  void resetGame() {
    setState(() {
      userScore = 0;
      computerScore = 0;
      userChoice = "";
      computerChoice = "";
      result = "Game Reset. Make your move!";
    });
  }

  Widget gameButton(String text) {
    return ElevatedButton(
      onPressed: () {
        playGame(text);
      },
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rock Paper Scissors"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Score",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text("You: $userScore"),
            Text("Computer: $computerScore"),

            const SizedBox(height: 30),

            Text("Your Choice: $userChoice"),
            Text("Computer Choice: $computerChoice"),

            const SizedBox(height: 30),

            Text(
              result,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                gameButton("Rock"),
                const SizedBox(width: 10),
                gameButton("Paper"),
                const SizedBox(width: 10),
                gameButton("Scissors"),
              ],
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: resetGame,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text("Reset Game"),
            ),
          ],
        ),
      ),
    );
  }
}