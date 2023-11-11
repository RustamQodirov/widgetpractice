import 'package:flutter/material.dart';
import 'dart:math';

class DiceGameWidget extends StatefulWidget {
  @override
  _DiceGameWidgetState createState() => _DiceGameWidgetState();
}

class _DiceGameWidgetState extends State<DiceGameWidget> {
  int diceRollResult = 1; 
  int betAmount = 0;
  bool isWin = false;

  void rollDice() {
    setState(() {
      diceRollResult = Random().nextInt(6) + 1; 
      isWin = diceRollResult == betAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Text(
                'Dice Roll Result: $diceRollResult',
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: rollDice,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: Text('Roll Dice'),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: isWin ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            isWin ? 'Congratulations! You won!' : 'Sorry! You lost!',
            style:const  TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
       const SizedBox(height: 20.0),
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              const Text(
                'Enter your bet amount:',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    betAmount = int.tryParse(value) ?? 0;
                  });
                },
                decoration:const  InputDecoration(
                  hintText: 'Enter bet amount',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
