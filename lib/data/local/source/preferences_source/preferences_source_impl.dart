import 'package:auto_route_demo_flow/arch/data/local/prefs/base_preferences.dart';
import 'package:auto_route_demo_flow/data/local/prefs/preferences_keys.dart';

import 'preferences_source.dart';

class PreferencesSourceImpl implements PreferencesSource {
  final BasePreferences _preferences;

  PreferencesSourceImpl(this._preferences);

  @override
  Future<bool> clearIsLoggedIn() async {
    return await _preferences.removePrefByKey(PrefsKeys.kIsLoggedIn);
  }

  @override
  Future<bool> getIsLoggedIn() async {
    return await _preferences.get<bool>(PrefsKeys.kIsLoggedIn, false);
  }

  @override
  Future<void> saveIsLoggedIn(bool value) async {
    await _preferences.put<bool>(PrefsKeys.kIsLoggedIn, value);
  }
}
