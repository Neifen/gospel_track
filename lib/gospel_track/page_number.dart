import 'package:flutter/material.dart';

class PageNumber extends ChangeNotifier {
  int currentPage = 0;
  static const int _min = 0;
  static const int _max = 4;

  changePage(int newPage) {
    currentPage = newPage;
    notifyListeners();
  }

  nextPage() {
    if (currentPage != _max) {
      currentPage++;
      notifyListeners();
    }
  }

  lastPage() {
    if (currentPage != _min) {
      currentPage--;
      notifyListeners();
    }
  }
}
