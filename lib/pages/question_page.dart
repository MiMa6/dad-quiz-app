import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/providers.dart';
import 'package:go_router/go_router.dart';

class QuestionPage extends ConsumerStatefulWidget {
  const QuestionPage({super.key, required this.topicId});
  final int topicId;
  @override
  ConsumerState<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends ConsumerState<QuestionPage> {
  @override
  //Widget build(BuildContext context, WidgetRef ref) {
  Widget build(BuildContext context) {
    final questionClass = ref.watch(questionProvider);
    final isCorrectAnswer = ref.watch(correctAnswerProvider);
    final isCorrectAnswerNotifier = ref.watch(correctAnswerProvider.notifier);
    final isQuestionAnswered = ref.watch(isQuestionAnsweredProvider);

    resetQuestionStates(ref) {
      ref.watch(correctAnswerProvider.notifier).setFalse();
      ref.watch(isQuestionAnsweredProvider.notifier).state = false;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('DAD Quiz App'), 
          actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              resetQuestionStates(ref);
              context.go("/statistics");
            },
            child: const Column(children: [Text("Statistics"),Icon(Icons.numbers,),],)
          ),
          ElevatedButton(
            onPressed: () {
              resetQuestionStates(ref);
              context.go("/");
            },
            child: const Column(children: [Text("Topics"),Icon(Icons.topic,),],)
          ),
          ]
        ),

        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          
          // Show image if question have one
          (questionClass.image_url != "")
            ? Image.network(questionClass.image_url)
            : Container(),
          Center(
              child: Text(questionClass.question,
                  style: const TextStyle(height: 5, fontSize: 20))),
     
          // When question answered shows if answer was true or false
          (isQuestionAnswered)
              ? Center(
                  child: Text('Answer is ${isCorrectAnswer.correct}',
                      style: const TextStyle(height: 2, fontSize: 16)))
              : Container(),
      
          // Shows list of questions
          Expanded(
              child: ListView.builder(
            itemCount: questionClass.options.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(2),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  onPressed: () {
                    ref.watch(isQuestionAnsweredProvider.notifier).state = true;
                    isCorrectAnswerNotifier.getQuestionAnswer(
                        questionClass.options[index],
                        widget.topicId,
                        questionClass.id);
                    context.go("/topics/${widget.topicId}/questions");
                  },
                  child: Text(questionClass.options[index]),
                ),
              );
            },
          )),

          // When answer is true code below shows button to get new question
          (isCorrectAnswer.correct == true)
              ? ElevatedButton(
                  onPressed: () {
                    ref
                        .watch(questionProvider.notifier)
                        .getQuestion(widget.topicId);
                    resetQuestionStates(ref);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 148, 242, 39),
                  ),
                  child: const Text("Get new Question"),
                )
              : Container(),
        ]));
  }
}
