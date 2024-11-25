import 'package:flutter/material.dart';
import 'pages/detector_primo.dart';

void main() {
  runApp(PrimeNumberApp());
}

class PrimeNumberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeNumberScreen(),
    );
  }
}
