import 'dart:convert';

import 'package:http/http.dart';
import '../../ModelClass/OrderDetailsModel.dart';
import '../MultiPachApiClient.dart';

class OrderDetailsApi {
  PatchMethodApiClient apiClient = PatchMethodApiClient();

  Future<OrderDetailsModel> getOrderDetails({required int order_id}) async {
    var body = {
      'order_id': order_id.toString(),
    };
    String path = 'store/order/view/details';

    Response response = await apiClient.invokeApi(Path: path, method: "POST", body: body);

    return  OrderDetailsModel.fromJson(jsonDecode(response.body));
  }
}
