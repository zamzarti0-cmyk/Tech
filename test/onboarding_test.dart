import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holistq/features/auth/presentation/welcome_screen.dart';

void main() {
  testWidgets('renders the onboarding welcome screen', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to HolistQ'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
