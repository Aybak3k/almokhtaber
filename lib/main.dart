// imports

import 'package:flutter/material.dart';

// Vars
const String appName = "Almokhtaber";
const Color color1 = Color.fromARGB(255, 23, 22, 22);
const Color color2 = Color.fromARGB(255, 232, 220, 220);
const Color color3 = Color.fromARGB(255, 14, 116, 199);

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

  Widget answerTemplate(String context) {
    return (Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          style:
              ButtonStyle(backgroundColor: MaterialStateProperty.all(color3)),
          child: Text(
            context,
            style: const TextStyle(
              color: color2,
              fontSize: 17.0,
            ),
          ),
          onPressed: () {},
        ),
      ),
    ));
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
            const Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    "Where are the 3 Pyramids of Egypt located?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color2,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  answerTemplate('Cairo'),
                  answerTemplate('Al-Fayum'),
                  answerTemplate('Giza'),
                  answerTemplate('Al-Haram'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
