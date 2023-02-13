import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';

import '../../widgets/mobile/drawer/cartBtn.dart';
import '../../widgets/responsive.dart';
import 'cart_view.dart';
import 'home_view.dart';
import 'menu_view.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          MenuView(),
          HomeView(),
          CartView(),
        ],
      ),
      floatingActionButton:  DraggableFab(
          child: Responsive.isTabletDesktop(context) || Responsive.isDesktop(context)? DraggableFabview() : DraggableFabview()
      ),
    );
  }
}
