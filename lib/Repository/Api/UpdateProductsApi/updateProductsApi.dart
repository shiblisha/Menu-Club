import 'dart:convert';
import 'package:http/http.dart';
import '../../ModelClass/productModel.dart';
import '../MultiPachApiClient.dart';

class UpdateProductApi {
  PatchMethodApiClient apiClient = PatchMethodApiClient();

  Future<ProductModel> getUpdateProduct(
      {required int shopId,
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
      required int is_recommended}) async {
    var body = {
      'shopId': shopId.toString(),
      'ItemId': ItemId.toString(),
      'name':name,
      'price':price.toString(),
      'description':description,
      'image':image,
      'image_extension':image_extension,
      'is_active':is_active.toString(),
      'category_id':category_id.toString(),
      'cooking_time':cooking_time.toString(),
      'is-veg':is_veg.toString(),
      'is_recommended':is_recommended.toString()

    };
    String path = 'store/product/update';

    Response response =
        await apiClient.invokeApi(Path: path, method: 'POST', body: body);

    return ProductModel.fromJson(jsonDecode(response.body));
  }
}
