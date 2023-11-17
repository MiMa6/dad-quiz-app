import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pages/home_page.dart';
import 'pages/statics_page.dart';
import 'pages/question_page.dart';

void main() async {
  //final prefs = await SharedPreferences.getInstance();
  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(
          path: '/topics/:topicId/questions',
          builder: (context, state) =>
              QuestionPage(topicId: int.parse(state.pathParameters['topicId']!))),
      GoRoute(path: '/statistics', builder: (context, state) => const StaticsPage()),
    ],
  );

  runApp(ProviderScope(
    //overrides: [
    //  sharedPreferencesProvider.overrideWithValue(prefs),
    //],
    child: MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue),
        textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.brown)),
      ),
    ),
  ));
}
