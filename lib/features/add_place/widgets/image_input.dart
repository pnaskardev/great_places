import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget 
{

  final Function onSelectImage;
  const ImageInput({super.key,required this.onSelectImage});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> 
{
  File? _storedImage;
  bool isLoading=false;

  Future<void> _takePicture() async
  {
    setState(() 
    {
      isLoading=true;  
    });
    final imageFile= await ImagePicker().pickImage
    (
      source: ImageSource.camera,
      maxWidth: 600,

    );
    if(imageFile==null)
    {
      setState(() 
      {
        isLoading=false;  
      });
      return;
    }
    setState(() 
    {
      _storedImage=File(imageFile.path);  
    });

    final appDir= await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await File(imageFile.path).copy('${appDir.path}/$fileName');
    setState(() 
    {
      isLoading=false;  
    });
    widget.onSelectImage(savedImage);
  }

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
          // child: _storedImage!=null ? 
          // Image.file
          // (
          //   _storedImage!,
          //   fit: BoxFit.cover,
          // ) 
          // : 
          // const Text
          // (
          //   'No Image taken',
          //   textAlign: TextAlign.center,
          // ) ,
          child: wrapper(),
        ),
        const SizedBox(width: 10,),
        Expanded
        (
          child: ElevatedButton.icon
          (
            onPressed: ()
            {
              _takePicture();
            }, 
            icon: const Icon(Icons.add), 
            label: const Text('Take a picture'),
          )
        )
      ],
    );
  }

  Widget wrapper()
  {
    if(isLoading==true && _storedImage==null)
    {
      return const Center
      (
        child: CircularProgressIndicator(),
      );
    }
    else
    {
      if(isLoading==false && _storedImage!=null)
      {
        return Image.file
        (
          _storedImage!,
          fit: BoxFit.cover,
        );
      }
    }
    return const Text
    (
      'No Image taken',
      textAlign: TextAlign.center,
    );
  }


}

