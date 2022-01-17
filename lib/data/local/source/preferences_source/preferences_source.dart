abstract class PreferencesSource {
  Future<void> saveIsLoggedIn(bool value);

  Future<bool> getIsLoggedIn();

  Future<void> clearIsLoggedIn();
}
