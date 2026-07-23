import 'package:flutter/material.dart';

class ScheduleSection extends StatelessWidget {
  const ScheduleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _ScheduleItem(time: '06:30', title: 'Morning Walk', icon: Icons.directions_walk_rounded),
      _ScheduleItem(time: '12:30', title: 'Meal Plan Review', icon: Icons.restaurant_rounded),
      _ScheduleItem(time: '20:30', title: 'Meditation', icon: Icons.self_improvement_rounded),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Upcoming Schedule', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          ...items.map((item) => Card(
            child: ListTile(
              leading: Icon(item.icon, color: const Color(0xFF2563EB)),
              title: Text(item.title),
              trailing: Text(item.time),
            ),
          )),
        ],
      ),
    );
  }
}

class _ScheduleItem {
  const _ScheduleItem({required this.time, required this.title, required this.icon});

  final String time;
  final String title;
  final IconData icon;
}
