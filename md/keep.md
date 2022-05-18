### app window title
```dart
MaterialApp(
    // like <title>{appName}</title>
    title: appName,
)
```
___

### passing vars (title) accross
```dart
// 1)
home: MyHomePage(title: appName)
// 2)
const MyHomePage({Key? key, required this.title})  // ...
// 3)
appBar: AppBar(
title: Text(widget.title),
),
```
___

### widget.title
```dart
title: Text(widget.title)
    // kinda like this.title
    // notice: u calling a method that calls another && arg is passed in line
```
___

## Align Text
```dart
Text(
    'Aybak3k',
    textAlign: TextAlign.center,
)
```