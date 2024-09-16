import 'package:flutter/material.dart';
import 'package:message_app/common/colour_size_icon.dart';
import 'package:message_app/presentation/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: kblack,
          brightness: Brightness.dark,
        ),
        home: const Home());
  }
}
