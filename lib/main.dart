import 'package:flutter/material.dart';
import 'package:social_food_app/component/theme_button.dart';
import 'package:social_food_app/food_theme.dart';

import 'home.dart';

void main() => runApp(FoodSocilApp());

class FoodSocilApp extends StatefulWidget {

  @override
  State<FoodSocilApp> createState() => _FoodSocilAppState();
}

class _FoodSocilAppState extends State<FoodSocilApp> {
  ThemeData theme = FoodTheme.light();

  void changeThemeMode(bool isLightMode){
    setState(() {
      if(isLightMode){
        theme = FoodTheme.light();
      }
      else{
        theme = FoodTheme.dark();
      }
        });
    }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Food Social App';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: appTitle,
      home: Home(changeThemeMode: changeThemeMode,
      appTitle: appTitle),
    );
  }
}
