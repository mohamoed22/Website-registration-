import 'dart:io';

class Placeslocasan {
  final double? longitude;
  // ignore: non_constant_identifier_names
  final double? Latitude;
  final String? adress;

  Placeslocasan(
    this.adress, {
    required this.longitude,
    // ignore: non_constant_identifier_names
    required this.Latitude,
  });
}

// ignore: camel_case_types
class places {
  final String? id;
  final String? title;
  // ignore: non_constant_identifier_names
  final File? Image;
  //final Placeslocasan locasan;
  // ignore: non_constant_identifier_names
  places({required this.id, required this.title, required this.Image
//  required this.locasan
      });
}
