/*
import 'package:flutter/material.dart';
import '../apis_and_providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CommonFutureBuilder extends ConsumerWidget {
  const CommonFutureBuilder({
    super.key,
    super.topicId
    //super.numberFunction
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final topics = ref.watch(topicProvider);

    return FutureBuilder<int>(
      future: getAnswerCount(false),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Text('Total number of Answers: ${snapshot.data}',
              style: const TextStyle(height: 2, fontSize: 18));
        }
        return const Text('Total number of Answers: ?');
      },
    );
  }
}

*/