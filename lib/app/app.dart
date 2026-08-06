import 'package:flutter/material.dart';

import 'app_router.dart';
import 'app_theme.dart';

class FixMateApp extends StatelessWidget {
  const FixMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FixMate',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRouter.splash,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}