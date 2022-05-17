// imports

import 'package:flutter/material.dart';

// Vars
const String appName = "Almokhtaber";
const Color mainColor = Color.fromARGB(255, 23, 22, 22);

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
  // props &&

  @override
  Widget build(BuildContext context) {
    // @widgets-here
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Expanded(
              flex: 5,
              child: Center(
                child: Text("Where are the 3 Pyramids of Egypt located?"),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: const [
                  Expanded(child: Text('Cairo')),
                  Expanded(child: Text('Giza')),
                  Expanded(child: Text('Haram')),
                  Expanded(child: Text('Fayum'))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: const [
                  Icon(Icons.check, color: Colors.green),
                  Icon(Icons.close, color: Colors.red)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
