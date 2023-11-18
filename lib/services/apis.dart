import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/topic.dart';
import '../models/question.dart';
import '../models/answer.dart';

class TopicApi {

  Future<List<Topic>> findAll() async {
    
    final response = await http.get(
      Uri.parse("https://dad-quiz-api.deno.dev/topics"),
    );
    List<dynamic> topicItems = jsonDecode(response.body);

    return List<Topic>.from(topicItems.map(
      (jsonData) => Topic.fromJson(jsonData),
    ));
  }
  
}

class QuestionApi {
  
  Future<Question> fetchQuestion(int topicId) async {
    final response = await http.get(
      Uri.parse("https://dad-quiz-api.deno.dev/topics/$topicId/questions"),
    );

    return Question.fromJson(jsonDecode(response.body));
  }
}

class AnswerApi {
  
  Future<Answer> answerQuestion(String answer, int topicId, int questionId) async {

    final response = await http.post(
      Uri.parse("https://dad-quiz-api.deno.dev/topics/$topicId/questions/$questionId/answers"),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({"answer": answer}),
    );
    Answer a = Answer.fromJson(jsonDecode(response.body));
    return a;
  }
}


