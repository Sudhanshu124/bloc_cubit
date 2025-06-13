import 'dart:convert';

import 'package:bloc_poc/data/model/dog_details.dart';
import 'package:bloc_poc/data/model/random_joke.dart';
import 'package:bloc_poc/util/constant.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class APiService {
  String? baseUrl = dotenv.env["BASE_URL"];
  String? jokeBaseUrl = dotenv.env['JOKE_BASE_URL'];
  Future<DogImage> fetchDogImage() async {
    try {
      final result = await http.get(Uri.parse('$baseUrl/$dogBreeds'));
      if (result.statusCode == 200 || result.statusCode == 201) {
        final Map<String, dynamic> jsonResponse = jsonDecode(result.body);
        DogImage dogImage = DogImage.fromJson(jsonResponse);
        return dogImage;
      } else {
        throw Exception("Image not found");
      }
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<Joke> getRandomeJoke() async {
    try {
      String endPoint = 'random_joke';
      final rseponse = await http.get(
        Uri.parse('$jokeBaseUrl$endPoint'),
      );
      debugPrint((rseponse.body));
      if (rseponse.statusCode == 200 || rseponse.statusCode == 201) {
        Map<String, dynamic> apiResponse = jsonDecode(rseponse.body);
        Joke randomJokeObject = Joke.fromJson(apiResponse);
        return randomJokeObject;
      } else {
        throw Exception("No Jokes to show");
      }
    } catch (e) {
      rethrow;
    }
  }
}
