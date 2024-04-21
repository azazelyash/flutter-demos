import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_demo/features/random_number_effect/presentation/provider/random_number_effect_provider.dart';

class RandomNumbersEffect extends StatefulWidget {
  const RandomNumbersEffect({super.key});

  @override
  State<RandomNumbersEffect> createState() => _RandomNumbersEffectState();
}

class _RandomNumbersEffectState extends State<RandomNumbersEffect> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Random Numbers Effect'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 72,
              child: TextFormField(
                maxLength: 4,
                controller: textController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter a number',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (textController.text.length != 4) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Row(
                        children: [
                          Icon(Icons.info_outline, color: Colors.white),
                          SizedBox(width: 8),
                          Text('Please enter a 4 digit number'),
                        ],
                      ),
                    ),
                  );
                  return;
                }
                if (textController.text.contains(RegExp(r'[a-zA-Z]'))) {
                  log("Invalid Input");
                  return;
                }
                context.read<RandomNumberEffectProvider>().showEffect(num: textController.text);
              },
              child: const Text('Show Effect'),
            ),
            const Spacer(),
            Consumer<RandomNumberEffectProvider>(
              builder: (context, rndNumEffectProvider, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      rndNumEffectProvider.firstDigit.toString(),
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      rndNumEffectProvider.secondDigit.toString(),
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      rndNumEffectProvider.thirdDigit.toString(),
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      rndNumEffectProvider.fourthDigit.toString(),
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
