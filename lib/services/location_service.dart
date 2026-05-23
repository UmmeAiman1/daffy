import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class LocationService {

  String getCurrentDateTime(){
return DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  }
  
  String getCurrentDate(){
return DateFormat('yyyy-MM-dd').format(DateTime.now());
}

String getCurrentTime(){
return DateFormat('HH:mm:ss').format(DateTime.now());
}
Future<Position> getCurrentLcoation() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    throw Exception('Location permissions are permanently denied');
  }
  return await Geolocator.getCurrentPosition(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
    ),
  );
}

}