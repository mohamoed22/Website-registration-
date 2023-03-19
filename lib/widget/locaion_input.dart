import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocaionInput extends StatefulWidget {
  const LocaionInput({super.key});

  @override
  State<LocaionInput> createState() => _LocaionInputState();
}

class _LocaionInputState extends State<LocaionInput> {
  String? _slcetImageurl;

  Future<void> getlocaion() async {
    // ignore: unused_local_variable
    final locationDate = await Location().getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(width: 1)),
          height: 170,
          width: double.infinity,
          child: _slcetImageurl == null
              ? const Center(
                  child: Text('no loncion'),
                )
              : Image.network(
                  _slcetImageurl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
                onPressed: getlocaion,
                icon: const Icon(Icons.location_on),
                label: const Text('selcted location')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.map),
                label: const Text('selcted Map')),
          ],
        )
      ],
    );
  }
}
