import 'package:flutter/material.dart';

class ProvOne with ChangeNotifier {
  String name = "wael" ; 
  changename (){
    name = "basel" ; 
    notifyListeners() ; 
  }
}