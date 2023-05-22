import 'package:flutter/material.dart';

class SideMenuProvider extends ChangeNotifier {
  static late AnimationController menuController;
  bool isOpen = false;

  String _currentPage = '';

  String get currentPage => _currentPage;

  void setCurrentPage(String routeName) {
    _currentPage = routeName;
    Future.delayed(const Duration(milliseconds: 100), () => notifyListeners());
  }

  Animation<double> movement = Tween<double>(begin: -250, end: 0).animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));
  Animation<double> opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  void openMenu() {
    isOpen = true;
    menuController.forward();
    notifyListeners();
  }

  void closeMenu() {
    isOpen = false;
    menuController.reverse();
    notifyListeners();
  }

  void toggleMenu() {
    (isOpen) ? menuController.reverse() : menuController.forward();
    isOpen = !isOpen;
  }
}
