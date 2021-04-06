// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';

import 'package:flutter/material.dart';
import '../ui/quiz_page.dart';

class ResultPage extends StatefulWidget {
  int score;

  ResultPage(this.score);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    var dimension = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Result',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: dimension.height * 0.04,
              ),
              Text(
                '${widget.score}/5',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: dimension.height * 0.04,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => QuizPage()));
                },
                child: Text('Play Again'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
