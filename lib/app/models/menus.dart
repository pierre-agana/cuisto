class MenuFood {
  MenuFood({
    required this.image,
    required this.name,
    required this.desc,
  });

  final String image;
  final String name;
  final String desc;


  static List<MenuFood> getPopularAllRestaurants() {
    return [
      MenuFood(
        image: 'assets/image/food5.jpg',
        name: 'PATISSERIES',
        desc: 'South Indian',
      ),
      MenuFood(
        image: 'assets/image/food6.jpg',
        name: 'MACARONS',
        desc: 'South Indian',
      ),
      MenuFood(
        image: 'assets/image/food7.jpg',
        name: 'TARTES',
        desc: 'South Indian',
      ),
      MenuFood(
        image: 'assets/image/food8.jpg',
        name: 'ECLAIRS',
        desc: 'South Indian',
      ),
      MenuFood(
        image: 'assets/image/food3.jpg',
        name: 'CRËPES',
        desc: 'South Indian',
      ),
      MenuFood(
        image: 'assets/image/food4.jpg',
        name: 'MILLEFEUILLE',
        desc: 'North Indian',
      ),
      MenuFood(
        image: 'assets/image/food4.jpg',
        name: 'GAUFRES',
        desc: 'North Indian',
      ),
      MenuFood(
        image: 'assets/image/food4.jpg',
        name: 'FRUITS',
        desc: 'North Indian',
      ),
      MenuFood(
        image: 'assets/image/food4.jpg',
        name: 'BOISSON',
        desc: 'North Indian',
      ),
      MenuFood(
        image: 'assets/image/food4.jpg',
        name: 'MENU ENFANT',
        desc: 'North Indian',
      ),
    ];
  }

}



