import 'package:complete_app/core/routing/app_router.dart';
import 'package:complete_app/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doc App',
      home: DocApp(appRouter: AppRouter(),),
    );
  }
}

