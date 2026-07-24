import 'package:flutter/material.dart';
import 'package:holistq/features/fitness/data/fitness_repository.dart';

class FitnessScreen extends StatefulWidget {
  const FitnessScreen({super.key});

  @override
  State<FitnessScreen> createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {
  late final FitnessRepository _repository;
  FitnessData? _data;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _repository = FitnessRepository();
    _loadFitnessData();
  }

  Future<void> _loadFitnessData() async {
    setState(() => _isLoading = true);
    final data = await _repository.loadFitnessData();
    if (!mounted) return;
    setState(() {
      _data = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final data = _data;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.18),
      appBar: AppBar(
        title: const Text('Fitness'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadFitnessData,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
                children: [
                  _HeroCard(
                    title: data?.scoreLabel ?? 'Fitness Score',
                    subtitle: data?.scoreSubtitle ?? 'Weekly progress is on track',
                    value: data?.scoreValue ?? '87/100',
                    accent: colorScheme.primary,
                    trailing: const Icon(Icons.auto_awesome),
                  ),
                  const SizedBox(height: 14),
                  const _SectionTitle(title: 'AI Recommended Workout'),
                  _RecommendationCard(
                    title: data?.recommendationTitle ?? 'Today\'s Recommended Workout',
                    description: data?.recommendationDescription ??
                        'A balanced plan designed around your recovery and energy levels.',
                    colorScheme: colorScheme,
                  ),
                  const SizedBox(height: 16),
                  const _SectionTitle(title: 'Workout Categories'),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: (data?.categories ?? const ['Strength', 'Cardio', 'HIIT', 'Yoga'])
                        .map((category) => _CategoryChip(label: category, icon: _categoryIcon(category)))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  const _SectionTitle(title: 'Continue Last Workout'),
                  _InfoCard(
                    title: data?.lastWorkoutTitle ?? 'Upper Body Power Flow',
                    subtitle: data?.lastWorkoutSubtitle ?? '12 min left • 320 kcal • 3/5 sets',
                    icon: Icons.play_circle_fill,
                    accent: Colors.deepPurpleAccent,
                  ),
                  const SizedBox(height: 16),
                  const _SectionTitle(title: 'Recovery & Load'),
                  _MetricGrid(metrics: data?.metrics ?? const [], colorScheme: colorScheme),
                  const SizedBox(height: 16),
                  const _SectionTitle(title: 'Challenges'),
                  _InfoCard(
                    title: data?.challengeTitle ?? '7-Day Beginner Challenge',
                    subtitle: data?.challengeSubtitle ?? '4 of 7 days completed • +180 XP',
                    icon: Icons.emoji_events,
                    accent: colorScheme.secondary,
                  ),
                ],
              ),
      ),
    );
  }

  IconData _categoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'strength':
        return Icons.fitness_center;
      case 'cardio':
        return Icons.directions_run;
      case 'hiit':
        return Icons.speed;
      case 'yoga':
        return Icons.self_improvement;
      case 'running':
        return Icons.route;
      default:
        return Icons.accessibility_new;
    }
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.accent,
    required this.trailing,
  });

  final String title;
  final String subtitle;
  final String value;
  final Color accent;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      color: accent.withValues(alpha: 0.12),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 6),
                  Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 10),
                  Text(value, style: Theme.of(context).textTheme.displaySmall),
                ],
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard({required this.title, required this.description, required this.colorScheme});

  final String title;
  final String description;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.lightbulb, color: colorScheme.primary),
                const SizedBox(width: 8),
                Text(title),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                FilledButton(onPressed: () {}, child: const Text('Start Workout')),
                OutlinedButton(onPressed: () {}, child: const Text('View Plan')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 156,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Row(
            children: [
              Icon(icon, size: 20),
              const SizedBox(width: 10),
              Expanded(child: Text(label)),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: accent.withValues(alpha: 0.16), child: Icon(icon, color: accent)),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}

class _MetricGrid extends StatelessWidget {
  const _MetricGrid({required this.metrics, required this.colorScheme});

  final List<FitnessMetric> metrics;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final metricItems = metrics.isEmpty
        ? [
            const FitnessMetric(label: 'Recovery', value: '84%', icon: 'battery_charging_full'),
            const FitnessMetric(label: 'Load', value: '7.2', icon: 'fitness_center'),
            const FitnessMetric(label: 'Minutes', value: '54', icon: 'timer'),
            const FitnessMetric(label: 'Streak', value: '9d', icon: 'local_fire_department'),
          ]
        : metrics;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.35,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: metricItems.length,
      itemBuilder: (context, index) {
        final metric = metricItems[index];
        final icon = _iconFromName(metric.icon);
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: colorScheme.primary),
                const Spacer(),
                Text(metric.value, style: Theme.of(context).textTheme.titleLarge),
                Text(metric.label, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        );
      },
    );
  }

  IconData _iconFromName(String name) {
    switch (name) {
      case 'battery_charging_full':
        return Icons.battery_charging_full;
      case 'fitness_center':
        return Icons.fitness_center;
      case 'timer':
        return Icons.timer;
      case 'local_fire_department':
        return Icons.local_fire_department;
      default:
        return Icons.bar_chart;
    }
  }
}
