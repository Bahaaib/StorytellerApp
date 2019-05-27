import 'package:flutter/material.dart';
import 'package:storyteller/HomePage/home_page.dart';

void main() => runApp(MaterialApp(
  home: StorytellerApp(),
      debugShowCheckedModeBanner: false,
    ));

///Home page State class
class StorytellerApp extends StatelessWidget {
  ///Home page widget
  final Widget homePage = const HomePage();

  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        title: 'Storyteller',
        home: homePage,
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => const HomePage()
        },
      );
}
