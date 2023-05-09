import 'dart:convert';

import 'package:http/http.dart';



import '../../ModelClass/CategoryModel.dart';
import '../api_client.dart';

class CategoryApi {
  ApiClient apiClient = ApiClient();

  Future<CategoryModel> getCategory({required int shopId}) async {
    var body={
      'shopId':shopId
    };
    String trendingpath = 'store/category/view';

    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return CategoryModel.fromJson(jsonDecode(response.body));
  }
}