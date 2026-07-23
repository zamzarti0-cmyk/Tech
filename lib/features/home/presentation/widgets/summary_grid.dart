import 'package:flutter/material.dart';

class SummaryGrid extends StatelessWidget {
  const SummaryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final metrics = [
      _MetricItem(icon: Icons.directions_walk_rounded, label: 'Steps', value: '10.2k', trend: '+8%'),
      _MetricItem(icon: Icons.local_fire_department_rounded, label: 'Calories', value: '1,842', trend: '+4%'),
      _MetricItem(icon: Icons.water_drop_rounded, label: 'Water', value: '2.4L', trend: '+12%'),
      _MetricItem(icon: Icons.bedtime_rounded, label: 'Sleep', value: '7.2h', trend: '+1h'),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Today\'s Summary', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.45,
            children: metrics.map((metric) => _SummaryCard(metric: metric)).toList(),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.metric});

  final _MetricItem metric;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(metric.icon, color: const Color(0xFF2563EB)),
                const Spacer(),
                Text(metric.trend, style: const TextStyle(color: Color(0xFF10B981), fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 12),
            Text(metric.label, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text(metric.value, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}

class _MetricItem {
  const _MetricItem({required this.icon, required this.label, required this.value, required this.trend});

  final IconData icon;
  final String label;
  final String value;
  final String trend;
}
