part of 'dog_image_cubit.dart';

@immutable
sealed class DogImageState {}

final class DogImageInitial extends DogImageState {
  DogImageInitial();
}
final class DogImageLoading extends DogImageState{
  DogImageLoading();
}
final class DogImageLoaded extends DogImageState {
  final DogImage dogImage;

   DogImageLoaded(this.dogImage);
}
final class DogImageError extends DogImageState {
  final String message;

   DogImageError(this.message);
}
