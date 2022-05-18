// imports
import 'package:flutter/material.dart';
import 'quiz_brain.dart';

// Vars
const String appName = "Almokhtaber";
const Color color1 = Color.fromARGB(255, 23, 22, 22);
const Color color2 = Color.fromARGB(255, 232, 220, 220);
const Color color3 = Color.fromARGB(255, 14, 116, 199);
int questionNum = 0;

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
      debugShowCheckedModeBanner: false,
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
  // props && methods

  List<Widget> answersTemplate(List<String> allAnswers) {
    List<Widget> answersWidgets = [];
    for (final a in allAnswers) {
      answersWidgets.add(Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextButton(
            style:
                ButtonStyle(backgroundColor: MaterialStateProperty.all(color3)),
            child: Text(
              a,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: color2,
                fontSize: 17.0,
              ),
            ),
            onPressed: () {
              setState(() {
                questionNum++;
              });
            },
          ),
        ),
      ));
    }
    return answersWidgets;
  }

  @override
  Widget build(BuildContext context) {
    // @widgets-here
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
                    QuestionBank.bank[questionNum].questionBody, // @TODO
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
                  children:
                      answersTemplate(QuestionBank.getAllAnswers()) // @TODO
                  ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // Icon(Icons.check, color: Colors.green),
                    // Icon(Icons.close, color: Colors.red),
                    Icon(Icons.question_mark, color: Colors.pink),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
