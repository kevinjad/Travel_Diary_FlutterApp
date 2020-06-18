import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../models/place.dart';

class Places with ChangeNotifier{
  List<Place> _places=[];
  List<Place> get places {
    return [..._places];
  }

  void addPlace(String title, File image){
    Place newPlace = Place(
      DateTime.now().toString(),
      title,
      null,
      image
    );
    this._places.add(newPlace);
    notifyListeners();
  }
}

