import 'package:complete_app/core/networking/api_error_handler.dart';
import 'package:complete_app/core/networking/api_result.dart';
import 'package:complete_app/core/networking/api_services.dart';
import 'package:complete_app/features/signup/data/models/signup_request_body.dart';
import 'package:complete_app/features/signup/data/models/signup_response.dart';

class SignupRepo {
  final ApiServices _apiServices;

  SignupRepo(this._apiServices);

  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      var response = await _apiServices.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
