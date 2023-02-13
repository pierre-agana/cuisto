import 'package:flutter/material.dart';

class Menu {
  const Menu({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String onTap;

  static List<Menu> getMenus() {
    return const [
      Menu(icon: Icons.home_outlined, title: 'Accueil',onTap: ''),
      Menu(icon: Icons.search, title: 'Recherche',onTap: ''),
      Menu(icon: Icons.shopping_bag_outlined, title: 'Commandes',onTap: ''),
      Menu(icon: Icons.local_offer_outlined, title: 'Promos',onTap: ''),
    /*  Menu(icon: Icons.person_outline, title: 'Mon compte'),
      Menu(icon: Icons.more_horiz, title: 'Plus'),*/
    ];
  }
}
