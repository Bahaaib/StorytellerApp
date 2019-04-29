import 'package:flutter/material.dart';
import 'package:storyteller/HomePage/home_page.dart';

// @todo #1 test pdd integration2
void main() => runApp(MaterialApp(
  home: StorytellerApp(),
      debugShowCheckedModeBanner: false,
    ));

class StorytellerApp extends StatelessWidget {
  final Widget homePage = new HomePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storyteller',
      home: homePage,
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new HomePage()
      },
    );
  }
}
