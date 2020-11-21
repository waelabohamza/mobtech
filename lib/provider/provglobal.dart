import 'package:flutter/material.dart';

class ProvGlobal with ChangeNotifier {
  String country = "syria";
  pricecountry_sy() {
    country = "syria";
    notifyListeners();
  }

  pricecountry_eg() {
    country = "egypt";
    notifyListeners();
  }

  pricecountry_sa() {
    country = "sadui";
    notifyListeners();
  }
}
