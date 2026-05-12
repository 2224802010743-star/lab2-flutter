import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LayoutApp(),
      ),
    );
  }
}

class LayoutApp extends StatelessWidget {
  const LayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20), // Task 3: Add Padding
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "I'm in a Column and Centered. The below is a row.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Task 1
            children: [
              Container(
                width: 80,
                height: 80,
                color: Colors.red,
              ),
              const SizedBox(width: 15),
              Container(
                width: 80,
                height: 80,
                color: Colors.green,
              ),
              const SizedBox(width: 15),
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),
            ],
          ),

          const SizedBox(height: 20),

          Stack(
            alignment: Alignment.topLeft, // Task 2
            children: [
              Container(
                width: 260,
                height: 140,
                color: Colors.yellow,
              ),
              const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "Stacked on Yellow Box",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}