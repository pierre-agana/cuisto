import 'package:cuistoapp/app/views/mobile/search/search_screen.dart';
import 'package:cuistoapp/app/views/mobile/cuisto/Menu.dart';
import 'package:cuistoapp/app/views/mobile/cuisto/cuistoScreen.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../utils/app_colors.dart';
import '../menuu.dart';
import 'account/account_screen.dart';
import 'account/dashboard.dart';
import 'cart/Commande_screen.dart';
import 'cuisto/verticalMenu.dart';

class HomeBottomNavigationScreen extends StatefulWidget {
  const HomeBottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _HomeBottomNavigationScreenState createState() =>
      _HomeBottomNavigationScreenState();
}

class _HomeBottomNavigationScreenState
    extends State<HomeBottomNavigationScreen> {
  final List<Widget> _children = [
    //const BarVerticalScreen(),
    const VerticalMenu(),
    const CuistoScreen(),
    const SearchScreen(),
    const CommandeScreen(),
     //AccountScreen(),
    DashboardScreen()
  ];

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final labelTextStyle =
        Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 10.0);
    return Scaffold(
      body: _children[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 80.0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: darkOrange,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex,
          selectedLabelStyle: labelTextStyle,
          unselectedLabelStyle: labelTextStyle,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu_outlined),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Recherche',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: 'Commandes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Mon compte',
            ),
          ],
        ),
      ),
    );
  }
}
