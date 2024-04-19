import 'package:flutter/material.dart';
import 'package:sliver_demo/features/home_page/presentation/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sliver Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
