import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/data_classes.dart';
import 'apis.dart';

class TopicNotifier extends StateNotifier<List<Topic>> {
  final topicApi = TopicApi();
  TopicNotifier() : super([]);

  _initialize() async {
    state = await topicApi.findAll();
  }
}

final topicProvider = StateNotifierProvider<TopicNotifier, List<Topic>>((ref) {
  final tn = TopicNotifier();
  tn._initialize();
  return tn;
});


class QuestionNotifier extends StateNotifier<Question> {
  final questionApi = QuestionApi();

  QuestionNotifier() : super(Question.fromJson({"id":1, "question": '', "options": [], "answer_post_path": ""}));

  clearQuestion() async {
    state = Question.fromJson({"id":1, "question": '', "options": [], "answer_post_path": ""});
  }

  getQuestion(int questionId) async {
    Question q = await questionApi.fetchQuestion(questionId);
    state = q;
  }

}

final questionProvider = StateNotifierProvider<QuestionNotifier, Question>((ref) {
  final qn = QuestionNotifier();
  return qn;
});


class CorrectAnswernNotifier extends StateNotifier<Answer> {
  final correctAnswerApi = AnswerApi();

  CorrectAnswernNotifier() : super(Answer.fromJson({"correct": false}));


  setFalse()  {
    state = Answer.fromJson({"correct": false});
  }

  getQuestionAnswer(String answer, int topicId, int questionId) async {
    Answer a = await correctAnswerApi.answerQuestion(answer, topicId, questionId);
    incrementAnswers(a.correct);
    state = a;
  }

}
final correctAnswerProvider = StateNotifierProvider<CorrectAnswernNotifier, Answer>((ref) {
  final cap = CorrectAnswernNotifier();
  return cap;
});


Future<int> getAnswerCount() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('answers')) {
    return prefs.getInt('answers')!;
  }
  return 0;
}

Future<int> getCorrectAsnwersCount() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('correct_answers')) {
    return prefs.getInt('correct_answers')!;
  }
  return 0;
}

incrementAnswers(bool isCorrect) async {
  final prefs = await SharedPreferences.getInstance();

  final answers = await getAnswerCount();
  prefs.setInt('answers', answers + 1);

  if (isCorrect) {
    final correctAnswers = await getCorrectAsnwersCount();
    prefs.setInt('correct_answers', correctAnswers + 1);
  }
}

final answerCounterProvider = FutureProvider<int>((ref) async {
  return await getAnswerCount();
});

final correctAnswerCounterProvider = FutureProvider<int>((ref) async {
  return await getCorrectAsnwersCount();
});

final isQuestionAnswerProvider = StateProvider<bool>((ref) => false);
