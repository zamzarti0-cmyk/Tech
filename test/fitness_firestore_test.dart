import 'package:flutter_test/flutter_test.dart';
import 'package:holistq/features/fitness/data/fitness_repository.dart';

void main() {
  group('FitnessData', () {
    test('parses a Firestore document into UI-friendly fields', () {
      final data = FitnessData.fromMap({
        'scoreLabel': 'Fitness Score',
        'scoreValue': '91/100',
        'scoreSubtitle': 'Momentum is building',
        'recommendationTitle': 'Power Circuit',
        'recommendationDescription': 'A short high-energy session built around strength and mobility.',
        'categories': ['Strength', 'HIIT', 'Recovery'],
        'lastWorkoutTitle': 'Upper Body Power Flow',
        'lastWorkoutSubtitle': '10 min left • 280 kcal • 4/5 sets',
        'challengeTitle': '7-Day Beginner Challenge',
        'challengeSubtitle': '6 of 7 days completed • +240 XP',
        'metrics': [
          {'label': 'Recovery', 'value': '88%', 'icon': 'battery_charging_full'},
          {'label': 'Load', 'value': '6.4', 'icon': 'fitness_center'},
        ],
      });

      expect(data.scoreLabel, 'Fitness Score');
      expect(data.scoreValue, '91/100');
      expect(data.recommendationDescription,
          'A short high-energy session built around strength and mobility.');
      expect(data.categories, ['Strength', 'HIIT', 'Recovery']);
      expect(data.metrics.length, 2);
      expect(data.metrics.first.label, 'Recovery');
    });
  });
}
