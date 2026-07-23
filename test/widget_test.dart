import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holistq/app.dart';

void main() {
  testWidgets('renders the app shell with bottom navigation', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: HolistQApp()));
    await tester.pumpAndSettle();

    expect(find.text('HolistQ'), findsWidgets);
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
  });
}
