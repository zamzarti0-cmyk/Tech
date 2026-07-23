import 'package:flutter/material.dart';

class AiCoachCard extends StatelessWidget {
  const AiCoachCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('AI Coach', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text('You are only 1,500 steps away from today\'s goal. A 20-minute walk this evening will help you close the gap.'),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilledButton(onPressed: () {}, child: const Text('Start Workout')),
                  OutlinedButton(onPressed: () {}, child: const Text('View Plan')),
                  OutlinedButton(onPressed: () {}, child: const Text('Ask AI')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
