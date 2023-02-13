import 'package:cuistoapp/app/views/mobile/cuisto/cuistoScreen.dart';
import 'package:cuistoapp/app/views/mobile/cuisto/popular_category_view.dart';
import 'package:flutter/material.dart';
import '../../models/spotlight_best_top_food.dart';
import '../../utils/ui_helper.dart';
import '../../widgets/custom_divider_view.dart';
import '../mobile/cuisto/best_view.dart';
import '../mobile/cuisto/categories/categorie_vertical_list_view.dart';
import '../mobile/cuisto/in_the_spotlight_view.dart';
import '../mobile/cuisto/offers/offer_banner_view.dart';
import '../mobile/cuisto/cuisto_banner_view.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key, this.expandFlex = 6}) : super(key: key);

  final int expandFlex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: expandFlex,
      child: Container(
        padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
        color: Colors.grey[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Search(),
            _Body(),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OfferBannerView(),
            const CustomDividerView(),
            PopularcategoriesView(),
            const CustomDividerView(),
            InTheSpotlightView(),
            const CustomDividerView(),
            const SwiggySafetyBannerView(),
            BestInSafetyViews(),
            const CustomDividerView(),
            RestaurantVerticalListView(
              title: 'Populaires',
              restaurants: SpotlightBestTopFood.getPopularAllRestaurants(),
            ),
            const SeeAllRestaurantBtn(),
            const LiveForFoodView()
          ],
        ),
      ),
    );
  }
}

class _Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: const Offset(2.0, 2.0),
          )
        ],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: (){print('search');},
              child: const Icon(Icons.search_outlined)
          ),
          UIHelper.horizontalSpaceMedium(),
          Expanded(
            child: /*Text(
              'Qu\'est-ce que vous aimeriez manger ?',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),*/ TextFormField(

            )
          ),
          UIHelper.horizontalSpaceMedium(),
          const Icon(Icons.filter_list_outlined)
        ],
      ),
    );
  }
}
