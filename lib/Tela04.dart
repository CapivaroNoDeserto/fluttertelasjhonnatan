import 'package:flutter/material.dart';
import 'Tela05.dart';
import 'package:intl/intl.dart';

class Tela04 extends StatefulWidget {
  @override
  _Tela04State createState() => _Tela04State();
}

class _Tela04State extends State<Tela04> {
  final TextEditingController _realController = TextEditingController();
  final TextEditingController _dolarController = TextEditingController();
  final double _exchangeRate = 5.63;
  bool _isRealToDollar = true;

  void _convertCurrency() {
    if (_isRealToDollar) {
      _convertRealToDollar();
    } else {
      _convertDollarToReal();
    }
  }

  void _convertRealToDollar() {
    if (_realController.text.isNotEmpty) {
      double realValue = double.parse(_realController.text.replaceAll(',', '.'));
      double dollarValue = realValue / _exchangeRate;
      _dolarController.text = NumberFormat.currency(locale: 'en_US', symbol: '')
          .format(dollarValue);
    }
  }

  void _convertDollarToReal() {
    if (_dolarController.text.isNotEmpty) {
      double dollarValue = double.parse(_dolarController.text.replaceAll(',', '.'));
      double realValue = dollarValue * _exchangeRate;
      _realController.text = NumberFormat.currency(locale: 'pt_BR', symbol: '')
          .format(realValue);
    }
  }

  void _invertConversion() {
    setState(() {
      _isRealToDollar = !_isRealToDollar;
      _realController.clear();
      _dolarController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Conversor de Moedas',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber[700],
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.attach_money,
              size: 60,
              color: Colors.greenAccent,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _realController,
              decoration: InputDecoration(
                labelText: _isRealToDollar ? 'Valor em Reais (BRL)' : 'Valor em Dólares (USD)',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber, width: 2.0),
                ),
                labelStyle: TextStyle(color: Colors.amber[700]),
              ),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              enabled: _isRealToDollar,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _dolarController,
              decoration: InputDecoration(
                labelText: _isRealToDollar ? 'Valor em Dólares (USD)' : 'Valor em Reais (BRL)',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber, width: 2.0),
                ),
                labelStyle: TextStyle(color: Colors.amber[700]),
              ),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              enabled: !_isRealToDollar,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _invertConversion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent, // Atualizado
                    foregroundColor: Colors.black, // Atualizado
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text('Inverter Conversão'),
                ),
                ElevatedButton(
                  onPressed: _convertCurrency,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent, // Atualizado
                    foregroundColor: Colors.black, // Atualizado
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text('Converter Moeda'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tela05()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[700], // Atualizado
                foregroundColor: Colors.black, // Atualizado
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text('Ir para a Quinta Tela'),
            ),
          ],
        ),
      ),
    );
  }
}
