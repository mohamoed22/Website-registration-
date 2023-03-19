import 'dart:io';

import 'package:diveues/model/places.dart';
import 'package:flutter/material.dart';
import '../helper/db_helprs.dart';

class GreatPlaces with ChangeNotifier {
  // ignore: non_constant_identifier_names
  List<places> Item = [];

  List<places> get item {
    return [...Item];
  }

  void addplaces(String pikedtitle, File pikedimage) {
    final newplaces = places(
        id: DateTime.now().toString(), title: pikedtitle, Image: pikedimage);
    Item.add(newplaces);
    notifyListeners();
    Dbhelprs.inser('user_placse', {
      'id': newplaces.id!,
      'title': newplaces.title!,
      'image': newplaces.Image!.path
    });
  }

  Future<void> fandAndDate() async {
    final listDate = await Dbhelprs.getDate('user_placse');
    Item = listDate
        .map((e) =>
            places(id: e['id'], title: e['title'], Image: File(e['image'])))
        .toList();
    //     print(listDate);
    notifyListeners();
  }
}
