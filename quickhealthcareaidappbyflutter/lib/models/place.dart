import 'package:quickhealthcareaidappbyflutter/models/geometry.dart';

class Place{
  final String name;
  final double rating;
  final int emergencyHotLine;
  final String vicinity;
  final Geometry geometry;

  Place(this.geometry,this.name,this.rating,this.emergencyHotLine,this.vicinity);

  Place.fromJson(Map<dynamic, dynamic> parsedJson)
    :name = parsedJson['name'],
    rating = (parsedJson['rating'] !=null) ? parsedJson['rating'].toDouble() :null,
    emergencyHotLine = (parsedJson['emergency_hot_line'] !=null) ? parsedJson['emergency_hot_line']:null,
    vicinity = parsedJson['vicinity'],
    geometry = Geometry.fromJson(parsedJson['geometry']);

}