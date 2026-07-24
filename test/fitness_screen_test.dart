import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holistq/features/fitness/presentation/fitness_screen.dart';

void main() {
  testWidgets('Fitness screen shows dashboard and workout sections', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: FitnessScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Fitness'), findsWidgets);
    expect(find.text('Fitness Score'), findsOneWidget);
    expect(find.text('AI Recommended Workout'), findsOneWidget);
    expect(find.text('Workout Categories'), findsOneWidget);
  });
}
