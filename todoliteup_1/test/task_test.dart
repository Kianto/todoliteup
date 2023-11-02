import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:todolite/injection_container.dart' as di;
import 'package:todolite/main.dart' as main_app;
import 'package:todolite/res/const.dart';

void main() {
  group("Main - run app", () {
    setUp(() async {
      await setUpTestHive();
      await Hive.openBox(ConstRes.appId);
      di.init();
    });
    tearDown(() async {
      await tearDownTestHive();
      await di.sl.reset();
    });

    testWidgets('Run App', (WidgetTester tester) async {
      await tester.runAsync(() async {
        // arrange
        await tester.pumpWidget(const main_app.MyApp());
        await tester.pump();
        // assert
        expect(find.byType(main_app.MyApp), findsOneWidget);
      });
    });
  });

  group("Main - run main", () {
    setUp(() async {
      await setUpTestHive();
      await Hive.openBox(ConstRes.appId);
    });
    tearDown(() async {
      await tearDownTestHive();
      await di.sl.reset();
    });

    testWidgets('Run main', (WidgetTester tester) async {
      await tester.runAsync(() async {
        // arrange
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (methodCall) async => '.',
        );
        await main_app.main();
      });
    });
  });
}
