import 'package:flutter/foundation.dart';

class ProviderApp with ChangeNotifier{

  //declare current page state
  int _currentPage = 0;

  //set to update current page state
  set currentPage(int number){
    _currentPage = number;
    notifyListeners();
  }

  //get current page state
  get currentPage => _currentPage;


}