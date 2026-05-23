import 'package:get/get.dart';
import '../models/distributor_model.dart';
import '../models/route_model.dart';
import '../models/user_model.dart';
import '../services/distributor_service.dart';
import '../services/hive_service.dart';
import '../services/route_service.dart';

class HomeController extends GetxController {
  final DistributorService _distributorService = DistributorService();
  final RouteService _routeService = RouteService();
  final HiveService _hiveService = HiveService();

  final isLoading = false.obs;
  final errorMessage = ''.obs;

  final user = Rxn<UserModel>();

  final distributors = <Distributor>[].obs;
  final selectedDistributor = Rxn<Distributor>();

  final routes = <Route>[].obs;
  final selectedRoute = Rxn<Route>();

  final isCheckedIn = false.obs;
  final RxInt selectedTab = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadUser();
    fetchDistributors();
  }

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void loadUser() {
    user.value = _hiveService.getUserData();
  }

  Future<void> fetchDistributors() async {
    try {
      isLoading.value = true;

      final response = await _distributorService.fetchDistributors();
      distributors.value = response;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> onDistributorSelected(Distributor distributor) async {
    selectedDistributor.value = distributor;
    selectedRoute.value = null;
    routes.clear();

    if (distributor.id == null) {
      errorMessage.value = 'Invalid distributor';
      return;
    }

    try {
      isLoading.value = true;
      routes.value = await _routeService.fetchRoutes(distributor.id!);
   
    } catch (e) {
   
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void onRouteSelected(Route route) {
    selectedRoute.value = route;
  }

  bool get canCheckIn =>
      selectedDistributor.value != null && selectedRoute.value != null;
}
