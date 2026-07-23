import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holistq/app.dart';

void main() {
  testWidgets('renders the onboarding splash experience', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: HolistQApp()));
    await tester.pumpAndSettle();

    expect(find.text('HolistQ'), findsOneWidget);
  });
}
