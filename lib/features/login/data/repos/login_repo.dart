import 'package:complete_app/core/networking/api_error_handler.dart';
import 'package:complete_app/core/networking/api_result.dart';
import 'package:complete_app/core/networking/api_services.dart';
import 'package:complete_app/features/login/data/models/login_request_body.dart';
import 'package:complete_app/features/login/data/models/login_response_body.dart';

class LoginRepo{

  final ApiServices _apiServices;
  LoginRepo(this._apiServices);

 Future<ApiResult<LoginResponseBody>> login(LoginRequestBody loginRequestBody) async {
    try{
      final response = await _apiServices.login(loginRequestBody);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}