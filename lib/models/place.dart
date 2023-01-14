import 'dart:io';
import 'package:flutter/material.dart';
import 'package:greatplaces/models/placeLocation.dart';



class Place
{
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place
  ({
    required this.id,
    required this.title,
    required this.location,
    required this.image
  });
}