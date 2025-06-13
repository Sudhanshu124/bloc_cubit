part of 'joke_cubit.dart';


sealed class JokeState {}

// final class JokeInitial extends JokeState {
//   JokeInitial();
// }
final class JokeLoadingState extends JokeState{
  JokeLoadingState();
}
final class ErrorInLoadingJoke extends JokeState{
  String errorMessage;
  ErrorInLoadingJoke(this.errorMessage);
}
final class FetchRandomJoke extends JokeState{
  Joke randomJoke;

  FetchRandomJoke(this.randomJoke);
}
