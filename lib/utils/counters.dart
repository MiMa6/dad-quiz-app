import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import '../services/providers.dart';
import '../models/topic.dart';

Future<int> getAnswerCount() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.containsKey('answers')) {
    return prefs.getInt('answers')!;
  }
  return 0;
}

Future<int> getCorrectAnswersCount() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('total correct_answers')) {
    return prefs.getInt('total correct_answers')!;
  }
  return 0;
}

incrementAnswers(bool isCorrect) async {
  final prefs = await SharedPreferences.getInstance();

  final answers = await getAnswerCount();
  prefs.setInt('answers', answers + 1);

  if (isCorrect) {
    final correctAnswers = await getCorrectAnswersCount();
    prefs.setInt('total correct_answers', correctAnswers + 1);
  }
}

Future<int> getTopicAnswersCount(int topicId) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('$topicId answers')) {
    return prefs.getInt('$topicId answers')!;
  }
  return 0;
}

Future<int> getTopicCorrectAnswersCount(int topicId) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('$topicId correct_answers')) {
    return prefs.getInt('$topicId correct_answers')!;
  }
  prefs.setInt('$topicId correct_answers', 0);
  return 0;
}

incrementTopicAnswers(bool isCorrect, int topicId) async {
  final prefs = await SharedPreferences.getInstance();
  final answers = await getTopicAnswersCount(topicId);
  prefs.setInt('$topicId answers', answers + 1);

  if (isCorrect) {
    final correctAnswers = await getTopicCorrectAnswersCount(topicId);
    prefs.setInt('$topicId correct_answers', correctAnswers + 1);
  }
}

Future<Map<String, int>> getSortedCorrectAnswersDesc(ref) async {
  final prefs = await SharedPreferences.getInstance();
  final topics = ref.watch(topicProvider);

  Set<String> keys = prefs.getKeys();
  final correctAnswers = <String, int>{};

  for (String key in keys) {
    int value = prefs.getInt(key) ?? 0;
    if (key.contains("correct_answers") && !key.contains("total")) {
      String topicId = key.split(' ')[0];
      Topic topic =
          topics.firstWhere((element) => element.id.toString() == topicId);
      correctAnswers[topic.name] = value;
    }
  }

  return Map.fromEntries(correctAnswers.entries.toList()
    ..sort((e1, e2) => e2.value.compareTo(e1.value)));
}
