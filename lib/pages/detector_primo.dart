import 'package:flutter/material.dart';
import '../utils/chequeadorprimos.dart';

class PrimeNumberScreen extends StatefulWidget {
  @override
  _PrimeNumberScreenState createState() => _PrimeNumberScreenState();
}

class _PrimeNumberScreenState extends State<PrimeNumberScreen> {
  final TextEditingController _controller = TextEditingController();
  String _resultMessage = '';

  void _checkIfPrime() {
    final input = _controller.text;
    if (input.isEmpty) {
      setState(() {
        _resultMessage = 'Por favor, ingresa un número.';
      });
      return;
    }

    final number = int.tryParse(input);
    if (number == null) {
      setState(() {
        _resultMessage = 'Ingresa un número válido.';
      });
      return;
    }

    final isPrime = chequeadorprimos.isPrime(number);
    setState(() {
      _resultMessage =
      isPrime ? 'El número $number es primo.' : 'El número $number no es primo.';
    });
  }

  void _clearInput() {
    _controller.clear();
    setState(() {
      _resultMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detector de Números Primos',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade200, Colors.purple.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Ingresa un número',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _checkIfPrime,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Verificar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _clearInput,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Limpiar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  _resultMessage,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
