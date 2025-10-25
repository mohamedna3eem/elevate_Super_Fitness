import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/end_points.dart';
import '../models/requests/auth/register/register_request.dart';
import '../models/responses/auth/register/register_response.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;


  @POST(Endpoints.signUp)
  Future<RegisterResponse> register(@Body() RegisterRequest request);
}
