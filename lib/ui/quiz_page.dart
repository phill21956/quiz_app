import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/operation/result_page.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  int group;
  int selectedValue;
  int score = 0;

  List<QuizModel> question = [
    new QuizModel(
      'Richest man in the world',
      'Jeff Bezos',
      'Elon Musk',
      'Bill Gates',
      'Aliko Dangote',
      'Jeff Bezos',
    ),
    new QuizModel('Fastet heroe in DC', 'The Flash', 'The Flash', 'Superman',
        'Batman', 'Wonderwoman'),
    new QuizModel('Largest economy in the world', 'USA', 'China', 'Nigeria',
        'USA', 'Britain'),
        new QuizModel(
      'Which of these men play soccer proffesionally',
      'Paul Pogba',
      'Burna Boy',
      'Paul Pogba',
      'Will Smith',
      'Lebron James',
    ),
    new QuizModel(
      'Whch of these is a continent',
      'Asia',
      'Asia',
      'China',
      'India',
      'Mongolia',
    ),
 
  ];

  @override
  Widget build(BuildContext context) {
    var dimension = MediaQuery.of(context).size;
    var deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'images/bg.jpg',
              fit: BoxFit.cover,
              height: deviceSize.height,
              width: deviceSize.width,
              
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    question[currentQuestion].question,
                    style: TextStyle(fontSize: 30, fontFamily: 'Pacifico'),
                  ),
                  SizedBox(
                    height: dimension.height * 0.03,
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: group,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                  group = value;
                                });
                              }),
                          SizedBox(
                            width: dimension.width * 0.03,
                          ),
                          Text(
                            question[currentQuestion].option1,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                              value: 2,
                              groupValue: group,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                  group = value;
                                });
                              }),
                          SizedBox(
                            width: dimension.width * 0.03,
                          ),
                          Text(
                            question[currentQuestion].option2,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                              value: 3,
                              groupValue: group,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                  group = value;
                                });
                              }),
                          SizedBox(
                            width: dimension.width * 0.03,
                          ),
                          Text(
                            question[currentQuestion].option3,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                              value: 4,
                              groupValue: group,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                  group = value;
                                });
                              }),
                          SizedBox(
                            width: dimension.width * 0.01,
                          ),
                          Text(
                            question[currentQuestion].option4,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: dimension.height * 0.04,
                      ),
                      RaisedButton(
                          child: Text('Next Question'),
                          onPressed: () {
                            if (selectedValue == null) {
                              return;
                            } else {
                              switch (selectedValue) {
                                case 1:
                                  if (question[currentQuestion].option1 ==
                                      question[currentQuestion].answer) {
                                    score++;
                                  }
                                  break;
                                case 2:
                                  if (question[currentQuestion].option2 ==
                                      question[currentQuestion].answer) {
                                    score++;
                                  }
                                  break;
                                case 3:
                                  if (question[currentQuestion].option3 ==
                                      question[currentQuestion].answer) {
                                    score++;
                                  }
                                  break;
                                case 4:
                                  if (question[currentQuestion].option4 ==
                                      question[currentQuestion].answer) {
                                    score++;
                                  }
                                  break;
                              }
                            }
                            if (currentQuestion < question.length - 1) {
                              setState(() {
                                currentQuestion++;
                                group = null;
                                selectedValue = null;
                              });
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultPage(score)));
                            }
                          })
                    ],
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
