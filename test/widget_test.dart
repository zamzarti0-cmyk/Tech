import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holistq/app.dart';

void main() {
  testWidgets('renders the onboarding splash experience', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: HolistQApp()));
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('HolistQ'), findsOneWidget);
  });
}
