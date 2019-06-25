import 'package:flutter/material.dart';

///Class that manages the details view
class DetailsView extends StatelessWidget {
  ///Required public constructor
  const DetailsView(this._cardIndex);

  final int _cardIndex;

  @override
  Widget build(BuildContext context) {
    print('Opened details page');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(_cardIndex.toString())],
        ),
      ),
    );
  }
}
