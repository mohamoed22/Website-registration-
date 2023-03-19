import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class InputInage extends StatefulWidget {
  final Function _onsave;
  const InputInage(this._onsave, {super.key});

  @override
  State<InputInage> createState() => _InputInageState();
}

class _InputInageState extends State<InputInage> {
  File? _storedImage;
  Future<void> _takePicture() async {
    final piker = ImagePicker();
    final imageFile =
        await piker.pickImage(source: ImageSource.camera, maxWidth: 600);
    setState(() {
      _storedImage = File(imageFile!.path);
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile!.path);
    final saveImage = await _storedImage!.copy('/${appDir.path}/$fileName');
    widget._onsave(saveImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: _storedImage != null
                ? Image.file(
                    _storedImage!,
                    fit: BoxFit.cover,
                  )
                : const Center(child: Text('no Image'))),
        TextButton.icon(
            onPressed: _takePicture,
            icon: const Icon(Icons.camera),
            label: const Text('add Image'))
      ],
    );
  }
}
