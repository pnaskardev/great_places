import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget 
{
  const AddPlaceScreen({super.key});
  static const routeName ='/add-place';
  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) 
  {
    var size=MediaQuery.of(context).size;
    return SafeArea
    (
      child: Scaffold
      (
        appBar: AppBar
        (
          title: const Text('Add a new place'),
        ),
        body: Column
        (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:   
          [
            Expanded
            (
              child: Column
              (
                children: 
                [
                  
                ],
              )
            )
          ],
        ),
        floatingActionButton: FloatingActionButton
        (
          onPressed: (){}, 
          child: const Icon(Icons.add),
        
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}