import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quickhealthcareaidappbyflutter/models/geometry.dart';

class Place{
  final String name;
  final double rating;
  final int userRatingCount;
  final int emergencyHotLine;
  final String vicinity;
  final Geometry geometry;
  final BitmapDescriptor icon;
 

  Place({this.geometry,this.name,this.rating,this.userRatingCount,this.emergencyHotLine,this.vicinity,this.icon});

  Place.fromJson(Map<dynamic, dynamic> parsedJson,BitmapDescriptor icon)
    :name = parsedJson['name'],
    rating = (parsedJson['rating'] !=null) ? parsedJson['rating'].toDouble() :null,
    userRatingCount= (parsedJson['user_ratings_count'] !=null) ? parsedJson['user_ratings_count']:null,
    emergencyHotLine = (parsedJson['emergency_hot_line'] !=null) ? parsedJson['emergency_hot_line']:null,
    vicinity = parsedJson['vicinity'],
    geometry = Geometry.fromJson(parsedJson['geometry']),
    icon=icon;
  

}