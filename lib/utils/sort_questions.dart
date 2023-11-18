import 'package:shared_preferences/shared_preferences.dart';
import '../services/providers.dart';
import 'dart:math';

Future<int> getGenericQuestionTopicId(ref) async {
  final prefs = await SharedPreferences.getInstance();
  final topics = ref.watch(topicProvider);

  Set<String> keys = prefs.getKeys();
  final correctAnswers = <int, int>{};

  // Find all topics with correct answers
  for (String key in keys) {
    int value = prefs.getInt(key) ?? 0;
    if (key.contains("correct_answers") && !key.contains("total")) {
      String topicId = key.split(' ')[0];
      correctAnswers[int.parse(topicId)] = value;
    }
  }

  // If no correct answers found get random topicId for generic question
  if (correctAnswers.isEmpty) {
    final random = Random();
    int randomidx = random.nextInt(topics.length);
    int randomTopicId = topics[randomidx].id;
    return randomTopicId;
  } else {
    List<int> idsNotInCorrectAnswers = List<int>.from(topics
        .map((topic) => topic.id)
        .where((id) => !correctAnswers.containsKey(id))
        .toList());
    // If there are topics that have not yet correct anwers get random topicId of those for generic question
    if (idsNotInCorrectAnswers.isNotEmpty) {
      final random = Random();
      int randomidx = random.nextInt(idsNotInCorrectAnswers.length);
      int randomTopicIdWithNoCorrectAnsweres =
          idsNotInCorrectAnswers[randomidx];
      return randomTopicIdWithNoCorrectAnsweres;
      // If all topics have correct answers get topic id of least correct answer
    } else {
      Map<int, int> sortedCorrectAnswers = Map.fromEntries(
          correctAnswers.entries.toList()
            ..sort((e1, e2) => e1.value.compareTo(e2.value)));
      int topicId = sortedCorrectAnswers.keys.first;
      return topicId;
    }
  }
}
