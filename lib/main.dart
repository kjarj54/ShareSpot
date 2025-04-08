import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/permission_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShareSpot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PermissionScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}