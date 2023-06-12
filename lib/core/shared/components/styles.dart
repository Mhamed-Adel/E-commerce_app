import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/services/services.dart';

import 'constants.dart';

class ThemeServices {
  MyServices myServices = Get.find();
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: kdefaultColor,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: kdefaultColor,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.teal,
    ),
    scaffoldBackgroundColor: const Color(0xFFF9F9F9),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF9F9F9),
        elevation: 0.0,
        iconTheme: IconThemeData(color: kdefaultColor),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: kdefaultColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.teal,
      cardColor: const Color.fromARGB(255, 41, 41, 41),
      
    ),
    scaffoldBackgroundColor: Colors.black.withOpacity(.5),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 57, 56, 56),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        )),
    
  );

  _saveThemeMode(bool isDark) {
    myServices.sharedPreferences.setBool('isDark', isDark);
  }

  bool _getThemeMode() {
    return myServices.sharedPreferences.getBool('isDark') ?? false;
  }

  ThemeMode getTheme() => _getThemeMode() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_getThemeMode() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeMode(!_getThemeMode());
  }
}
