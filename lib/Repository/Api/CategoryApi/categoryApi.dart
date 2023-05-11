import 'dart:convert';

import 'package:http/http.dart';
import '../../ModelClass/CategoryModel.dart';
import '../MultiPachApiClient.dart';

class CategoryApi {
  PatchMethodApiClient apiClient = PatchMethodApiClient();

  Future<CategoryModel> getCategory({required int shopId}) async {
    var body = {
      'shopId': shopId.toString(),
    };
    String path = 'store/category/view';

    Response response = await apiClient.invokeApi(Path: path, method:'POST' , body: body);

    return  CategoryModel.fromJson(jsonDecode(response.body));
  }
}
