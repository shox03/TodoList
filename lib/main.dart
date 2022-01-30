import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/routes.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('task_box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodoApp',
      initialRoute: '/',
      onGenerateRoute: (setting) => RouteManager.generaRouter(setting),
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
    );
  }
}
