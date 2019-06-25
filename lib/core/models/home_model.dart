import 'package:flutter/material.dart';
import 'package:storyteller/ui/views/details_view.dart';

///Home Page Model
class HomeModel extends ChangeNotifier {
  int _index = 3;

  ///index getter
  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }

  ///Story page navigator
  void navigateToPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<DetailsView>(
        builder: (BuildContext context) => DetailsView(index)));
  }
}
