import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../views/mobile/cart/cart_screen.dart';

class DraggableFabview extends StatefulWidget {
  const DraggableFabview({Key? key }) : super(key: key);

  @override
  State<DraggableFabview> createState() => _DraggableFabviewState();
}

class _DraggableFabviewState extends State<DraggableFabview> {
  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      backgroundColor: cuistoOrange,
      onPressed: () {
        Get.to(
            CartScreen()
        );
      },
      tooltip: 'Mon pannier',
      child: const Icon(Icons.shopping_cart),
    );
  }
  
}