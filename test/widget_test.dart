import 'package:flutter_test/flutter_test.dart';
import 'package:add_to_cart/core/di/injection.dart';
import 'package:add_to_cart/main.dart';

void main() {
  testWidgets('App loads menu smoke test', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await getIt.reset();
    configureDependencies();

    await tester.pumpWidget(const MyApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Sea Food'), findsOneWidget);
    expect(find.text('Search for a meal'), findsOneWidget);
  });
}
