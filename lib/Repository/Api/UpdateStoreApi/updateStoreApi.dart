import 'dart:convert';

import 'package:http/http.dart';
import '../../ModelClass/UpdatStoreModel.dart';
import '../MultiPachApiClient.dart';

class UpdateStoreApi {
  PatchMethodApiClient apiClient = PatchMethodApiClient();

  Future<UpdatStoreModel> getUpdateStore(
      {required String password,
      required int shopId,
      required String store_namestore_name,
      required String description,
      required String address,
      required String phone}) async {
    var body = {
      'password': password,
      'shopId':shopId.toString(),
      'description':description,
      'store_name':store_namestore_name,
      'address':address,
      'phone':phone
    };
    String path = 'store/update';

    Response response =
        await apiClient.invokeApi(Path: path, method: 'POST', body: body);

    return UpdatStoreModel.fromJson(jsonDecode(response.body));
  }
}
