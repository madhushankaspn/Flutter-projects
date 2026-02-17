import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Ground()));
}

class Ground extends StatefulWidget {
  const Ground({super.key});

  @override
  State<Ground> createState() => _GroundState();
}

class _GroundState extends State<Ground> {
  int runs = 0;
  int balls = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF448AFF),
      appBar: AppBar(
        title: const Text("Mini Cricket"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/OIP.jpeg',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Runs",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "$runs",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/ball.jpeg',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Balls",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "$balls",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (balls > 0) {
                    List<int> scoreOptions = [0, 0, 1, 1, 2, 3, 4, 6];
                    int randomRun =
                        scoreOptions[Random().nextInt(scoreOptions.length)];

                    runs += randomRun;
                    balls--;
                  }
                });
              },
              child: const Text(
                "Bat",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //total
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF448AFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Total Runs: $runs",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
