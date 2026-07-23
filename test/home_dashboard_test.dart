import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holistq/features/home/presentation/home_dashboard_screen.dart';

void main() {
  testWidgets('renders the home dashboard sections', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeDashboardScreen()));
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('Daily Health Score'), findsOneWidget);
    expect(find.text('HolistQ'), findsWidgets);
  });
}
