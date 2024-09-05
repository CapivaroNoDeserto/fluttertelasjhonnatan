import 'package:flutter/material.dart';
import 'Tela04.dart';
import 'dart:math'; // Para gerar palavras aleatórias

class Tela03 extends StatefulWidget {
  @override
  _Tela03State createState() => _Tela03State();
}

class _Tela03State extends State<Tela03> {
  final List<String> _palavrasDaSorte = [
    'Sucesso', 'Felicidade', 'Fortuna', 'Amor', 'Saúde', 'Sabedoria', 'Paz', 'Riqueza', 'Harmonia', 'Gratidão'
  ];
  String _palavraAtual = 'Clique para a sorte!';

  void _gerarPalavra() {
    final random = Random();
    setState(() {
      _palavraAtual = _palavrasDaSorte[random.nextInt(_palavrasDaSorte.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Palavras da Sorte',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.black, // Cor de fundo do AppBar
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.grey[800]!], // Gradiente de fundo em tons de preto e cinza
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Palavra da Sorte:',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.grey[300], // Cor do texto
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                _palavraAtual,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent, // Destaque para a palavra
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _gerarPalavra,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent, // Cor do botão
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // Botões quadrados
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Gerar Palavra da Sorte',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Cor do texto do botão
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tela04()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700], // Cor do botão de navegação
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // Botões quadrados
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Ir para a Quarta Tela',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Cor do texto do botão
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
