import 'package:flutter/material.dart';
import 'package:storyteller/home_page.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  HomePage createState() => new HomePage();
}
