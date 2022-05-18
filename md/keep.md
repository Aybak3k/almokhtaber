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
___

## late kw
```dart
// wtf
```
___

## arr.push
```dart
void main(){
  List<int> intArr = [1,2,3,4,5];
  intArr.addAll([6, 7]);
  intArr.add(8);
  print(intArr);
}
```