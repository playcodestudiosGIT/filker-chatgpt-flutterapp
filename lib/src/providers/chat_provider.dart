import 'package:fliker/src/api/filker_api.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  List<dynamic> _models = [];
  List<dynamic> get models => _models;

  int _currentIndex = 1;

  int _indexArgumentGenerator = 0;

  TextEditingController _controller = TextEditingController();

  String _response = '';
  String _message = '';
  String _genero = 'Ficcion';

  bool _isLoading = false;

  PageController _pageController = PageController();

  PageController get pageController => _pageController;

  set pageController(PageController value) {
    _pageController = value;
    notifyListeners();
  }

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String get genero => _genero;

  set genero(String value) {
    _genero = value;
    notifyListeners();
  }

  String get message => _message;

  set message(String value) {
    _message = value;
    notifyListeners();
  }

  TextEditingController get controller => _controller;

  set controller(TextEditingController value) {
    _controller = value;
    notifyListeners();
  }

  String get response => _response;

  set response(String value) {
    _response = value;
    notifyListeners();
  }

  set models(List<dynamic> value) {
    _models = value;
    notifyListeners();
  }

  getModels(BuildContext context) async {
    try {
      _models = await FilkerApi.getModels(context);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  int get indexArgumentGenerator => _indexArgumentGenerator;

  set indexArgumentGenerator(int value) {
    _indexArgumentGenerator = value;
    notifyListeners();
  }

  Future<void> sendReqAsync() async {
    isLoading = true;
    final resp = await FilkerApi.sendReq(message, genero);
    _response = resp;
    isLoading = false;
    pageController.jumpToPage(1);
    _indexArgumentGenerator = 1;
  }
}
