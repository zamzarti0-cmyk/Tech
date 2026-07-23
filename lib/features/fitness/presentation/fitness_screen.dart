import 'package:flutter/material.dart';

class FitnessScreen extends StatelessWidget {
  const FitnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fitness')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Fitness Hub', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text('Workouts, recovery, running, and progress dashboards will live here.'),
        ],
      ),
    );
  }
}
