import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  Color buttonColor1 = Colors.blue;
  Color buttonColor2 = Colors.blue;
  Color buttonColor3 = Colors.blue;
  Color buttonColor4 = Colors.blue;
  void changeButtonColor1() {
    if (buttonColor1 == Colors.white) {
      buttonColor1 = Colors.blue;
    } else if (buttonColor1 == Colors.blue) {
      buttonColor1 = Colors.white;
    }
    notifyListeners();
  }

  void changeButtonColor2() {
    if (buttonColor2 == Colors.white) {
      buttonColor2 = Colors.blue;
    } else if (buttonColor2 == Colors.blue) {
      buttonColor2 = Colors.white;
    }
    notifyListeners();
  }

  void changeButtonColor3() {
    if (buttonColor3 == Colors.white) {
      buttonColor3 = Colors.blue;
    } else if (buttonColor3 == Colors.blue) {
      buttonColor3 = Colors.white;
    }
    notifyListeners();
  }

  void changeButtonColor4() {
    if (buttonColor4 == Colors.white) {
      buttonColor4 = Colors.blue;
    } else if (buttonColor4 == Colors.blue) {
      buttonColor4 = Colors.white;
    }
    notifyListeners();
  }
}