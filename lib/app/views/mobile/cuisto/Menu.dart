import 'package:cuistoapp/app/controller/catgoryMenuController.dart';
import 'package:cuistoapp/app/models/menus.dart';
import 'package:cuistoapp/app/widgets/mobile/menusList.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../models/spotlight_best_top_food.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/ui_helper.dart';
import '../../../widgets/custom_divider_view.dart';
import '../../../widgets/mobile/drawer/cartBtn.dart';
import '../../../widgets/mobile/search_food_list_item_view.dart';
import 'package:intl/intl.dart';

import '../home_bottom_navigation_screen.dart';
import 'cuistoScreen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final CategoryMenuController _categoryMenuController =Get.put(CategoryMenuController());

  @override
  void initState() {
    super.initState();
   // _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    //_tabController!.dispose();
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
                    Positioned(
                      top: 40.0,
                      left: 0.4,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 28.0,
                          color:Colors.deepOrange,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeBottomNavigationScreen(),
                            ),
                          );
                        },
                      ),
                    ),
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
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpaceExtraSmall(),
              UIHelper.verticalSpaceExtraSmall(),
              Text('Menu', style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(fontSize:20,fontWeight: FontWeight.w500,color: Colors.deepOrange), textAlign: TextAlign.center,),
              UIHelper.verticalSpaceExtraSmall(),
              UIHelper.verticalSpaceExtraSmall(),

              Expanded(
                child:  _SearchListView(),
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
  final List<MenuFood> menus = [
    ...MenuFood.getPopularAllRestaurants(),
  ];

  CategoryMenuController _categoryMenuController = Get.put(CategoryMenuController());

  @override
  Widget build(BuildContext context) {
    menus.shuffle();

    return Obx(()=>LoadingOverlay(
      isLoading: _categoryMenuController.isLoading.value,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _categoryMenuController.categoryMenu.length,
        itemBuilder: (context, index) =>  !_categoryMenuController.categoryMenu.isEmpty ?
      Center(
         // categoryMenu: _categoryMenuController.categoryMenu[index],
        ):Center(
          child: Text("Aucun Menu"),
        ),
      ),
    )
    );
  }
}
