import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/great_places.dart';
import 'screen/add_place_screen.dart';
import 'screen/places_list_screen.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        theme: ThemeData(
         primaryColor: Colors.amber,
          primarySwatch: Colors.indigo,
          ),
        home:const PlacesList(),
        routes: {
          AddplacesScreen.routname:(ctx) => const AddplacesScreen() 
        },
      ),
    );
  }
}

