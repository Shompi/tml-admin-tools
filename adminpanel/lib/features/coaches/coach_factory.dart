import 'dart:convert';
import "package:http/http.dart" as http;

class Coach {
  final String name;
  final String id;
  final String? about_me;
  final bool is_active;
  final List<String> skills;
  final List<String> preferred_games;
  final String? image_url;
  final List<String> socials;

  Coach({
    required this.name,
    required this.id,
    required this.about_me,
    required this.image_url,
    required this.is_active,
    required this.preferred_games,
    required this.skills,
    required this.socials,
  });

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      id: json["id"] as String,
      name: json["name"] as String? ?? "<Coach sin nombre>",
      about_me: json["about_me"] as String?,
      image_url: json["image_url"] as String?,
      is_active: json["is_active"] as bool,
      preferred_games: List<String>.from(
        json["preferred_games"] as List? ?? [],
      ),
      skills: List<String>.from(json["skills"] as List? ?? []),
      socials: List<String>.from(json["socials"] as List? ?? []),
    );
  }
}

// Get Coaches List
Future<List<Coach>> getCoaches() async {
  final response = await http.get(
    Uri.parse('https://api.shompiflen.party/coaching/coach'),
    headers: {'Accept': 'application/json'},
  );

  if (response.statusCode != 200) throw Exception("Failed to fetch coaches.");

  final List<dynamic> jsonList = jsonDecode(response.body);

  // print(jsonList);

  return jsonList
      .map((item) => Coach.fromJson(item as Map<String, dynamic>))
      .toList();
}
