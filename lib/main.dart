// imports
import 'package:flutter/material.dart';
import 'quiz_brain.dart';

// Colors
const String appName = "Almokhtaber";
const Color color1 = Color.fromARGB(255, 23, 22, 22);
const Color color2 = Color.fromARGB(255, 232, 220, 220);
const Color color3 = Color.fromARGB(255, 14, 116, 199);

// Vars
int questionNum = 0; // @TODO
Map<String, List> bankMap =
    QuestionBank.getBank(); // reassign to the same val when restarting the quiz
List<Icon> scoreKeeper = [];
// Icon(Icons.question_mark, color: Colors.pink) ??

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
  void reactToUserAnswer(String a) {
    setState(() {
      if (questionNum == bankMap["Questions"]!.length - 1) {
        questionNum = 0; // @TODO : show result && reset everything
        scoreKeeper = [];
      } else {
        if (a == bankMap["Correct Answers"]?[questionNum]) {
          scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
        } else {
          scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
        }
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
                  backgroundColor: MaterialStateProperty.all(color3)),
              onPressed: () {
                reactToUserAnswer(a);
              },
              child: Text(
                a,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: color2,
                  fontSize: 17.0,
                ),
              )),
        ),
      ));
    }
    return answersWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
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
                    style: const TextStyle(
                      color: color2,
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
                    children: scoreKeeper),
              ),
            )
          ],
        ),
      ),
    );
  }
}
