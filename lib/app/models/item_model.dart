import 'dart:ffi';

import 'categoryMenu.dart';



class Itemes {
  Itemes({
    required this.menuid,
    required this.categoriemenu,
    this.restaurant,
    required this.menulibelle,
    required this.menuprix,
    required this.menudescription,
    required this.menuimg,
    required this.menuissupplement,
    required this.menuisaccompagnement,
    required this.menuenable,
    required this.menudatecreation,
    required this.menudatemodification,
    required this.menudureepreparation,
  });

  int menuid;
  Categoriemenu categoriemenu;
  dynamic restaurant;
  String menulibelle;
  double  menuprix;
  String menudescription;
  String menuimg;
  bool menuissupplement;
  bool menuisaccompagnement;
  bool menuenable;
  DateTime menudatecreation;
  DateTime menudatemodification;
  int menudureepreparation;

  factory Itemes.fromJson(Map<String, dynamic> json) => Itemes(
    menuid: json["menuid"],
    categoriemenu: Categoriemenu.fromJson(json["categoriemenu"]),
    restaurant: json["restaurant"],
    menulibelle: json["menulibelle"],
    menuprix: json["menuprix"],
    menudescription: json["menudescription"],
    menuimg: json["menuimg"],
    menuissupplement: json["menuissupplement"],
    menuisaccompagnement: json["menuisaccompagnement"],
    menuenable: json["menuenable"],
    menudatecreation: DateTime.parse(json["menudatecreation"]),
    menudatemodification: DateTime.parse(json["menudatemodification"]),
    menudureepreparation: json["menudureepreparation"],
  );

  Map<String, dynamic> toJson() => {
    "menuid": menuid,
    "categoriemenu": categoriemenu.toJson(),
    "restaurant": restaurant,
    "menulibelle": menulibelle,
    "menuprix": menuprix,
    "menudescription": menudescription,
    "menuimg": menuimg,
    "menuissupplement": menuissupplement,
    "menuisaccompagnement": menuisaccompagnement,
    "menuenable": menuenable,
    "menudatecreation": menudatecreation.toIso8601String(),
    "menudatemodification": menudatemodification.toIso8601String(),
    "menudureepreparation": menudureepreparation,
  };
}