import 'package:bloc_poc/data/model/random_joke.dart';

abstract class JokeRepository {
  Future <Joke> getRandomJoke();
}