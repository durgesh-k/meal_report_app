import 'package:flutter/material.dart';

class DefaultErrorScreen extends StatelessWidget {
  const DefaultErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Something went wrong. Please try again"),
      ),
    );
  }
}
