import 'dart:convert';

import 'package:http/http.dart';
import 'package:menu_club/Repository/ModelClass/ProductModel.dart';
import '../MultiPachApiClient.dart';

class ProductApi {
  PatchMethodApiClient apiClient = PatchMethodApiClient();

  Future<ProductModel> getProduct({required int shopId}) async {
    var body = {
      'shopId': shopId.toString(),
    };
    String path = 'store/product/view';

    Response response = await apiClient.invokeApi(Path: path, method:'POST' , body: body);

    return  ProductModel.fromJson(jsonDecode(response.body));
  }
}
