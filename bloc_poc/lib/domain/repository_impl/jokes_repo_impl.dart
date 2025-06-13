import 'package:bloc_poc/data/model/random_joke.dart';
import 'package:bloc_poc/data/repository/joke_repository.dart';
import 'package:bloc_poc/data/service/api_service.dart';

class JokesRepoImpl extends JokeRepository{
  APiService getJokeApi = APiService();
  @override
  Future<Joke> getRandomJoke() async{
    try {
       return await getJokeApi.getRandomeJoke();
    } catch (e) {
      rethrow;
    }
  }
  
}