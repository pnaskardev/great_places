import 'package:flutter/material.dart';
import 'package:greatplaces/Providers/user_provider.dart';
import 'package:greatplaces/features/add_place/screens/add_place_screen.dart';
import 'package:greatplaces/features/home/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  {
    return MultiProvider
    (
      providers: 
      [
        ChangeNotifierProvider.value
        (
          value: GreatPlaces()
        )
      ],
      child: MaterialApp
      (
        debugShowCheckedModeBanner: false,
        title: 'Great Places',
        theme: ThemeData
        (
          useMaterial3: true,
          primarySwatch: Colors.indigo,
        ),
        home: const HomePage(),
        routes: 
        {
          AddPlaceScreen.routeName:(ctx)=>const AddPlaceScreen(),

        },
      ),
    );
  }
}
