import 'package:flutter/foundation.dart';

class UserProfileProvider extends ChangeNotifier {
  String _username = 'student01';

  String get username => _username;

  void changeUsername(String newName) {
    _username = newName;
    notifyListeners();
  }
}
