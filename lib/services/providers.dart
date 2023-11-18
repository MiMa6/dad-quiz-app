import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/topic.dart';
import '../models/question.dart';
import '../models/answer.dart';
import '../utils/counters.dart';
import 'apis.dart';

class TopicNotifier extends StateNotifier<List<Topic>> {
  final topicApi = TopicApi();
  TopicNotifier() : super([]);

  _initialize() async {
    state = await topicApi.findAll();
  }
}

class QuestionNotifier extends StateNotifier<Question> {
  final questionApi = QuestionApi();

  QuestionNotifier() : super(Question.fromJson({"id":1, "image_url":"","question": '', "options": [], "answer_post_path": ""}));

  clearQuestion() async {
    state = Question.fromJson({"id":1, "image_url":"","question": '', "options": [], "answer_post_path": ""});
  }

  getQuestion(int topicId) async {
    Question q = await questionApi.fetchQuestion(topicId);
    state = q;
  }

}

class CorrectAnswernNotifier extends StateNotifier<Answer> {
  final correctAnswerApi = AnswerApi();

  CorrectAnswernNotifier() : super(Answer.fromJson({"correct": false}));


  setFalse()  {
    state = Answer.fromJson({"correct": false});
  }

  getQuestionAnswer(String answer, int topicId, int questionId) async {
    Answer a = await correctAnswerApi.answerQuestion(answer, topicId, questionId);
    incrementAnswers(a.correct);
    incrementTopicAnswers(a.correct, topicId);
    state = a;
  }

}

final topicProvider = StateNotifierProvider<TopicNotifier, List<Topic>>((ref) {
  final tn = TopicNotifier();
  
  tn._initialize();
  return tn;
});

final questionProvider = StateNotifierProvider<QuestionNotifier, Question>((ref) {
  final qn = QuestionNotifier();
  return qn;
});

final correctAnswerProvider = StateNotifierProvider<CorrectAnswernNotifier, Answer>((ref) {
  final cap = CorrectAnswernNotifier();
  return cap;
});

final isQuestionAnsweredProvider = StateProvider<bool>((ref) => false);


