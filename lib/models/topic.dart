
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