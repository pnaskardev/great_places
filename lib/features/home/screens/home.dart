import 'package:flutter/material.dart';
import 'package:greatplaces/features/add_place/screens/add_place_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return SafeArea
    (
      child: Scaffold
      (
        appBar: AppBar
        (
          title: const Text('Your Title'),
          actions: 
          [
            IconButton
            (
              onPressed: ()
              {
                Navigator.pushNamed(context, AddPlaceScreen.routeName);
              }, 
              icon: const Icon(Icons.add)
            )
          ],
        ),
        body: const Center
        (
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}