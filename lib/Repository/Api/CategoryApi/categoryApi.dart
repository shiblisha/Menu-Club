import 'dart:convert';

import 'package:http/http.dart';
import '../api_client.dart';

class CategoryApi {
  ApiClient apiClient = ApiClient();

  Future<Map<String, dynamic>> getCategory({required int shopId}) async {
    var body = {
      'shopId': shopId,
    };
    String path = 'store/category/view';

    Response response = await apiClient.invokeAPI(path, 'POST', jsonEncode(body));

    return jsonDecode(response.body)['payload'];
  }
}
