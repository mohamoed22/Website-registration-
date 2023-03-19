import 'package:diveues/provider/great_places.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('yore places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'AddplacesScreen');
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context,listen: false).fandAndDate(),
        builder:(ctx,snaphsot)=> snaphsot.connectionState == ConnectionState.waiting?const Center(child: CircularProgressIndicator(),): Consumer<GreatPlaces>(
          child: const Center(child: Text('no places ')),
          // ignore: prefer_is_empty
          builder: (ctx, greatPlaces, ch) => greatPlaces.item.length <= 0
              ? ch!
              : ListView.builder(
                  itemCount: greatPlaces.item.length,
                  itemBuilder: (ctx, i) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(greatPlaces.item[i].Image!,
                      ),
                    ),
                    title: Text(greatPlaces.item[i].title!),
                  ),
                ),
        ),
      ),
    );
  }
}
