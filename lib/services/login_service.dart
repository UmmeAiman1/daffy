
import 'package:daffy/models/user_model.dart';
import 'package:daffy/services/api_service.dart';
import 'package:dio/dio.dart';

class LoginService {
  final dio = ApiService.dio;
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/login',
        data: {'email': email, 'password': password},
      );

      final user = UserModel.fromJson(response.data);
      ApiService.setAuthToken(user.token);
      return user;
    } on DioException catch (e) {
      throw Exception(
        'Login failed: ${e.response?.data['message'] ?? e.message}',
      );
    }
  }
}
