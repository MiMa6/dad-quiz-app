import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/sort_questions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('DAD Quiz App'), actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ElevatedButton(
                onPressed: () => context.go("/statistics"),
                child: const Column(
                  children: [
                    Text("Statistics"),
                    Icon(
                      Icons.numbers,
                    ),
                  ],
                )),
          ),
        ]),
        body: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Choose topic below",
                  style: TextStyle(height: 5, fontSize: 20)),
              TopicList(),
            ]));
  }
}

class TopicList extends ConsumerWidget {
  const TopicList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topics = ref.watch(topicProvider);

    final items = List<Widget>.from(topics.map((topic) => Card(
          child: ElevatedButton(
            onPressed: () {
              ref.watch(questionProvider.notifier).getQuestion(topic.id);
              context.go("/topics/${topic.id}/questions");
            },
            child: Text(topic.name),
          ),
        )));

    items.add(GenericQuestion());

    if (topics.isNotEmpty) {
      return Expanded(child: ListView(children: items));
    } else {
      return const Center(child: Text("No topics available"));
    }
  }
}

class GenericQuestion extends ConsumerWidget {
  const GenericQuestion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget future = FutureBuilder<int>(
      future: getGenericQuestionTopicId(ref),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("No connection");
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('No data');
        } else {
          int topicId = snapshot.data!;
          final card = Card(
            child: ElevatedButton(
              onPressed: () {
                ref.watch(questionProvider.notifier).getQuestion(topicId);
                context.go("/topics/${topicId}/questions");
              },
              child: Text("Generic question"),
            ),
          );
          return card;
        }
      },
    );

    return future;
  }
}
