import 'dart:convert';

import 'package:http/http.dart';
import 'package:menu_club/Repository/ModelClass/AddProductModel.dart';
import '../MultiPachApiClient.dart';

class AddProductApi {
  PatchMethodApiClient apiClient = PatchMethodApiClient();

  Future<AddProductModel> getAddProduct({  required int shopId,
    required String name,
    required int price,
    required String description,
    required String image,
    required String image_extension,
    required int is_active,
    required int category_id,
    required int cooking_time,
    required int is_veg,
    required int is_recommended,}) async {
    var body = {
      'shopId': shopId.toString(),
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
    String path = 'store/category/view';

    Response response = await apiClient.invokeApi(Path: path, method:'POST' , body: body);

    return  AddProductModel.fromJson(jsonDecode(response.body));
  }
}
