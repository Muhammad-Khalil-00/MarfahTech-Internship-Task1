import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/models/save_task.dart';

import 'Homepage.dart';

void main() {
  runApp(ChangeNotifierProvider
    (create: (context)=>SaveTask(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home:  MyHomepage(),
    );
  }
}

