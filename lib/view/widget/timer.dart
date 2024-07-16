import 'package:flutter/material.dart';

class GameTimer extends StatelessWidget {
  const GameTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text (
      "00:00",
      style: TextStyle(
        color: Colors.grey
      ),
    );
  }
}