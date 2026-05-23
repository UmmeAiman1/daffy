import 'package:daffy/models/distributor_model.dart';
import 'package:daffy/services/api_service.dart';
import 'package:dio/dio.dart';

class DistributorService {
  final dio = ApiService.dio;

  Future<List<Distributor>> fetchDistributors() async {
    try {
      final response = await dio.get('/distributor/getTsoWiseDistributor');
      final distributorData = DistributorModel.fromJson(response.data);
      return distributorData.data;
    } on DioException catch (e) {
      throw Exception(
        'Failed to load distributors: ${e.response?.data['message'] ?? e.message}',
      );
    }
  }
}
