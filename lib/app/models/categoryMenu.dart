class Categoriemenu {
  Categoriemenu({
    required this.categoriemenuid,
    required this.categoriemenulibelle,
    this.restaurant,
    required this.categoriemenudescription,
    required this.categoriemenuimage,
    required this.categoriemenuenable,
    required this.categoriemenudatecreation,
    this.categoriemenudatemodification,
  });

  int categoriemenuid;
  String categoriemenulibelle;
  dynamic restaurant;
  String categoriemenudescription;
  String categoriemenuimage;
  bool categoriemenuenable;
  DateTime categoriemenudatecreation;
  DateTime? categoriemenudatemodification;

  factory Categoriemenu.fromJson(Map<String, dynamic> json) => Categoriemenu(
    categoriemenuid: json["categoriemenuid"],
    categoriemenulibelle: json["categoriemenulibelle"],
    restaurant: json["restaurant"],
    categoriemenudescription: json["categoriemenudescription"],
    categoriemenuimage: json["categoriemenuimage"],
    categoriemenuenable: json["categoriemenuenable"],
    categoriemenudatecreation: DateTime.parse(json["categoriemenudatecreation"]),
    categoriemenudatemodification: json["categoriemenudatemodification"] == null ? null : DateTime.parse(json["categoriemenudatemodification"]),
  );

  Map<String, dynamic> toJson() => {
    "categoriemenuid": categoriemenuid,
    "categoriemenulibelle": categoriemenulibelle,
    "restaurant": restaurant,
    "categoriemenudescription": categoriemenudescription,
    "categoriemenuimage": categoriemenuimage,
    "categoriemenuenable": categoriemenuenable,
    "categoriemenudatecreation": categoriemenudatecreation.toIso8601String(),
    "categoriemenudatemodification": categoriemenudatemodification?.toIso8601String(),
  };
}