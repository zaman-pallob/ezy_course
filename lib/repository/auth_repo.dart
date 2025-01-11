import 'package:ezy_course/models/login_response_model.dart';
import 'package:ezy_course/network/app_urls.dart';
import 'package:ezy_course/network/rest_service.dart';
import 'package:ezy_course/utils/toast_utils.dart';

class AuthRepo {
  Future<LoginResponseModel?> login(Map map) async {
    LoginResponseModel? loginResponseModel;
    var response = await RestService.post(
      AppUrls.login,
      hasToken: false,
      payload: map,
    );
    if (response?.statusCode == 200) {
      try {
        loginResponseModel = LoginResponseModel.fromJson(response?.data);
      } catch (e) {
        errorToast(message: e.toString());
      }
    }
    return loginResponseModel;
  }
}
