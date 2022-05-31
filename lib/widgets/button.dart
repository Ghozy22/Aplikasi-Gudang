import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String text;
  final VoidCallback onClicked;

  const Button({
    Key? key,
    required this.text, required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: onClicked,
    child: FittedBox(
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    )
    );

}