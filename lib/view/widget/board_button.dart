import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  const BoardButton(this.value, {super.key, required this.onTap});

  final String value;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Expanded(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Text(
            value,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
