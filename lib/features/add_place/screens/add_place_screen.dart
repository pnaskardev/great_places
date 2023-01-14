import 'package:flutter/material.dart';
import 'package:greatplaces/features/add_place/widgets/image_input.dart';

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
                      const ImageInput()
                    ],
                  ),
                ),
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