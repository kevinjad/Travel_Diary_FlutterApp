import 'dart:io';
import './location.dart';
import 'package:travel_diary/models/location.dart';

class Place{
  final String id;
  final String title;
  final Location location;
  final File images;

  Place(this.id,this.title,this.location,this.images);
}