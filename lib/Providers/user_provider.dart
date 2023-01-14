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

}