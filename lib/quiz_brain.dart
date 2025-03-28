import 'package:quizzerler/question.dart';

class QuizBrain {
  int _questionnumber = 0;

  final List<Question> _questionbank = [
    Question(
      questionText: 'The Earth is the third planet from the Sun.',
      questionAnswer: true,
    ),

    Question(
      questionText: 'Water boils at 90°C at sea level.',
      questionAnswer: false,
    ),

    Question(
      questionText: 'The Great Wall of China is visible from space.',
      questionAnswer: false,
    ),

    Question(
      questionText: 'Light travels faster than sound.',
      questionAnswer: true,
    ),

    Question(
      questionText: 'Mount Everest is the tallest mountain in the world.',
      questionAnswer: true,
    ),

    Question(questionText: 'Sharks are mammals.', questionAnswer: false),

    Question(
      questionText: 'The currency of Japan is the Yen.',
      questionAnswer: true,
    ),

    Question(
      questionText: 'An octopus has three hearts.',
      questionAnswer: true,
    ),

    Question(
      questionText: 'The human body has 206 bones.',
      questionAnswer: true,
    ),

    Question(
      questionText: 'The chemical symbol for gold is Ag.',
      questionAnswer: false,
    ),
  ];

  void nextQuestion() {
    if (_questionnumber < _questionbank.length - 1) {
      _questionnumber++;
    }
    print(_questionnumber);
    print(_questionbank.length);
  }

  String getQuestionText() {
    return _questionbank[_questionnumber].questionText;
  }

  bool getcorrectanswer() {
    return _questionbank[_questionnumber].questionAnswer;
  }
}
