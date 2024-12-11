import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> fetchLanguages() async {
  final response = await http.post(
    Uri.parse('https://countries.trevorblades.com/'),
    headers: {'Content-Type': 'application/json'},
    body: '{"query": "{ countries { name languages { name } } }"}',
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    
    // Extraindo as linguagens de cada país
    List<String> languages = [];
    for (var country in data['data']['countries']) {
      if (country['languages'] != null) {
        for (var language in country['languages']) {
          if (!languages.contains(language['name'])) {
            languages.add(language['name']);
          }
        }
      }
    }
    return languages;
  } else {
    throw Exception('Erro ao buscar linguagens: ${response.statusCode}');
  }
}
