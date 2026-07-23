import 'package:flutter/material.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Achievements & Streaks', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('7 day streak • Level 4', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text('You earned the “Consistency” badge this week.'),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(value: 0.72, minHeight: 10, borderRadius: BorderRadius.circular(999)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
