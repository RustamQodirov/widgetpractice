import 'package:flutter/material.dart';
import 'greeting_widget.dart';
import 'casino.dart';

void main() {
  runApp(CasinoApp());
}

class CasinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Color.fromARGB(255, 58, 7, 199),
        appBar: AppBar(
          title: const Text('Widget Practice'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GreetingWidget(
                message: 'Welcome to the Casino!',
              ),
              const SizedBox(height: 20.0),
              DiceGameWidget(),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
