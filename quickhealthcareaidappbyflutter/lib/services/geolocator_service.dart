import 'package:geolocator/geolocator.dart';

class GeoLocatorService{
  final geolocator = Geolocator();
  Future<Position> getLocation() async{
    Geolocator.checkPermission();
    return await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
  }

 Future<double>getDistance(double startLatitude,double startLongitude,double endLatitude,double endLongitude) async{
  return await Geolocator.distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude);
}

}
