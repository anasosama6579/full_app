import 'package:complete_app/core/networking/api_constants.dart';
import 'package:complete_app/features/login/data/models/login_request_body.dart';
import 'package:complete_app/features/login/data/models/login_response_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices{

  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstants.loginEndPoint)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);
}