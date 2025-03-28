import 'package:flutter/material.dart';
//import 'package:quizzerler/question.dart';
//import 'question.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];
  void checkanswer(bool userpickedanswer) {
    bool correctanswer = quizBrain.getcorrectanswer();

    setState(() {
      if (userpickedanswer == correctanswer) {
        scorekeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scorekeeper.add(Icon(Icons.close, color: Colors.red));
      }
      quizBrain.nextQuestion();
    });
  }
  // List<String> question = [
  //   'EQUIVALENT TO is (more or less) the same as EQUAL TO.',
  //   'The past tense of FIND is FOUND.',
  //   'DOZEN is equivalent to 20.',
  // ];
  // List<bool> answer = [false, true, false];
  // List<Question> questionbank = [
  //   Question(
  //     questionText: 'EQUIVALENT TO is (more or less) the same as EQUAL TO',
  //     questionAnswer: false,
  //   ),
  //   Question(
  //     questionText: 'The past tense of FIND is FOUND.',
  //     questionAnswer: true,
  //   ),
  //   Question(questionText: 'DOZEN is equivalent to 20.', questionAnswer: false),
  // ];
  //int questionnumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              color: Colors.green,
              child: TextButton(
                // textColor: Colors.white,
                // color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                onPressed: () {
                  //quizBrain.questionbank = null;
                  //

                  // if (correctanswer == true) {
                  //   print('this ans is true');
                  // } else {
                  //   print('this is wrong');
                  // }
                  // setState(() {
                  //   quizBrain.nextQuestion();
                  // });
                  checkanswer(true);
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              color: Colors.red,
              child: TextButton(
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    //backgroundColor: Colors.red,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkanswer(false);
                },
              ),
            ),
          ),
        ),
        // TODO: Add a Row here as your score keeper
        SingleChildScrollView(child: Row(children: scorekeeper)),
      ],
    );
  }
}
