import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/counters.dart';

class StaticsPage extends ConsumerWidget {
  const StaticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Scaffold(
        appBar: AppBar(
            title: const Text('DAD Quiz App'),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    context.go("/");
                  },
                  child: const Column(
                    children: [
                      Text("Topics"),
                      Icon(
                        Icons.topic,
                      ),
                    ],
                  )),
            ]),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Statistics",
                  style: TextStyle(height: 4, fontSize: 26),
                )
              ),

              // Show total amount of answers and correct answers
              Column(
                children: [  
                  FutureBuilder<int>(
                    future: getAnswerCount(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                    return ListTile(
                          title: const Text("Total"),
                          subtitle: Text('Answers: ${snapshot.data}'),
                        );
                      }
                      return const Text('Answers: ?');
                    },
                  ),
                ],
              ),
              FutureBuilder<int>(
                future: getCorrectAnswersCount(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListTile(
                          title: const Text("Total"),
                          subtitle: Text('Correct: ${snapshot.data}'),
                        );
                  }
                  return const Text('Total number of  Correct Answers: 0');
                },
              ),


              const Center(
                child: Text(
                  'Correct per Topic',
                  style: TextStyle(height: 4, fontSize: 22),
                )
              ),
              
              // Show the correct answers per topic
              FutureBuilder<Map<String, int>>(
                future: getSortedCorrectAnswers(ref), // Replace with your actual future function
                builder: (BuildContext context, AsyncSnapshot<Map<String, int>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData) {
                    return const Text('No data');
                  } else {
                    
                    Map<String, int> sortedCorrectAnswers = snapshot.data!;
        

                    ListView items =  ListView.builder(
                      itemCount: sortedCorrectAnswers.length,
                      itemBuilder: (BuildContext context, int index) {
                        String key = sortedCorrectAnswers.keys.elementAt(index);
                        int value = sortedCorrectAnswers.values.elementAt(index);
                        return ListTile(
                          title: Text(key),
                          subtitle: Text('Correct: $value'),
                        );
                      },
                    );

                    return Flexible(child:  items);
                  }
                },
              ),

            ]));
  }
}
