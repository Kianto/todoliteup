import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:todoliteup/injection_container.dart' as di;
import 'package:todoliteup/main.dart';
import 'package:todoliteup/res/const.dart';

void main() {
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
    // arrange
    await tester.pumpWidget(const MyApp());
    await tester.pump();
  });
}
