import 'package:flutter/material.dart';
import 'package:scube_task/src/core/theme/app_theme.dart';
import 'package:scube_task/src/features/auth/presentation/screens/login_screen.dart';

void main() {
  runApp(const Scube());
}

class Scube extends StatelessWidget {
  const Scube({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scube',
      theme: AppTheme.buildAppTheme(context: context),
      home: const LoginScreen(),
    );
  }
}
