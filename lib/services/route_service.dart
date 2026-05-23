import 'package:daffy/models/route_model.dart';
import 'package:daffy/services/api_service.dart';
import 'package:dio/dio.dart';

class RouteService {
  final dio = ApiService.dio;

  Future<List<Route>> fetchRoutes(int distributorId) async {
    try {
      final response = await dio.get(
        '/route/getTsoDistributorWiseRoute/$distributorId',
      );
      final routeData = RouteModel.fromJson(response.data);
      return routeData.data;
  
    } on DioException catch (e) {
      throw Exception(
        'Failed to load routes: ${e.response?.data['message'] ?? e.message}',
      );
    }
  }
}
