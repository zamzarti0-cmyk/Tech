import 'package:flutter/material.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Weekly Progress', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Text('Steps', style: Theme.of(context).textTheme.titleMedium)),
                      const Text('82% of goal'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(value: 0.82, minHeight: 10, borderRadius: BorderRadius.circular(999)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
