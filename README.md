# DAD Quiz App

## Link to app website
https://mima6.github.io/quiz-site/

## Description
The **DAD Quiz App** is an multiple choise question application. When starting the app it shows Home page with questions.

### Home page
**"home_page.dart"** contains App bar with the Name of the app, a clickable button to the statistics page, and a list of topics as clickable buttons with text. In addition there is button "Generic question" to fetch question with least correct asnwers. It chooses either random question based on all Clicking on one of the topic buttons routes the app to the Question page. The topics are fetched using "TopicApi" from lib/apis_and_providers/apis.dart.

### Question apge
**"question_page.dart"** contains questions as text and answer options as clickable buttons. The questions are fetched using "QuestionApi" from **"lib/services/apis.dart"**. When a button is clicked, a post request is made to check if the answer is correct. Upon answering questions, text pop-ups appear saying either "Answer is false" or "Answer is true." If the answer is true, a new button pops up on the screen with the text "Get new Question." Answers are fetched using "AnswerApi" from lib/apis_and_providers/apis.dart.

### Statistics page
**"statistics_page.dart"** appears by clicking the AppBar button "statistics" where the total number of answers and correct answers can be viewed. The page includes also correct answers per topic sorted by correct answers in descending order 

### Models
**"lib/models"** contains dart files for each custom data classes (Question, Topic, and Answer).

### Services
**"lib/services/providers"** contains providers.dart to save state of topics, questions, if the answer is correct and if the questions is answered, 
**"lib/services/apis"** contains TopicApi for getting topics, questions and answers

## Utils
**"lib/utils/counters"**  contains counter functions that increase answers and correct answers saved to SharedPreferences.
**"lib/utils/sort_questions"**  contains logic for sorting topic ids based on correct ansers


## Dependencies from pubspec.yaml:
* cupertino_icons: ^1.0.2
* flutter_riverpod: ^2.4.0
* go_router: ^10.1.2
* http: ^1.1.0
* riverpod: ^2.4.0
* shared_preferences: ^2.2.1


## Key challanges
1. Understanding how the provider notifiers work
2. State management
3. Statistic page logic

## Key learnings
1. Using FutureBuilders
2. Using multiple pages
3. State management
