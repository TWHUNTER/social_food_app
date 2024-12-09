import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  // Tiene que borrar el const porque recibe variable o una accion)
  // En Dart se usa {} para decir que la variable es NOMBRADO
  ThemeButton({super.key, required this.changeTheme});

  final Function changeTheme;

  @override
  Widget build(BuildContext context) {
    final isBright = Theme.of(context).brightness == Brightness.light;
    return IconButton(
        onPressed:() {
          changeTheme(!isBright);
        },
        icon: isBright
            ? Icon(Icons.light_mode_outlined)
            : Icon(Icons.dark_mode_outlined)
    );
  }
}