class Menuall {
  Menuall({
    required this.menuid,
    //required this.categoriemenu,
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
  //Categoriemenu categoriemenu;
  dynamic restaurant;
  String menulibelle;
  double menuprix;
  String menudescription;
  String menuimg;
  bool menuissupplement;
  bool menuisaccompagnement;
  bool menuenable;
  DateTime menudatecreation;
  DateTime menudatemodification;
  int menudureepreparation;

  factory Menuall.fromJson(Map<String, dynamic> json) => Menuall(
    menuid: json["menuid"],
    //categoriemenu: Categoriemenu.fromJson(json["categoriemenu"]),
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
   // "categoriemenu": categoriemenu.toJson(),
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

/*
class Categoriemenu {
  Categoriemenu({
    required this.categoriemenuid,
    required this.categoriemenulibelle,
    required this.restaurant,
    required this.categoriemenudescription,
    required this.categoriemenuimage,
    required this.categoriemenuenable,
    required this.categoriemenudatecreation,
    required this.categoriemenudatemodification,
  });

  int categoriemenuid;
  String categoriemenulibelle;
  Restaurant restaurant;
  String categoriemenudescription;
  String categoriemenuimage;
  bool categoriemenuenable;
  DateTime categoriemenudatecreation;
  DateTime categoriemenudatemodification;

  factory Categoriemenu.fromJson(Map<String, dynamic> json) => Categoriemenu(
    categoriemenuid: json["categoriemenuid"],
    categoriemenulibelle: json["categoriemenulibelle"],
    restaurant: Restaurant.fromJson(json["restaurant"]),
    categoriemenudescription: json["categoriemenudescription"],
    categoriemenuimage: json["categoriemenuimage"],
    categoriemenuenable: json["categoriemenuenable"],
    categoriemenudatecreation: DateTime.parse(json["categoriemenudatecreation"]),
    categoriemenudatemodification: DateTime.parse(json["categoriemenudatemodification"]),
  );

  Map<String, dynamic> toJson() => {
    "categoriemenuid": categoriemenuid,
    "categoriemenulibelle": categoriemenulibelle,
    "restaurant": restaurant.toJson(),
    "categoriemenudescription": categoriemenudescription,
    "categoriemenuimage": categoriemenuimage,
    "categoriemenuenable": categoriemenuenable,
    "categoriemenudatecreation": categoriemenudatecreation.toIso8601String(),
    "categoriemenudatemodification": categoriemenudatemodification.toIso8601String(),
  };
}

class Restaurant {
  Restaurant({
    required this.restaurantid,
    required this.restaurantnom,
    required this.restaurantcontact,
    required this.restaurantslogan,
    required this.restaurantlogo,
    required this.restaurantbanniere,
    this.restaurantcoordonnee,
    required this.restaurantenable,
    required this.restaurantdatecreation,
    required this.restaurantdatemodification,
    this.restaurantadresse,
    required this.commune,
  });

  int restaurantid;
  String restaurantnom;
  String restaurantcontact;
  String restaurantslogan;
  String restaurantlogo;
  String restaurantbanniere;
  dynamic restaurantcoordonnee;
  bool restaurantenable;
  DateTime restaurantdatecreation;
  DateTime restaurantdatemodification;
  dynamic restaurantadresse;
  Commune commune;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    restaurantid: json["restaurantid"],
    restaurantnom: json["restaurantnom"],
    restaurantcontact: json["restaurantcontact"],
    restaurantslogan: json["restaurantslogan"],
    restaurantlogo: json["restaurantlogo"],
    restaurantbanniere: json["restaurantbanniere"],
    restaurantcoordonnee: json["restaurantcoordonnee"],
    restaurantenable: json["restaurantenable"],
    restaurantdatecreation: DateTime.parse(json["restaurantdatecreation"]),
    restaurantdatemodification: DateTime.parse(json["restaurantdatemodification"]),
    restaurantadresse: json["restaurantadresse"],
    commune: Commune.fromJson(json["commune"]),
  );

  Map<String, dynamic> toJson() => {
    "restaurantid": restaurantid,
    "restaurantnom": restaurantnom,
    "restaurantcontact": restaurantcontact,
    "restaurantslogan": restaurantslogan,
    "restaurantlogo": restaurantlogo,
    "restaurantbanniere": restaurantbanniere,
    "restaurantcoordonnee": restaurantcoordonnee,
    "restaurantenable": restaurantenable,
    "restaurantdatecreation": restaurantdatecreation.toIso8601String(),
    "restaurantdatemodification": restaurantdatemodification.toIso8601String(),
    "restaurantadresse": restaurantadresse,
    "commune": commune.toJson(),
  };
}

class Commune {
  Commune({
    required this.communeid,
    required this.ville,
    required this.communelibelle,
    required this.communedescription,
    required this.communeenable,
    required this.communedatecreation,
    required this.communedatemodification,
  });

  int communeid;
  Ville ville;
  String communelibelle;
  String communedescription;
  bool communeenable;
  DateTime communedatecreation;
  DateTime communedatemodification;

  factory Commune.fromJson(Map<String, dynamic> json) => Commune(
    communeid: json["communeid"],
    ville: Ville.fromJson(json["ville"]),
    communelibelle: json["communelibelle"],
    communedescription: json["communedescription"],
    communeenable: json["communeenable"],
    communedatecreation: DateTime.parse(json["communedatecreation"]),
    communedatemodification: DateTime.parse(json["communedatemodification"]),
  );

  Map<String, dynamic> toJson() => {
    "communeid": communeid,
    "ville": ville.toJson(),
    "communelibelle": communelibelle,
    "communedescription": communedescription,
    "communeenable": communeenable,
    "communedatecreation": communedatecreation.toIso8601String(),
    "communedatemodification": communedatemodification.toIso8601String(),
  };
}

class Ville {
  Ville({
    required this.villeid,
    required this.villelibelle,
    required this.villedescription,
    required this.villeenable,
    required this.villedatecreation,
    required this.villedatemodification,
  });

  int villeid;
  String villelibelle;
  String villedescription;
  bool villeenable;
  DateTime villedatecreation;
  DateTime villedatemodification;

  factory Ville.fromJson(Map<String, dynamic> json) => Ville(
    villeid: json["villeid"],
    villelibelle: json["villelibelle"],
    villedescription: json["villedescription"],
    villeenable: json["villeenable"],
    villedatecreation: DateTime.parse(json["villedatecreation"]),
    villedatemodification: DateTime.parse(json["villedatemodification"]),
  );

  Map<String, dynamic> toJson() => {
    "villeid": villeid,
    "villelibelle": villelibelle,
    "villedescription": villedescription,
    "villeenable": villeenable,
    "villedatecreation": villedatecreation.toIso8601String(),
    "villedatemodification": villedatemodification.toIso8601String(),
  };
}*/
