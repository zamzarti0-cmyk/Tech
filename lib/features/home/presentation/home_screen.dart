import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HolistQ'),
        actions: const [Icon(Icons.search)],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome back', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('Build your healthiest week with HolistQ', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 16),
                    FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.auto_awesome),
                      label: const Text('Open AI Coach'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('Today', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _FeatureChip(label: 'Activity Rings'),
                _FeatureChip(label: 'Habit Tracker'),
                _FeatureChip(label: 'Progress'),
                _FeatureChip(label: 'Insights'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  const _FeatureChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(Icons.auto_awesome, size: 18),
      label: Text(label),
    );
  }
}
