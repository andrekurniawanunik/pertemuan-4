import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  const MyTextInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: false,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "nama",
      ),
    );
  }
}