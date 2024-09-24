import 'package:challenge_ur_memory/models/question_model.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class QDBconnect {
  final url = Uri.parse(
      'https://challenges-2f0c5-default-rtdb.firebaseio.com/questions.json');

  Future<void> addQuestion(Question question) async {
    http.post(url,
        body: json.encode({
          'title': question.title,
          'part': question.part,
          'options': question.options
        }));
  }

  Future<List<Question>> fetchQuestionByParts(Set<int> selectedParts) async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach(
        (key, value) {
          var newQustion = Question(
            id: key,
            title: value['title'],
            part: value['part'],
            options: Map.castFrom(value[
                'options']), // to convert Map<String,dunamic> To Map<String,bool>
          );
          newQuestions.add(newQustion);
        },
      );

      List<Question> questionByPart = [];
      for (int i = 0; i < selectedParts.length; i++) {
        newQuestions.forEach((e) {
          if (e.part == selectedParts.elementAt(i)) {
            questionByPart.add(e);
          }
        });
      }

      return questionByPart;
    });
  }
}
