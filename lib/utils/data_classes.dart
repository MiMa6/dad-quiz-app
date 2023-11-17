class Question {
  final int id;
  final String question;
  final List<String> options;
  final String answer_post_path;

  Question.fromJson(Map<String, dynamic> jsonData)
    : id = jsonData['id'],
      question = jsonData['question'],
      options = List<String>.from(jsonData['options']),
      answer_post_path = jsonData['answer_post_path'];

  Map<String, dynamic> toJson() => {
      'id': id,
      'question': question,
      'options': options,
      'answer_post_path': answer_post_path,
    };
}

class Topic {
  final int id;
  final String name;
  final String question_path;


  Topic.fromJson(Map<String, dynamic> jsonData)
    : id = jsonData['id'],
      name = jsonData['name'],
      question_path = jsonData['question_path'];

  Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'question_path': question_path,
    };

}

class Answer {
  final bool correct;

  Answer.fromJson(Map<String, dynamic> jsonData)
    : correct = jsonData['correct'];

  Map<String, dynamic> toJson() => {
      'correct': correct,
    };
}

