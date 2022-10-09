import 'package:flutter/material.dart';

String removeLastCharacter(String str) {
  String result = '';
  if ((str != '') && (str.length > 0)) {
    result = str.substring(0, str.length - 1);
  }
  return result;
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyCalculator(title: 'Calculator'),
    );
  }
}

class MyCalculator extends StatefulWidget {
  MyCalculator({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String _display = '';
  String _answer = '';
  bool error = true;

  bool lengthError() {
    return _display.length < 14;
  }

  String _evaluate(String s) {
    double answer = 0.0;
    List defaultOperators = ['x', '/', '+', '-'];
    List<String> numbers = [];
    List<String> operators = [];
    var number = '';
    for (int i = 0; i < s.length; i++) {
      if (defaultOperators.contains(s[i])) {
        if (number == '') {
          error = false;
        }
        operators.add(s[i]);
        numbers.add(number);
        number = '';
      } else {
        number += s[i];
      }
    }
    numbers.add(number);
    List operatorCopy = [...operators];
    var multDiv = 0;

    for (int i = 0; i < operators.length; i++) {
      if (operators[i] == 'x') {
        var n = i - multDiv;
        numbers[n] = (double.parse(numbers[n]) * double.parse(numbers[n + 1]))
            .toString();
        numbers.removeAt(n + 1);
        operatorCopy.remove(operators[i]);
        multDiv++;
      } else if (operators[i] == '/') {
        var n = i - multDiv;
        numbers[n] = (double.parse(numbers[n]) / double.parse(numbers[n + 1]))
            .toString();
        numbers.removeAt(n + 1);
        operatorCopy.remove(operators[i]);
        multDiv++;
      }
    }

    operators = [...operatorCopy];
    var plusMinus = 0;

    for (int i = 0; i < operators.length; i++) {
      if (operators[i] == '+') {
        var n = i - plusMinus;
        numbers[n] = (double.parse(numbers[n]) + double.parse(numbers[n + 1]))
            .toString();
        numbers.removeAt(n + 1);
        plusMinus++;
      } else if (operators[i] == '-') {
        var n = i - plusMinus;
        numbers[n] = (double.parse(numbers[n]) - double.parse(numbers[n + 1]))
            .toString();
        numbers.removeAt(n + 1);
        plusMinus++;
      }
    }
    answer = double.parse(numbers[0]);
    return answer.toStringAsFixed(3);
  }

  void _calcInputBackspace() {
    setState(() {
      _display = removeLastCharacter(_display);
      _answer = '';
    });
  }

  void _calcInput0() {
    setState(() {
      if (error) _display += '0';
    });
  }

  void _calcInputClear() {
    setState(() {
      _display = '';
      _answer = '';
      error = true;
    });
  }

  void _calcInputEvaluate() {
    setState(() {
      if (error) _answer = _evaluate(_display);
    });
  }

  void _calcInputDot() {
    setState(() {
      if (error) _display += '.';
    });
  }

  void _calcInput00() {
    setState(() {
      if (error) _display += '00';
    });
  }

  void _calcInputPlus() {
    setState(() {
      if (error) _display += '+';
    });
  }

  void _calcInput1() {
    setState(() {
      if (error) _display += '1';
    });
  }

  void _calcInput2() {
    setState(() {
      if (error) _display += '2';
    });
  }

  void _calcInput3() {
    setState(() {
      if (error) _display += '3';
    });
  }

  void _calcInputMinus() {
    setState(() {
      if (error) _display += '-';
    });
  }

  void _calcInput4() {
    setState(() {
      if (error) _display += '4';
    });
  }

  void _calcInput5() {
    setState(() {
      if (error) _display += '5';
    });
  }

  void _calcInput6() {
    setState(() {
      if (error) _display += '6';
    });
  }

  void _calcInputMultiply() {
    setState(() {
      if (error) _display += 'x';
    });
  }

  void _calcInput7() {
    setState(() {
      if (error) _display += '7';
    });
  }

  void _calcInput8() {
    setState(() {
      if (error) _display += '8';
    });
  }

  void _calcInput9() {
    setState(() {
      if (error) _display += '9';
    });
  }

  void _calcInputDivide() {
    setState(() {
      if (error) _display += '/';
    });
  }

  @override
  Widget build(BuildContext context) {
    error = lengthError();
    if (!error) {
      _answer = 'Limit Exceeded.';
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _display,
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _answer,
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Divider(
              height: 60.0,
              color: Colors.white,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: _calcInput7,
                  child: const Text('7'),
                ),
                OutlinedButton(
                  onPressed: _calcInput8,
                  child: const Text('8'),
                ),
                OutlinedButton(
                  onPressed: _calcInput9,
                  child: const Text('9'),
                ),
                OutlinedButton(
                  onPressed: _calcInputDivide,
                  child: const Text('/'),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: _calcInput4,
                  child: const Text('4'),
                ),
                OutlinedButton(
                  onPressed: _calcInput5,
                  child: const Text('5'),
                ),
                OutlinedButton(
                  onPressed: _calcInput6,
                  child: const Text('6'),
                ),
                OutlinedButton(
                  onPressed: _calcInputMultiply,
                  child: const Text('x'),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: _calcInput1,
                  child: const Text('1'),
                ),
                OutlinedButton(
                  onPressed: _calcInput2,
                  child: const Text('2'),
                ),
                OutlinedButton(
                  onPressed: _calcInput3,
                  child: const Text('3'),
                ),
                OutlinedButton(
                  onPressed: _calcInputMinus,
                  child: const Text('-'),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: _calcInputDot,
                  child: const Text('.'),
                ),
                OutlinedButton(
                  onPressed: _calcInput0,
                  child: const Text('0'),
                ),
                OutlinedButton(
                  onPressed: _calcInput00,
                  child: const Text('00'),
                ),
                OutlinedButton(
                  onPressed: _calcInputPlus,
                  child: const Text('+'),
                ),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: _calcInputClear,
                  child: const Text('CLEAR'),
                ),
                OutlinedButton(
                  onPressed: _calcInputBackspace,
                  child: const Text('BACKSPACE'),
                ),
                OutlinedButton(
                  onPressed: _calcInputEvaluate,
                  child: const Text('EVALUATE'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
