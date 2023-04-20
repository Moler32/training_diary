part of '../theme/theme.dart';

ThemeData darkTheme() => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        titleSpacing: 10,
        color: Colors.black,
        centerTitle: true,
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        side: const BorderSide(
          color: Colors.grey,
        ),
        fillColor: MaterialStateProperty.all(Colors.black),
        checkColor: MaterialStateProperty.all(Colors.yellow),
        overlayColor: MaterialStateProperty.all(Colors.yellow),
      ),
      fontFamily: fontNameDefault,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.yellow,
        splashColor: Colors.yellow[700],
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: fontNameDefault,
          fontSize: largeTextSize,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontNameDefault,
          fontSize: largeTextSize,
          color: trainingTitleColor,
        ),
      ),
    );
