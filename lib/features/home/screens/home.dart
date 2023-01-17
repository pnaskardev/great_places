import 'package:flutter/material.dart';
import 'package:greatplaces/Providers/user_provider.dart';
import 'package:greatplaces/features/add_place/screens/add_place_screen.dart';
import 'package:greatplaces/models/place.dart';
import 'package:provider/provider.dart';

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
        body:Consumer<GreatPlaces>
        (
          // child: Center
          // (
          //   child: emptyJob(),
          // ),
          builder: (context, greatPlaces, child) 
          {
            return greatPlaces.items.isEmpty ? 
            Center
            (
              child: emptyPlaces(),
            )
            : 
            ListView.builder
            (
              itemCount: greatPlaces.items.length, 
              itemBuilder:((context, index)
              {
                return ListTile
                (
                  leading: CircleAvatar
                  (
                    backgroundImage: FileImage(greatPlaces.items[index].image),
                  ),
                  title: Text(greatPlaces.items[index].title),
                  onTap: (){},
                );
              }) 
            );  
          },
        )
      ),
    );
  }
}

Widget emptyPlaces() {
  return const Center(
    child: Text("No visible places!"),
  );
}
