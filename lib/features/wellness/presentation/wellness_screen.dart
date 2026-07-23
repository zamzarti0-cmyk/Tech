import 'package:flutter/material.dart';

class WellnessScreen extends StatelessWidget {
  const WellnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wellness')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Wellness Center', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text('Meditation, sleep tracking, mood journaling, and stress tools will live here.'),
        ],
      ),
    );
  }
}
