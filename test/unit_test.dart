// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_mhwdb_app/utils/mhw_db_api.dart';
import 'package:flutter_mhwdb_app/utils/ailment.dart';

// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
class MockClient extends Mock implements http.Client {}

void main() {
  final client = MockClient();
  const fakeAilmentData =
      '[ { "id": 0, "name": "Test", "description": "This is a test", "recovery": { "actions": [ "This is an action" ], "items": [ { "id": 0, "name": "itemTest", "description": "This is an item test", "rarity": 1, "value": 10, "carryLimit": 10 } ] }, "protection": { "items": [], "skills": [ { "id": 0, "name": "skill test", "description": "This is a skill test" } ] } } ]';
  var url = Uri.parse('https://mhw-db.com/ailments');

  // Use Mockito to return a successful response when it calls the
  // provided http.Client.
  when(client.get(url))
      .thenAnswer((_) async => http.Response(fakeAilmentData, 200));
  group("Happy path", () {
    test("Api should return ailment with the correct name", () async {
      List<Ailment> ailments = await MhwAPI.fetchAilments(client);

      expect(ailments[0].name, "Test");
    });

    test("Api should return ailment with the correct description", () async {
      List<Ailment> ailments = await MhwAPI.fetchAilments(client);

      expect(ailments[0].desc, "This is a test");
    });

    test("Api should return ailment with the correct action(s)", () async {
      List<Ailment> ailments = await MhwAPI.fetchAilments(client);

      expect(ailments[0].recov.actions[0], "This is an action");
    });

    // Item class not yet developed for api
    test("Api should return ailment with the correct item(s)", () async {
      List<Ailment> ailments = await MhwAPI.fetchAilments(client);

      expect(ailments[0].desc, "This is a test");
    }, skip: true);
  });
}
