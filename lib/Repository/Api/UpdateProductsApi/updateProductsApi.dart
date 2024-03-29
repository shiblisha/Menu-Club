import 'dart:convert';
import 'package:http/http.dart';
import '../../ModelClass/UpdateProductModel.dart';
import '../MultiPachApiClient.dart';

class UpdateProductApi {
  PatchMethodApiClient apiClient = PatchMethodApiClient();

  Future<UpdateProductModel> getUpdateProduct({
    required int shopId,
    required int ItemId,
    required String name,
    required int price,
    required String description,
    required String image,
    required String image_extension,
    required int is_active,
    required int category_id,
    required int cooking_time,
    required int is_veg,
    required int is_recommended,
  }) async {
    var body = {
      'shopId': shopId.toString(),
      'ItemId': ItemId.toString(),
      'name': name,
      'price': price.toString(),
      'description': description,
      'image': image.toString(),
      'image_extension': image_extension,
      'is_active': is_active.toString(),
      'category_id': category_id.toString(),
      'cooking_time': cooking_time.toString(),
      'is_veg': is_veg.toString(),
      'is_recommended': is_recommended.toString(),
    };
    String path = 'store/product/update';

    Response response = await apiClient.invokeApi(Path: path, method: 'POST', body: body);

    return UpdateProductModel.fromJson(jsonDecode(response.body));
  }
}
