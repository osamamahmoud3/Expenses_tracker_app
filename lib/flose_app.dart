import 'package:expenses_repository/expenses_repository.dart';
import 'package:expenses_tracker_app/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home/blocs/cubit/flose_cubit.dart';

class FloseApp extends StatelessWidget {
  const FloseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: BlocProvider(
          create: (context) => FolseCubit(FirebaseExpensesRepo())
            ..getExpenses()
            ..getBalance(),
          child: const HomeScreen(),
        ));
  }
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade200,
      colorScheme: ColorScheme.light(
          primary: Colors.blue,
          surface: Colors.black,
          onSecondary: Colors.black,
          onSurface: Colors.grey[400]!,
          onPrimary: Colors.white,
          outline: Colors.grey,
          secondary: Colors.teal));
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      colorScheme: ColorScheme.dark(
          primary: Colors.blue,
          onPrimary: Colors.black,
          onSecondary: Colors.white,
          surface: Colors.white38,
          onSurface: Colors.black,
          outline: Colors.grey,
          secondary: Colors.teal[700]!));
}
