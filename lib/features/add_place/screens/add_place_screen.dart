import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greatplaces/Providers/user_provider.dart';
import 'package:greatplaces/features/add_place/widgets/image_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget 
{
  const AddPlaceScreen({super.key});
  static const routeName ='/add-place';
  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> 
{

  final _titleController=TextEditingController();
  File? _pickedImage;
  void _selectImage(File myPickedImage)
  {
    _pickedImage=myPickedImage;
  }



  @override
  Widget build(BuildContext context) 
  {
      void _savePlace()
      {
        if(_titleController.text.isEmpty || _pickedImage==null)
        {
          return;
        }
        Provider.of<GreatPlaces>(context,listen: false).addPlace
        (
          _titleController.text, 
          _pickedImage!
        );
        Navigator.of(context).pop();
      }
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
              child: SingleChildScrollView
              (
                child: Padding
                (
                  padding: const EdgeInsets.all(10.0),
                  child: Column
                  (
                    children: 
                    [
                        TextField
                        (
                          decoration: const InputDecoration
                          (
                            labelText: 'Title',
                          ),
                          controller: _titleController,
                        ),
                      const SizedBox(height: 10,),
                      ImageInput(onSelectImage: _selectImage)
                    ],
                  ),
                ),
              )
            )
          ],
        ),
        floatingActionButton: FloatingActionButton
        (
          onPressed: ()
          {
            _savePlace();
          }, 
          child: const Icon(Icons.add),
        
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}