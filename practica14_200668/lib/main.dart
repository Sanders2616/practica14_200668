// Creado por: Mauricio Ramírez López
// Asignatura: Desarrollo Móvil Integral
// Grado y Grupo: 10°A
// Docente: Ramírez Hernández Marco Antonio
import 'package:flutter/material.dart';
import 'package:practica14_200668/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData.dark().copyWith(
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'oswald',
          ),
      appBarTheme: AppBarTheme(
        color:
            Color.fromARGB(255, 128, 0, 128), // Color de la barra de aplicación
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Color.fromARGB(
           255, 128, 0, 128), // Cambia el color de los iconos aquí
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: Color.fromARGB(255, 128, 0, 128),
      ),
    ),
  ));
}
//hola
