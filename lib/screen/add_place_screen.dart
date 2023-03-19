import 'dart:io';

import 'package:diveues/provider/great_places.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/image_input.dart';
import '../widget/locaion_input.dart';

class AddplacesScreen extends StatefulWidget {
  static const routname = 'AddplacesScreen';

  const AddplacesScreen({super.key});

  @override
  State<AddplacesScreen> createState() => _AddplacesScreenState();
}

class _AddplacesScreenState extends State<AddplacesScreen> {
  final titleControell = TextEditingController();
  File? _pikedimage;
  void _selktedImage(File pikedimage) {
      _pikedimage = pikedimage;
  }

  void _saveplace() {
    if (titleControell.text.isEmpty || _pikedimage == null) {
      return _showMaterialDialog();
    } else {
      Provider.of<GreatPlaces>(context,listen: false)
          .addplaces(titleControell.text, _pikedimage!);
      Navigator.pop(context);
    }
  }

  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('error '),
            content: const Text('no Image'),
            actions: <Widget>[
              TextButton(
                child: const Text('okay'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add places'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              // padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  TextField(
                    controller: titleControell,
                    decoration: const InputDecoration(labelText: 'title'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   InputInage(_selktedImage),
                   const SizedBox(height: 10,),
                   const LocaionInput()
                ]),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor)),
              onPressed: _saveplace,
              icon: const Icon(Icons.add),
              label: const Text('add places'))
        ],
      ),
    );
  }
}
