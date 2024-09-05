import 'package:flutter/material.dart';
import 'dart:math';

class Tela05 extends StatelessWidget {
  final double temperature = _getRandomTemperature();
  final String seasonEmoji = _getSeasonEmoji(_getRandomTemperature());

  static double _getRandomTemperature() {
    // Gera uma temperatura aleatória para simular o clima
    return Random().nextInt(35) + 5.0; // Entre 5°C e 40°C
  }

  static String _getSeasonEmoji(double temperature) {
    // Determina o emoji com base na temperatura
    if (temperature > 25) {
      return '☀️'; // Verão
    } else {
      return '❄️'; // Inverno
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tela 05 - Clima',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black, // Cor do AppBar
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.grey[800]!], // Gradiente em tons de preto e cinza
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Temperatura Atual:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '$temperature°C $seasonEmoji', // Exibe a temperatura e o emoji
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.grey[700], // Cor do botão
                  foregroundColor: Colors.white, // Cor do texto
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // Botões quadrados
                  ),
                  elevation: 5,
                  shadowColor: Colors.grey[700]!.withOpacity(0.5), // Sombra
                ),
                child: Text(
                  'Voltar para a Tela Principal',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
