import 'package:flutter/material.dart';
import 'package:vernost/home/home_screen.dart';
import 'package:vernost/students/all_students_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: '/',
      routes: {
        '/' : (context) => const HomeScreen(),
        '/students': (context) => const AllStudentsScreen(),
      },
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
