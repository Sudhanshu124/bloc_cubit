import 'package:bloc/bloc.dart';
import 'package:bloc_poc/data/model/dog_details.dart';
import 'package:bloc_poc/domain/repository_impl/dog_detail_repo_impl.dart';
import 'package:meta/meta.dart';

part 'dog_image_state.dart';

class DogImageCubit extends Cubit<DogImageState> {
   DogDetailRepoImpl dogDetailRepoImpl;
 DogImageCubit(this.dogDetailRepoImpl) : super(DogImageInitial());


Future <void> getImage() async{
  try {
  emit(DogImageLoading());
  final dogImage = await dogDetailRepoImpl.getImage();
  emit(DogImageLoaded(dogImage));
} on Exception catch (e) {
  emit(DogImageError('Error:$e'));
}
}

}
