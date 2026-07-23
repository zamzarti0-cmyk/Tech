import 'package:flutter/material.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      _ActionItem(icon: Icons.fitness_center_rounded, label: 'Start Workout'),
      _ActionItem(icon: Icons.restaurant_rounded, label: 'Log Meal'),
      _ActionItem(icon: Icons.water_drop_rounded, label: 'Log Water'),
      _ActionItem(icon: Icons.self_improvement_rounded, label: 'Meditate'),
      _ActionItem(icon: Icons.mood_rounded, label: 'Log Mood'),
      _ActionItem(icon: Icons.calendar_today_rounded, label: 'View Calendar'),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quick Actions', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            physics: const NeverScrollableScrollPhysics(),
            children: actions.map((action) => _QuickActionCard(action: action)).toList(),
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({required this.action});

  final _ActionItem action;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(action.icon, color: const Color(0xFF2563EB)),
              const SizedBox(height: 8),
              Text(action.label, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionItem {
  const _ActionItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}
