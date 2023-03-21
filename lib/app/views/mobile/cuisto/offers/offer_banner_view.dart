import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/responsive.dart';
import '../groceries/grocery_screen.dart';

class OfferBannerView extends StatelessWidget {
  final List<String> image = [
    'assets/image/banner1.jpg',
    'assets/image/banner2.jpg',
    'assets/image/banner3.jpg',
    'assets/image/banner4.jpg',
  ];

  OfferBannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);

    return /*InkWell(
      child:*/ Container(
        margin: const EdgeInsets.symmetric(vertical: 1.5),
        height: isTabletDesktop ? 260.0 : 180.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isTabletDesktop ? 13.0 : 10.0),
        ),
        child: Swiper(
          itemHeight: 100,
          duration: 500,
          itemWidth: double.infinity,
          pagination: const SwiperPagination(),
          itemCount: image.length,
          itemBuilder: (BuildContext context, int index) => Image.asset(
            image[index],
            fit: BoxFit.cover,
          ),
          autoplay: true,
          viewportFraction: 1.0,
          scale: 0.9,
        ),
      )
      /*onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GroceryScreen( ),
          ),
        );
      },
    )*/;
  }
}
