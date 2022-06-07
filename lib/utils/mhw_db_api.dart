import 'package:flutter_mhwdb_app/utils/ailment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MhwAPI {
  static Future<List<Ailment>> fetchAilments(http.Client client) async {
    var url = Uri.parse('https://mhw-db.com/ailments');

    // Get response from client given url
    final response = await client.get(url);

    // Decode jason response from api to a Map<String, dynamic> variable
    var json = jsonDecode(response.body) as List;
    List<Ailment> names =
        json.map((namejson) => Ailment.fromJson(namejson)).toList();
    // If HTTP status code 200 (i.e., successful) return the ailments\
    if (response.statusCode == 200) {
      return names;
    } else {
      throw Exception('Failed to load Ailments');
    }
  }
}
