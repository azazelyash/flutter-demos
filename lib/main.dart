import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_demo/features/home_page/presentation/screen/home_page.dart';
import 'package:sliver_demo/features/random_number_effect/presentation/provider/random_number_effect_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RandomNumberEffectProvider(),
        ),
      ],
      child: const MaterialApp(
        title: 'Sliver Demo',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
