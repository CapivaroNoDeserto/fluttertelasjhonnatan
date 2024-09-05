import 'package:flutter/material.dart';
import 'Tela03.dart';
import 'package:intl/intl.dart'; // Importa o pacote intl para formatação de data e hora
import 'dart:async'; // Importa a biblioteca para o Timer

class Tela02 extends StatefulWidget {
  @override
  _Tela02State createState() => _Tela02State();
}

class _Tela02State extends State<Tela02> {
  String _currentTime = '';
  late Timer _timer;

  void _updateTime() {
    final DateTime now = DateTime.now().toUtc().subtract(Duration(hours: 3)); // Calcula a hora de Brasília (UTC-3)
    setState(() {
      _currentTime = DateFormat('HH:mm:ss').format(now); // Formata a hora no fuso horário de Brasília
    });
  }

  @override
  void initState() {
    super.initState();
    _updateTime(); // Inicializa com a hora correta
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime()); // Atualiza a cada segundo
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancela o timer quando o widget é destruído
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tela 02',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black, // Cor de fundo do AppBar
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.grey[800]!], // Gradiente de fundo
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time, // Ícone de relógio
                size: 50,
                color: Colors.grey[400], // Cor do ícone
              ),
              SizedBox(height: 10), // Espaço entre o ícone e o texto
              Text(
                'Hora atual de Brasília:',
                style: TextStyle(fontSize: 20, color: Colors.grey[300]),
              ),
              SizedBox(height: 5), // Espaço entre o texto e a hora
              Text(
                _currentTime,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tela03()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700], // Cor do botão
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // Botões quadrados
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Ir para a Terceira Tela',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
