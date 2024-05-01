import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_demo/features/segmented_button_demo/presentation/provider/segmented_button_provider.dart';

class SegmentedButtonDemo extends StatelessWidget {
  const SegmentedButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Segmented Button Demo'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
          child: Consumer<SegmentedButtonProvider>(
            builder: (context, segmentedButtonProvider, child) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: SegmentedButton<int>(
                      emptySelectionAllowed: true,
                      multiSelectionEnabled: true,
                      onSelectionChanged: (selectedSegments) {
                        segmentedButtonProvider.selectedSegment = selectedSegments;
                      },
                      selected: segmentedButtonProvider.selectedSegments,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      segments: const [
                        ButtonSegment<int>(
                          value: 1,
                          label: Text('Segment 1'),
                        ),
                        ButtonSegment<int>(
                          value: 2,
                          label: Text('Segment 2'),
                        ),
                        ButtonSegment<int>(
                          value: 3,
                          label: Text('Segment 3'),
                        ),
                        ButtonSegment<int>(
                          value: 4,
                          label: Text('Segment 4'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: segmentedButtonProvider.selectedSegments.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: Text('Selected Segment: ${segmentedButtonProvider.selectedSegments.elementAt(index)}'),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
