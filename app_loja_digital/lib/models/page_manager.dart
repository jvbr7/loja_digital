import 'package:flutter/material.dart';

class PageManager with ChangeNotifier {
  PageManager(this._pageController) {
    _pageController.addListener(() {
      final newPage = _pageController.page?.round() ?? 0;
      if (newPage != _currentPage) {
        _currentPage = newPage;
        notifyListeners();
      }
    });
  }

  final PageController _pageController;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  void setPage(int value) {
    _pageController.jumpToPage(value);
  }
}
