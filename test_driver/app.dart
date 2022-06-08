import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_mhwdb_app/main.dart' as app;
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:flutter_mhwdb_app/config/globals.dart' as globals;

class MockClient extends Mock implements http.Client {}

void main() {
  // This line enables the extension.
  enableFlutterDriverExtension();

  final client = MockClient();
  const fakeAilmentData =
      '[ { "id": 0, "name": "Test", "description": "This is a test", "recovery": { "actions": [ "This is an action" ], "items": [ { "id": 0, "name": "itemTest", "description": "This is an item test", "rarity": 1, "value": 10, "carryLimit": 10 } ] }, "protection": { "items": [], "skills": [ { "id": 0, "name": "skill test", "description": "This is a skill test" } ] } } ]';
  var url = Uri.parse('https://mhw-db.com/ailments');

  // Use Mockito to return a successful response when it calls the
  // provided http.Client.
  when(client.get(url))
      .thenAnswer((_) async => http.Response(fakeAilmentData, 200));

  globals.httpClient = client;

  // Call the 'main()' function of the app, or call 'runApp' with
  // any widget you are interested in testing.
  app.main();
}
