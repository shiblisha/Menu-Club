import 'dart:convert';

import 'package:http/http.dart';
import 'package:menu_club/Repository/ModelClass/StoreModel.dart';
import '../MultiPachApiClient.dart';

class StoreApi {
  PatchMethodApiClient apiClient = PatchMethodApiClient();

  Future<StoreModel> getStore({required int shopId}) async {
    var body = {
      'shopId': shopId.toString(),
    };
    String path = 'store/view';

    Response response = await apiClient.invokeApi(Path: path, method: "POST", body: body);

    return StoreModel.fromJson(jsonDecode(response.body));
  }
}
