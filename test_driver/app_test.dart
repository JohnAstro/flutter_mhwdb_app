import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Happy path', () {
    /*
      Given I am on the Home Screen
      Then I should see "Welcome to the Monster Hunter World Database!" 
    */
    test("should be on the home screen when first booting the app", () async {
      final databaseHomeScreen = find.byValueKey('database-home');
      final welcomeTextFinder = find.byValueKey('welcome-text');

      // Given I am on the Home Screen
      expect(await driver.getText(databaseHomeScreen), "MHW Database");

      // Then I should see "Welcome to the Monster Hunter World Database!"
      expect(await driver.getText(welcomeTextFinder),
          "Welcome to the Monster Hunter World Database!");
    });
  });
}
