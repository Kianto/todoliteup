import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:todoliteup/screens/account/account_binding.dart';
import 'package:todoliteup/screens/account/account_page.dart';
import 'package:todoliteup/screens/friends/friends_binding.dart';
import 'package:todoliteup/screens/friends/friends_page.dart';
import 'package:todoliteup/screens/login/login_binding.dart';
import 'package:todoliteup/screens/login/login_page.dart';
import 'package:todoliteup/screens/message/message_binding.dart';
import 'package:todoliteup/screens/message/message_page.dart';
import 'package:todoliteup/screens/register/register_binding.dart';
import 'package:todoliteup/screens/register/register_page.dart';
import 'package:todoliteup/screens/settings/settings_binding.dart';
import 'package:todoliteup/screens/settings/settings_page.dart';
import 'package:todoliteup/screens/support/support_binding.dart';
import 'package:todoliteup/screens/support/support_page.dart';

void main() {
  group('UI all screens', () {
    setUp(() {
      AccountBinding().dependencies();
      SettingsBinding().dependencies();
      LoginBinding().dependencies();
      MessageBinding().dependencies();
      SupportBinding().dependencies();
      FriendsBinding().dependencies();
      RegisterBinding().dependencies();
    });
    testWidgets('Run all screens', (tester) async {
      mockNetworkImagesFor(() async {
        // arrange
        final screens = [
          const AccountPage(),
          const SettingsPage(),
          const LoginPage(),
          const MessagePage(),
          const SupportPage(),
          const FriendsPage(),
          const RegisterPage(),
        ];
        for (final screen in screens) {
          await tester.pumpWidget(
            GetMaterialApp(
              home: screen,
            ),
          );
          await tester.pump();

          // assert
          expect(find.byType(screen.runtimeType), findsOneWidget);
        }
      });
    });
  });
}
