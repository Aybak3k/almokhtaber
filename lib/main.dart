// imports
import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// App UI
const String appName = "Almokhtaber";
const Map<String, Color> appColors = {
  "black": Color.fromARGB(255, 23, 22, 22),
  "white": Color.fromARGB(255, 232, 220, 220),
  "blue": Color.fromARGB(255, 14, 116, 199)
};

// Vars
int questionNum = 0;
Map<String, List> bankMap = QuestionBank.getBank();
List<Icon> scoreIcons = [];
int userScore = 0;

// App Entry
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // @widgets-here
    return const MaterialApp(
      title: appName,
      home: MyHomePage(title: appName),
      // debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // state config vals
  final String title; // @widget.title

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void resetQuiz() {
    bankMap = QuestionBank.getBank(); // shuffle again
    scoreIcons = [];
    questionNum = 0;
    userScore = 0;
  }

  void showScoreMsg() {
    Alert(
      context: context,
      title: "Awesome:)",
      desc: "You scored $userScore out of ${bankMap["Questions"]!.length}",
      buttons: [
        DialogButton(
            color: appColors["blue"],
            child: Text(
              'Retake It',
              style: TextStyle(
                color: appColors["white"],
                fontSize: 17.0,
              ),
            ),
            onPressed: () {
              Navigator.pop(
                  context); // PROBLEM HERE - how to get the updated context
            })
      ],
    ).show();
  }

  void controlScore(int biVal) {
    if (scoreIcons.length < bankMap["Questions"]!.length) {
      if (biVal == 0) {
        scoreIcons.add(const Icon(Icons.close, color: Colors.red));
      } else if (biVal == 1) {
        scoreIcons.add(const Icon(Icons.check, color: Colors.green));
        userScore++;
      }
    }
  }

  void reactToUserAnswer(String a) {
    setState(() {
      // Check Answer
      if (a == bankMap["Correct Answers"]?[questionNum]) {
        controlScore(1);
      } else {
        controlScore(0);
      }

      if (questionNum == bankMap["Questions"]!.length - 1) {
        showScoreMsg();
        resetQuiz();
      } else {
        questionNum++;
      }
    });
  }

  List<Widget> answersTemplate(List<String> allAnswers) {
    List<Widget> answersWidgets = [];
    for (final a in allAnswers) {
      answersWidgets.add(Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(appColors["blue"]),
            ),
            onPressed: () {
              reactToUserAnswer(a);
            },
            child: Text(
              a,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appColors["white"],
                fontSize: 17.0,
              ),
            ),
          ),
        ),
      ));
    }
    return answersWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors["black"],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    bankMap["Questions"]?[questionNum], // @TODO
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: appColors["white"],
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: answersTemplate(
                      bankMap["All Answers"]?[questionNum]) // @TODO
                  ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: scoreIcons),
              ),
            )
          ],
        ),
      ),
    );
  }
}
