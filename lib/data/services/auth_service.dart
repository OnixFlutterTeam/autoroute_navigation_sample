import 'package:auto_route_demo_flow/dependency/service_locator.dart';

class AuthService {
  String _email = '';

  String _password = '';

  bool _onSignUpComplete = false;

  Future<bool> get isLoggedIn => preferencesSource().getIsLoggedIn();

  bool get isSignUpComplete => _onSignUpComplete;

  String get email => _email;

  String get password => _password;

  void login(String email, String password) {
    _email = email;
    _password = password;
    preferencesSource().saveIsLoggedIn(true);
  }

  void completeSignUp(String email, String password) {
    _email = email;
    _password = password;
    _onSignUpComplete = true;
    preferencesSource().saveIsLoggedIn(true);
  }

  void logOut() {
    _email = '';
    _password = '';
    _onSignUpComplete = false;
    preferencesSource().clearIsLoggedIn();
  }
}
