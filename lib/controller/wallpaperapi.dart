import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/model/model.dart';

class ApiOP {
  static List<Photosmodel> trandingWallPaper = [];
  static Future<List<Photosmodel>> getTrendingWallpaper(String query) async {
    const String apiKey =
        "h1O7cy2x5gdu6iFAQGBYBJa0vLsB0Hg8G7PssUHxbRPdO8bfwpgZ4kQz"; // Replace with your Pexels API key
    final String url =
        'https://api.pexels.com/v1/search?query=$query&per_page=15&page=1';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': apiKey,
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> photos = jsonResponse['photos'];
      photos.forEach((element) {
        trandingWallPaper.add(Photosmodel.fromApi2App(element));
      });

      return trandingWallPaper;
    } else {
      throw Exception('Failed to load images');
    }
  }
}
