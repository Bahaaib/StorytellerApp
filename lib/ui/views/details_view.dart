import 'package:flutter/material.dart';
import 'package:storyteller/data.dart';

///Class that manages the details view
class DetailsView extends StatelessWidget {
  ///Required public constructor
  const DetailsView(this._cardIndex);

  final int _cardIndex;

  @override
  Widget build(BuildContext context) {
    print('Opened details page');
    return Scaffold(
      backgroundColor: const Color(0xFF2d3447),
      body: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(images[_cardIndex]),
          Padding(
            child: Text(
              title[_cardIndex],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'SF-Pro-Text-Bold'),
            ),
            padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
          ),
          Padding(
            child: Text(
              body[_cardIndex],
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  fontFamily: 'SF-Pro-Text-Regular'),
            ),
            padding: const EdgeInsets.fromLTRB(20, 20, 10, 8),
          )
        ],
      ),
      ),);
  }
}
