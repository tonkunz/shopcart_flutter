import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopcart_bloc_provider/settings/settings.dart';
import 'package:shopcart_bloc_provider/themes/light_theme.dart';
import 'package:shopcart_bloc_provider/themes/dark_theme.dart';
import 'package:shopcart_bloc_provider/themes/dark_yellow_theme.dart';

class ThemeBloc extends ChangeNotifier {
  var theme = lightTheme();

  ThemeBloc() {
    load();
  }

  change(String color) {
    switch (color) {
      case 'light': {
        theme = lightTheme();
        Settings.theme = "light";
        save();
        notifyListeners();
        break;
      }
      case 'dark': {
        theme = darkTheme();
        Settings.theme = "dark";
        save();
        notifyListeners();
        break;
      }
      case 'dark-yellow': {
        theme = darkYellowTheme();
        Settings.theme = "dark-yellow";
        save();
        notifyListeners();
        break;
      }
      default: {
        theme = lightTheme();
        Settings.theme = "light";
        save();
        notifyListeners();
        break;
      }
    }
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', Settings.theme);
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var theme = prefs.getString('theme');
    Settings.theme = theme == null ? 'light' : theme;
    change(Settings.theme);
  }
}