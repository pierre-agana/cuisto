import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/ItemesController.dart';
import '../../../models/spotlight_best_top_food.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/ui_helper.dart';
import '../../../widgets/custom_divider_view.dart';
import '../../../widgets/mobile/drawer/cartBtn.dart';
import '../../../widgets/mobile/search_food_list_item_view.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
  //  _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
   // _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 2.0, bottom: 2.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]!),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Recherche',
                          hintStyle:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: Colors.grey,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpaceMedium(),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpaceExtraSmall(),
              UIHelper.verticalSpaceSmall(),
              Expanded(
                child: _SearchListView(),
              ),
            ],
          ),
        ),
      ),
        floatingActionButton: DraggableFab(
            child: DraggableFabview()
        )
    );
  }
}

class _SearchListView extends StatelessWidget {
  final List<SpotlightBestTopFood> foods = [
    ...SpotlightBestTopFood.getPopularAllRestaurants(),
    ...SpotlightBestTopFood.getPopularAllRestaurants()
  ];
  ItemsController itemsController = Get.put(ItemsController());
  @override
  Widget build(BuildContext context) {
    foods.shuffle();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemsController.itemes.length,
      itemBuilder: (context, index) => SearchFoodListItemView(
        food: itemsController.itemes[index],
      ),
    );
  }
}
