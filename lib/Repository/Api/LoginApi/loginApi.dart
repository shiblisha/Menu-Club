import 'dart:convert';

import 'package:http/http.dart';



import '../../ModelClass/LoginModel.dart';
import '../api_client.dart';

class LoginApi {
  ApiClient apiClient = ApiClient();

  Future<LoginModel> getLoginInfo({required String email,required String password}) async {
var body={
  'email':email,
  'password':password
};
    String trendingpath = 'login?email=$email&password=$password';

    Response response = await apiClient.invokeAPI(trendingpath, 'POST_', body);

    return LoginModel.fromJson(jsonDecode(response.body));
  }
}