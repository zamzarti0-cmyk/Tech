import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:holistq/features/auth/presentation/splash_screen.dart';
import 'package:holistq/features/auth/presentation/welcome_screen.dart';

void main() {
  testWidgets('renders the onboarding welcome screen', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: WelcomeScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to HolistQ'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });

  testWidgets('splash screen navigates to welcome after the reveal', (tester) async {
    final router = GoRouter(
      initialLocation: '/splash',
      routes: [
        GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
        GoRoute(path: '/welcome', builder: (context, state) => const WelcomeScreen()),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump(const Duration(milliseconds: 1400));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to HolistQ'), findsOneWidget);
  });
}
