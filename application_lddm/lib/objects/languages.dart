import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> fetchLanguages() async {
  print("Fetching languages...");
  try {
    final response = await http.get(Uri.parse("https://restcountries.com/v3.1/all"));
    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final Set<String> languageSet = {};

      for (var country in data) {
        if (country['languages'] != null) {
          country['languages'].forEach((key, value) {
            languageSet.add(value.toString());
          });
        }
      }

      return languageSet.toList()..sort();
    } else {
      throw Exception('Falha ao carregar as línguas');
    }
  } catch (e) {
    print("Erro: $e");
    return [];
  }
}
  