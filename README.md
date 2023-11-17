# DAD Quiz App

## Description
The "DAD Quiz App" is an application that opens up to the Home page upon starting. The home page, named "home_page.dart," contains the Name of the app, a clickable button to the statistics page, and a list of topics as clickable buttons with text. Clicking on one of the topic buttons routes the app to the Question page. The topics are fetched using "TopicApi" from lib/apis_and_providers/apis.dart.

The question page, named "question_page.dart," contains questions as text and answer options as clickable buttons. The questions are fetched using "QuestionApi" from lib/apis_and_providers/apis.dart. When a button is clicked, a post request is made to check if the answer is correct. Upon answering questions, text pop-ups appear saying either "Answer is false" or "Answer is true." If the answer is true, a new button pops up on the screen with the text "Get new Question." Answers are fetched using "AnswerApi" from lib/apis_and_providers/apis.dart.

Clicking the AppBar button "statistics" navigates to the Statistics page, where the total number of answers and correct answers can be viewed.

The lib/apis_and_providers/providers.dart file contains answer Providers that increase by clicking the buttons "AnswerCounterProvider" and "CorrectAnswerCounterProvider." It also contains providers for saving the state of topics, questions, and answers from API requests.

The lib/utils directory contains data_classes.dart with custom classes for Question, Topic, and Answer.


Dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  flutter_riverpod: ^2.4.0
  go_router: ^10.1.2
  http: ^1.1.0
  riverpod: ^2.4.0
  shared_preferences: ^2.2.1