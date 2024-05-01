import 'package:flutter/material.dart';

class SegmentedButtonProvider extends ChangeNotifier {
  Set<int> _selectedSegments = {};

  Set<int> get selectedSegments => _selectedSegments;

  set selectedSegment(Set<int> value) {
    _selectedSegments = value;
    notifyListeners();
  }
}
