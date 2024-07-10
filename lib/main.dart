import 'package:flutter/material.dart';
import 'package:rive_animations/state_restoration_example.dart';

void main() {
  runApp(const RootRestorationScope(
    restorationId: "root",
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      restorationScopeId: "root",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StateRestorationExample(),
    );
  }
}
