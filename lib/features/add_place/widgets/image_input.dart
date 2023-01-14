import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget 
{
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> 
{
  File? _storedImage;

  @override
  Widget build(BuildContext context) 
  {
    var size=MediaQuery.of(context).size;
    return Row
    (
      children: 
      [
        // Preview container
        Container
        (
          height: size.height*0.2,
          width: size.height*0.2,
          decoration: BoxDecoration
          (
            border: Border.all
            (
              color: Colors.grey
            )
          ),
          alignment: Alignment.center,
          child: _storedImage!=null ? 
          Image.file
          (
            _storedImage!,
            fit: BoxFit.cover,
          ) 
          : 
          const Text
          (
            'No Image taken',
            textAlign: TextAlign.center,
          ) ,
        ),
        const SizedBox(width: 10,),
        Expanded
        (
          child: ElevatedButton.icon
          (
            onPressed: (){}, 
            icon: const Icon(Icons.add), 
            label: const Text('Take a picture'),
          )
        )
      ],
    );
  }
}