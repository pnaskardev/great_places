import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:greatplaces/models/place.dart';

class GreatPlaces with ChangeNotifier
{
  List<Place> _items=[];

  List<Place> get items
  {
    // Returning a copy of the list
    return [..._items];
  }

  addPlace(String pickedTitle,File image)
  {
    final newPlace=Place
    (
      id: DateTime.now().toString(), 
      title: pickedTitle, 
      location: null, 
      image: image
    );

    _items.add(newPlace);
    notifyListeners();
  }

}