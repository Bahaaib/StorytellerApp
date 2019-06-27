import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyteller/core/models/home_model.dart';
import 'package:storyteller/ui/views/home_view.dart';

void main() {
  runApp(MaterialApp(
    home: StorytellerApp(),
    debugShowCheckedModeBanner: false,
  ));
}

///Home page State class
class StorytellerApp extends StatelessWidget {
  ///Home page widget
  final Widget homePage = HomeView();

  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: <ChangeNotifierProvider<ChangeNotifier>>[
            ChangeNotifierProvider<HomeModel>.value(notifier: HomeModel())
          ],
          child: MaterialApp(
            title: 'Storyteller',
            home: homePage,
            routes: <String, WidgetBuilder>{
              '/home': (BuildContext context) => HomeView()
            },
          ));
}
