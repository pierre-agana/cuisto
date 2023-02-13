
class TopPicksFoods {
  const TopPicksFoods({
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    required this.timer,
    required this.desc,
    required this.supplement,

  });

  final String image;
  final String name;
  final String price;
  final String rating;
  final String timer;
  final String desc;
  final List<SupplemnetFood>? supplement;

  factory TopPicksFoods.fromJson(Map<String, dynamic> json) => TopPicksFoods(
    image: json["id"],
    name: json["reference"],
    price: json["user_id"],
    rating: json["avocat_id"],
    timer: json["avocat_id"],
    desc: json["avocat_id"],
    supplement: List<SupplemnetFood>.from(json["etapes"].map((x) => SupplemnetFood.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "name": name,
    "price": price,
    "rating": rating,
    "timer": timer,
    "desc": desc,
    "supplement": List<dynamic>.from(supplement!.map((x) => x.toJson())),

  };
}


class SupplemnetFood {

  const SupplemnetFood({
    required this.name,
    required this.price,
  });

  final String name;
  final String price;

  factory SupplemnetFood.fromJson(Map<String, dynamic> json) => SupplemnetFood(
    name: json["libelle"],
    price: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
  };
}
