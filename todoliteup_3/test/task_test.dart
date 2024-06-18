import 'package:flutter_test/flutter_test.dart';
import 'package:todoliteup/main.dart' as main_app;

void main() {
  group("Main - run app", () {
    testWidgets('Run App', (WidgetTester tester) async {
      // arrange
      await tester.pumpWidget(const main_app.MyApp());
      await tester.pump();
      // assert
      expect(find.byType(main_app.MyApp), findsOneWidget);
    });
  });
}
