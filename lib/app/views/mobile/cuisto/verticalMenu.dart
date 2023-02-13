
import 'package:draggable_fab/draggable_fab.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../controller/catgoryMenuController.dart';
import '../../../controller/menuController.dart';
import '../../../models/menus.dart';
import '../../../models/spotlight_best_top_food.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/ui_helper.dart';
import '../../../widgets/mobile/appBar.dart';
import '../../../widgets/mobile/drawer/cartBtn.dart';
import 'categories/categorie_vertical_list_view.dart';

class VerticalMenu extends StatefulWidget{
  const VerticalMenu({super.key});

  @override
  _verticalMenuState createState()=> _verticalMenuState();
}

class _verticalMenuState extends State<VerticalMenu>{

  int selectorIndex = 0;
  PageController _pageController = PageController();
  CategoryMenuController _categoryMenuController = Get.put(CategoryMenuController());
  int pageCount = 10;

  @override
  void initState() {
    _categoryMenuController;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            AppBarview(
              text: "Menu",
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Obx(()=>LoadingOverlay(
                isLoading: _categoryMenuController.isLoading.value,
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: ListView.separated(
                        itemCount: _categoryMenuController.categoryMenu.length,
                        separatorBuilder: (BuildContext context ,int index ) {
                            return const SizedBox(
                              height: 5,
                            );
                          },
                          itemBuilder: (BuildContext context ,int index ) {
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectorIndex = index;
                                  _pageController.jumpToPage(index);
                                });
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                    height: (selectorIndex == index) ? 50 : 0,
                                      width: 5,
                                      decoration: const BoxDecoration(
                                          color: Colors.deepOrange,
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                    ),
                                    Expanded(
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 500),
                                          decoration: BoxDecoration(
                                              color: (selectorIndex == index) ? Colors.deepOrange.withOpacity(0.1) : Colors.transparent,
                                              borderRadius: const BorderRadius.only(
                                                topRight:Radius.circular(10),
                                                  bottomRight:Radius.circular(10)
                                              )
                                          ),
                                          alignment: Alignment.center,
                                          height: 50,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 0),
                                            child: Center(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(width: 2,),
                                                    Text(_categoryMenuController.categoryMenu[index].categoriemenulibelle.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,
                                                        color :(selectorIndex == index)? Colors.deepOrange : Colors.black),),
                                                  ],
                                                )
                                            ),
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                      ),
                    ),
                    Expanded(
                        child: PageView(
                          controller: _pageController,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            for( var i = 0; i < _categoryMenuController.categoryMenu.length; i++)
                            Container(
                              //color:  Colors.deepOrange.withOpacity(0.1),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(  _categoryMenuController.categoryMenu[i].categoriemenulibelle.toUpperCase(),style: const TextStyle(fontWeight: FontWeight.bold,
                                        color : Colors.deepOrange,fontSize: 20, ),),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: 1,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return RestaurantVerticalListView(
                                          title: ' ',
                                          restaurants:
                                          SpotlightBestTopFood.getPopularAllRestaurants(),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              )
              ),
            ),
          ],
        ),
      ),
        floatingActionButton: const DraggableFab(
            child: DraggableFabview()
        )
      );
  }


}