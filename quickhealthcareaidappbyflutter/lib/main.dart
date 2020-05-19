import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:quickhealthcareaidappbyflutter/models/place.dart';
import 'package:quickhealthcareaidappbyflutter/screens/search.dart';
import 'package:quickhealthcareaidappbyflutter/services/geolocator_service.dart';
import 'package:quickhealthcareaidappbyflutter/services/places_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final locatorService = GeoLocatorService(); 
  final placesService = PlacesService();

  @override
  Widget build(BuildContext context) {  
    return MultiProvider(
        providers:[
          FutureProvider(create: (context)=> locatorService.getLocation()),
          ProxyProvider<Position,Future<List<Place>>>(
            update:(context,position,places){
              return (position != null) ? placesService.getPlaces(position.latitude,position.longitude ):null;
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

