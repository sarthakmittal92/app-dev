import 'package:flutter/material.dart';
import 'questions.dart';

void main() => runApp(MaterialApp(
  home: QuizApp(),
));

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  QuizAppState createState() => QuizAppState();
}

class QuizAppState extends State <QuizApp> {
  AllQuestions Q = new AllQuestions();
  int counter = 0;
  int score = 0;
  bool submitted = false;
  double font = 24.0;
  List <Widget> icons = [];

  void check (bool b) {
    if (b == Q.qS[counter].a) {
      icons.add(Icon(Icons.check_rounded, color: Colors.green));
      score += 3;
    }
    else {
      icons.add(Icon(Icons.clear_rounded, color: Colors.red));
      score -= 1;
    }
    counter++;
    if (counter == 12) {
      submitted = true;
    }

    font = 24.0;
    if (counter == 7) {
      font = 16.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (submitted) return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              'SCORE: $score',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  submitted = false;
                  score = 0;
                  counter = 0;
                  icons = [];
                });
              },
              child: Text(
                'Reset',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
              ),
            ),
          ],
        ),
      ),
    );
    else return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  submitted = true;
                });
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
              ),
            ),
            SizedBox(height: 40.0),
            Card(
              margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: Text(
                Q.qS[counter].q,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: font,
                ),
                textAlign: TextAlign.center,
              ),
              color: Colors.black,
            ),
            SizedBox(height: 120.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        check(true);
                      });
                    },
                    child: Text(
                      'TRUE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        check(false);
                      });
                    },
                    child: Text(
                      'FALSE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              children: icons,
            ),
          ],
        ),
      ),
    );
  }
}