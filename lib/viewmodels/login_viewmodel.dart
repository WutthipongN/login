import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  String username = '';
  String password = '';
  bool obscurePassword = true;
  String? errorMessage;

  void togglePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void setUsername(String value) {
    username = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  bool validateInputs() {
    if (username.isEmpty || password.isEmpty) {
      errorMessage = "กรุณากรอกข้อมูลให้ครบถ้วน";
      notifyListeners();
      return false;
    }

    if (username != 'user' || password != '1234') {
      errorMessage = "ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง";
      notifyListeners();
      return false;
    }

    errorMessage = null;
    notifyListeners();
    return true;
  }
}
