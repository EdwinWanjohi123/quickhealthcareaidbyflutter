import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quickhealthcareaidappbyflutter/models/place.dart';
import 'package:quickhealthcareaidappbyflutter/screens/search.dart';
import 'package:quickhealthcareaidappbyflutter/services/geolocator_service.dart';
import 'package:quickhealthcareaidappbyflutter/services/places_service.dart';

//void main() => runApp(MyApp());

class HomePage extends StatelessWidget {
  final locatorService = GeoLocatorService(); 
  final placesService = PlacesService();

  @override
  Widget build(BuildContext context) {  
    return MultiProvider(
        providers:[
          FutureProvider(create: (context)=> locatorService.getLocation()),
          FutureProvider(create: (context){
            ImageConfiguration configuration = createLocalImageConfiguration(context);
            return BitmapDescriptor.fromAssetImage(configuration, 'assets/images/hospital.png');
          }),
          ProxyProvider2<Position,BitmapDescriptor,Future<List<Place>>>(
            update:(context,position,icon,places){
              return (position != null) ? placesService.getPlaces(position.latitude, position.longitude,icon) :null;
            } ,)
        ],
         child: MaterialApp(
        title: 'Quick Health Care Aid App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:Search(),
      ),
    );
  }
}

