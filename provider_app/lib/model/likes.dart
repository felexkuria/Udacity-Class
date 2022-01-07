import 'package:flutter/material.dart';

class Likes with ChangeNotifier {
  int likes = 0;
  bool isliked = false;

  isToggled() {
    isliked == true ? likes++ : likes--;
    //print(likes);
    notifyListeners();
    return isliked = !isliked;
  }
}
