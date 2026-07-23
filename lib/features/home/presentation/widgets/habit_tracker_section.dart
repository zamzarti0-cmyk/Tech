import 'package:flutter/material.dart';

class HabitTrackerSection extends StatelessWidget {
  const HabitTrackerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final habits = ['Drink Water', 'Exercise', 'Meditation', 'Stretch'];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Habit Tracker', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          ...habits.map((habit) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.check_circle_outline_rounded, color: Color(0xFF10B981)),
                title: Text(habit),
                trailing: const Text('3 days'),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
