import 'package:bloc/bloc.dart';
import 'package:bloc_poc/data/model/random_joke.dart';
import 'package:bloc_poc/domain/repository_impl/jokes_repo_impl.dart';

part 'joke_state.dart';

class JokeCubit extends Cubit<JokeState> {
  JokesRepoImpl jokeRepo;
  JokeCubit(this.jokeRepo) : super(JokeLoadingState());

  Future getJokes( ) async{
    try {
  emit(JokeLoadingState());
  Joke randomJoke = await jokeRepo.getRandomJoke();
  emit(FetchRandomJoke(randomJoke));
} on Exception catch (e) {
  emit(ErrorInLoadingJoke(e.toString()));
}
  }
}
