import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banpay/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
      theme: ThemeData(fontFamily: 'Rubik'),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    ));
  }
}
