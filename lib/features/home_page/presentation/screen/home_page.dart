import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliver_demo/features/sliver_demo/presentation/screen/sliver_demo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Flutter Demos"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SliverDemo(),
                      ),
                    );
                  },
                  child: const Text("Sliver Appbar Demo"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
