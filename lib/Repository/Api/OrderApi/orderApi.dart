import 'dart:convert';

import 'package:http/http.dart';
import '../../ModelClass/OrderModel.dart';
import '../MultiPachApiClient.dart';

class OrderApi {
  PatchMethodApiClient apiClient = PatchMethodApiClient();

  Future<OrderModel> getOrder({required int shopId}) async {
    var body = {
      'shopId': shopId.toString(),
    };
    String path = 'store/orders/view';

    Response response = await apiClient.invokeApi(Path: path, method: "POST", body: body);

    return  OrderModel.fromJson(jsonDecode(response.body));
  }
}
