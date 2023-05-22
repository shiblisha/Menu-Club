import 'dart:convert';

import 'package:http/http.dart';
import '../../ModelClass/CategoryModel.dart';
import '../MultiPachApiClient.dart';

class AddCategoryApi {
  PatchMethodApiClient apiClient = PatchMethodApiClient();

  Future<CategoryModel> getAddCategory({required int shopId,
    required String name,
    required String image,
    required String image_extension,
    required int is_active,
    required int CategoryId}) async {
    var body = {
      'shopId': shopId.toString(),
      'name': name.toString(),
      'image': image.toString(),
      'image_extension': 'png',
      'is_active': is_active.toString(),
      'CategoryId': CategoryId.toString()
    };
    String path = 'store/category/add';

    Response response = await apiClient.invokeApi(Path: path, method:'POST' , body: body);

    return  CategoryModel.fromJson(jsonDecode(response.body));
  }
}
