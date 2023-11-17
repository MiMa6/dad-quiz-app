import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../apis_and_providers/providers.dart';

class StaticsPage extends StatelessWidget {
  const StaticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('DAD Quiz App'),
            backgroundColor:Colors.brown[300],
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  context.go("/");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.brown[300],
                ),
              child: const Column(children: [Text("Topics"),Icon(Icons.topic,),],)
              ),
            ]),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const Center(child: Text("Statistics", style: TextStyle(height: 5, fontSize: 20),)),
          FutureBuilder<int>(
            future: getAnswerCount(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Text('Answers: ${snapshot.data}', style: const TextStyle(height: 2, fontSize: 15));
              }
              return const Text('Answers: ?');
            },
          ),
          FutureBuilder<int>(
            future: getCorrectAsnwersCount(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Text('Correct Answers: ${snapshot.data}', style: const TextStyle(height: 2, fontSize: 15));
              }
              return const Text('Correct Answers: ?');
            },
          ),
        ]));
  }
}
