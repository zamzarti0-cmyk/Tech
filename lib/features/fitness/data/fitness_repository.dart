import 'package:cloud_firestore/cloud_firestore.dart';

class FitnessData {
  const FitnessData({
    required this.scoreLabel,
    required this.scoreSubtitle,
    required this.scoreValue,
    required this.recommendationTitle,
    required this.recommendationDescription,
    required this.categories,
    required this.lastWorkoutTitle,
    required this.lastWorkoutSubtitle,
    required this.challengeTitle,
    required this.challengeSubtitle,
    required this.metrics,
  });

  final String scoreLabel;
  final String scoreSubtitle;
  final String scoreValue;
  final String recommendationTitle;
  final String recommendationDescription;
  final List<String> categories;
  final String lastWorkoutTitle;
  final String lastWorkoutSubtitle;
  final String challengeTitle;
  final String challengeSubtitle;
  final List<FitnessMetric> metrics;

  factory FitnessData.fromMap(Map<String, dynamic> map) {
    final metrics = (map['metrics'] as List<dynamic>? ?? [])
        .map((item) => FitnessMetric.fromMap(item as Map<String, dynamic>))
        .toList();

    return FitnessData(
      scoreLabel: map['scoreLabel']?.toString() ?? 'Fitness Score',
      scoreSubtitle: map['scoreSubtitle']?.toString() ?? 'Weekly progress is on track',
      scoreValue: map['scoreValue']?.toString() ?? '87/100',
      recommendationTitle: map['recommendationTitle']?.toString() ?? 'Today\'s Recommended Workout',
      recommendationDescription: map['recommendationDescription']?.toString() ??
          'A balanced plan designed around your recovery and energy levels.',
      categories: (map['categories'] as List<dynamic>? ?? [])
          .map((category) => category.toString())
          .toList(),
      lastWorkoutTitle: map['lastWorkoutTitle']?.toString() ?? 'Upper Body Power Flow',
      lastWorkoutSubtitle: map['lastWorkoutSubtitle']?.toString() ?? '12 min left • 320 kcal • 3/5 sets',
      challengeTitle: map['challengeTitle']?.toString() ?? '7-Day Beginner Challenge',
      challengeSubtitle: map['challengeSubtitle']?.toString() ?? '4 of 7 days completed • +180 XP',
      metrics: metrics,
    );
  }
}

class FitnessMetric {
  const FitnessMetric({required this.label, required this.value, required this.icon});

  final String label;
  final String value;
  final String icon;

  factory FitnessMetric.fromMap(Map<String, dynamic> map) {
    return FitnessMetric(
      label: map['label']?.toString() ?? 'Metric',
      value: map['value']?.toString() ?? '0',
      icon: map['icon']?.toString() ?? 'fitness_center',
    );
  }
}

class FitnessRepository {
  FitnessRepository({FirebaseFirestore? firestore}) : _firestore = firestore;

  final FirebaseFirestore? _firestore;

  Future<FitnessData> loadFitnessData() async {
    final firestore = _firestore ?? _safeFirestore();
    if (firestore == null) {
      return _defaultData();
    }

    try {
      final snapshot = await firestore.collection('fitness').doc('dashboard').get();

      if (!snapshot.exists || snapshot.data() == null) {
        return _defaultData();
      }

      return FitnessData.fromMap(snapshot.data()!);
    } catch (_) {
      return _defaultData();
    }
  }

  FirebaseFirestore? _safeFirestore() {
    try {
      return FirebaseFirestore.instance;
    } catch (_) {
      return null;
    }
  }

  FitnessData _defaultData() {
    return const FitnessData(
      scoreLabel: 'Fitness Score',
      scoreSubtitle: 'Weekly progress is on track',
      scoreValue: '87/100',
      recommendationTitle: 'Today\'s Recommended Workout',
      recommendationDescription: 'A balanced plan designed around your recovery and energy levels.',
      categories: ['Strength', 'Cardio', 'HIIT', 'Yoga'],
      lastWorkoutTitle: 'Upper Body Power Flow',
      lastWorkoutSubtitle: '12 min left • 320 kcal • 3/5 sets',
      challengeTitle: '7-Day Beginner Challenge',
      challengeSubtitle: '4 of 7 days completed • +180 XP',
      metrics: [
        FitnessMetric(label: 'Recovery', value: '84%', icon: 'battery_charging_full'),
        FitnessMetric(label: 'Load', value: '7.2', icon: 'fitness_center'),
        FitnessMetric(label: 'Minutes', value: '54', icon: 'timer'),
        FitnessMetric(label: 'Streak', value: '9d', icon: 'local_fire_department'),
      ],
    );
  }
}
