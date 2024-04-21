import 'dart:math';
import 'package:flutter/material.dart';

class RandomNumberEffectProvider extends ChangeNotifier {
  int _firstDigit = 0;
  int get firstDigit => _firstDigit;

  int _secondDigit = 0;
  int get secondDigit => _secondDigit;

  int _thirdDigit = 0;
  int get thirdDigit => _thirdDigit;

  int _fourthDigit = 0;
  int get fourthDigit => _fourthDigit;

  bool _isFirstDigitSet = false;
  bool _isSecondDigitSet = false;
  bool _isThirdDigitSet = false;
  bool _isFourthDigitSet = false;

  set firstDigit(int value) {
    _firstDigit = value;
    notifyListeners();
  }

  set secondDigit(int value) {
    _secondDigit = value;
    notifyListeners();
  }

  set thirdDigit(int value) {
    _thirdDigit = value;
    notifyListeners();
  }

  set fourthDigit(int value) {
    _fourthDigit = value;
    notifyListeners();
  }

  void assignValues(String num) {
    firstDigit = int.parse(num[0]);
    secondDigit = int.parse(num[1]);
    thirdDigit = int.parse(num[2]);
    fourthDigit = int.parse(num[3]);
  }

  void showEffect({required String num}) async {
    _isFirstDigitSet = false;
    _isSecondDigitSet = false;
    _isThirdDigitSet = false;
    _isFourthDigitSet = false;
    while (!_isFirstDigitSet) {
      firstDigit = Random().nextInt(10);
      while (!_isSecondDigitSet) {
        firstDigit = Random().nextInt(10);
        secondDigit = Random().nextInt(10);
        while (!_isThirdDigitSet) {
          firstDigit = Random().nextInt(10);
          secondDigit = Random().nextInt(10);
          thirdDigit = Random().nextInt(10);
          while (!_isFourthDigitSet) {
            firstDigit = Random().nextInt(10);
            secondDigit = Random().nextInt(10);
            thirdDigit = Random().nextInt(10);
            fourthDigit = Random().nextInt(10);
            if (fourthDigit == int.parse(num[3])) {
              _isFourthDigitSet = true;
            }
            await Future.delayed(const Duration(milliseconds: 10), () {
              notifyListeners();
            });
          }
          if (thirdDigit == int.parse(num[2])) {
            _isThirdDigitSet = true;
          }
          await Future.delayed(const Duration(milliseconds: 15), () {
            notifyListeners();
          });
        }
        if (secondDigit == int.parse(num[1])) {
          _isSecondDigitSet = true;
        }
        await Future.delayed(const Duration(milliseconds: 20), () {
          notifyListeners();
        });
      }
      if (firstDigit == int.parse(num[0])) {
        _isFirstDigitSet = true;
      }
      await Future.delayed(const Duration(milliseconds: 25), () {
        notifyListeners();
      });
    }
  }
}
