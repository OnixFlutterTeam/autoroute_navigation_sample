class AuthService {
  bool _loggedIn = false;

  String _email = '';

  String _password = '';

  bool _onSignUpComplete = false;

  bool get isLoggedIn => _loggedIn;

  bool get isSignUpComplete => _onSignUpComplete;

  String get email => _email;

  String get password => _password;

  void login(String email, String password) {
    _email = email;
    _password = password;
    _loggedIn = true;
  }

  void completeSignUp(String email, String password) {
    _email = email;
    _password = password;
    _onSignUpComplete = true;
  }

  void logOut() {
    _email = '';
    _password = '';
    _loggedIn = false;
    _onSignUpComplete = false;
  }
}
