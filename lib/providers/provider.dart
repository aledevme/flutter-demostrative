import 'package:flutter/foundation.dart';

class ProviderApp with ChangeNotifier{

  int _currentPage = 0;

  set currentPage(int number){
    _currentPage = number;
    notifyListeners();
  }

  get currentPage => _currentPage;


}