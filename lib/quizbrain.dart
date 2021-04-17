import 'package:flutterbkd/question.dart';

class QuizBrain {
  List<Question> _questions = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true)
  ];

  int _questionNum = 0;

  String getQuestionText() {
    return _questions[_questionNum].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNum].questionAnswer;
  }

  void nextQuesion() {
    if(_questionNum < _questions.length - 1) {
      _questionNum++;
    }
  }

  bool isFinished() {
    if(_questionNum >= _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNum = 0;
  }


}