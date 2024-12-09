import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:social_food_app/screens/explore_screen.dart';
import 'package:social_food_app/screens/recipe_screen.dart';
import 'package:social_food_app/screens/tobuy_screen.dart';

import 'component/theme_button.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.appTitle, required this.changeThemeMode});

  final appTitle;
  final void Function(bool useLightMode) changeThemeMode;

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  int currentScreen = 0;
  List<Widget> screens = [
    ExploreScreen(),
    RecipesScreen(),
    TobuyScreen(),
  ];

  void changeScreen(int index) {
    setState(() {
      currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Busca a la propiedad context y accede a textTheme o lo que queramos
        title: Text(
          widget.appTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        //Definir botones con actions
        actions: [
          // Cuando presionamos el boton, nos lleva al metodo de changeThemeMode
          ThemeButton(changeTheme: widget.changeThemeMode)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: currentScreen,
        onTap: (value) {
          changeScreen(value);
        },
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'EXPLORE'
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Recipes'
          ),
         BottomNavigationBarItem(
          icon: Icon(Icons.explore),
         label: 'To Buy'
         )
        ]
      ),
      body: screens[currentScreen],
    );
  }
}
