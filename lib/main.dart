import 'package:flutter/material.dart';
import 'Tela02.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool _isCrazyTheme = false;
  late AnimationController _controller;
  late Color _backgroundColor;
  late Color _textColor;
  late Color _iconColor;
  late double _fontSize;
  late FontStyle _fontStyle;
  IconData _currentIcon = Icons.sentiment_very_satisfied;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addListener(() {
        if (_isCrazyTheme) {
          setState(() {
            _backgroundColor = _randomColor();
            _textColor = _randomColor();
            _iconColor = _randomColor();
            _fontSize = _randomFontSize();
            _fontStyle = _randomFontStyle();
            _currentIcon = _randomIcon();
          });
        }
      });

    _backgroundColor = Colors.black;
    _textColor = Colors.white;
    _iconColor = Colors.red;
    _fontSize = 24.0;
    _fontStyle = FontStyle.normal;
  }

  Color _randomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  double _randomFontSize() {
    final random = Random();
    return 20 + random.nextInt(16).toDouble();
  }

  FontStyle _randomFontStyle() {
    return Random().nextBool() ? FontStyle.italic : FontStyle.normal;
  }

  IconData _randomIcon() {
    return Random().nextBool()
        ? Icons.sentiment_very_satisfied
        : Icons.emoji_emotions;
  }

  void _toggleCrazyTheme() {
    setState(() {
      _isCrazyTheme = !_isCrazyTheme;
      if (_isCrazyTheme) {
        _controller.repeat();
      } else {
        _controller.stop();
        _resetTheme();
      }
    });
  }

  void _resetTheme() {
    setState(() {
      _backgroundColor = Colors.black;
      _textColor = Colors.white;
      _iconColor = Colors.red;
      _fontSize = 24.0;
      _fontStyle = FontStyle.normal;
      _currentIcon = Icons.sentiment_very_satisfied;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurpleAccent,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.white), // Atualizado para bodyLarge
        ),
      ),
      home: MyHomePage(
        onChangeTheme: _toggleCrazyTheme,
        isCrazyTheme: _isCrazyTheme,
        backgroundColor: _backgroundColor,
        textColor: _textColor,
        iconColor: _iconColor,
        fontSize: _fontSize,
        fontStyle: _fontStyle,
        currentIcon: _currentIcon,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final VoidCallback onChangeTheme;
  final bool isCrazyTheme;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double fontSize;
  final FontStyle fontStyle;
  final IconData currentIcon;

  const MyHomePage({
    Key? key,
    required this.onChangeTheme,
    required this.isCrazyTheme,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.fontSize,
    required this.fontStyle,
    required this.currentIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tela Principal',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 4,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'Bem-vindo à tela de Flutter',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Icon(
              currentIcon,
              color: iconColor,
              size: 120,
            ),
            SizedBox(height: 20),
            Text(
              isCrazyTheme
                  ? 'Tema Maluco Ativado! Clique para voltar ao normal!'
                  : 'Pressione o botão para ativar o tema maluco!',
              style: TextStyle(
                fontSize: fontSize,
                color: textColor,
                fontStyle: fontStyle,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: onChangeTheme,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      'Alternar Tema',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tela02()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      'Ir para a Segunda Tela',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
