import 'package:bloc_poc/data/model/dog_details.dart';
import 'package:bloc_poc/data/repository/dog_detail.dart';
import 'package:bloc_poc/data/service/api_service.dart';

class DogDetailRepoImpl extends DogDetail {
  APiService aPiService = APiService();
  @override
  Future<DogImage> getImage() async {
    try {
      return await aPiService.fetchDogImage();
    }  catch (e) {
      rethrow;
    }
  }
}
