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