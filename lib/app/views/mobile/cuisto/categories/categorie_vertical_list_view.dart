import 'package:cuistoapp/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/popular_brands.dart';
import '../../../../models/spotlight_best_top_food.dart';
import '../../../../utils/ui_helper.dart';
import '../../../../widgets/mobile/food_list_item_view.dart';
import '../../../../widgets/responsive.dart';
import '../../../tab_desktop/itemsBottomSheet.dart';
import '../bottomModal.dart';
import 'categorie_detail_screen.dart';

class RestaurantVerticalListView extends StatelessWidget {
  final String title;
  final List<SpotlightBestTopFood> restaurants;
  final brands = PopularBrands.getPopularBrands();
  final bool isAllRestaurantNearby;

   RestaurantVerticalListView({
    Key? key,
    required this.title,
    required this.restaurants,
    this.isAllRestaurantNearby = false,
  })  : assert(title != ''),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 20.0),
          ),
           Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    UIHelper.verticalSpaceExtraSmall(),
                    Text(
                      'Découvrez des saveurs uniques près de chez vous',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 14.0),
                    ),
                  ],
                ),
              const SizedBox(),
          UIHelper.verticalSpaceMedium(),
          isTabletDesktop || Responsive.isDesktop(context) ? Container(
            alignment: Alignment.center,
            height: 460,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 230,
                    childAspectRatio: 4 / 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: restaurants.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap:  () {
                      Get.dialog(
                        Dialog(child: ItemBottomSheet(foods: restaurants[index])),
                      );
                     /* Get.to(
                          ItemBottomSheet()
                       *//* ModalBottomSheet(foods: restaurants[index]),
                        fullscreenDialog: true,
                        transition: Transition.zoom,*//*
                      );*/
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x3600000F),
                            offset: Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                    child: Image.network(
                                      restaurants[index].image,
                                      width: 100,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                                    child: Text(
                                      restaurants[index].name,style: TextStyle(fontWeight: FontWeight.bold,),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(4, 4, 0, 0),
                                    child: Icon(Icons.star,size: 15,color: cuistoOrange,)
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                                    child: Text(
                                      restaurants[index].rating,style: TextStyle(color: cuistoOrange),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 0 ),
                                    child: Text(
                                      restaurants[index].price,style: TextStyle(color: cuistoOrange),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(4, 4, 0, 0),
                            child:Text(
                             restaurants[index].desc,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              softWrap: false,
                            ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ) : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: restaurants.length,
            itemBuilder: (context, index) => InkWell(
              onTap: /*isTabletDesktop
                  ? () {
                Get.to(
                  ModalBottomSheet(foods: restaurants[index]),
                  fullscreenDialog: true,
                  transition: Transition.zoom,
                );
              }
                  :*/ () {
                Get.to(
                  ModalBottomSheet(foods: restaurants[index]),
                  fullscreenDialog: true,
                  transition: Transition.zoom,
                );
                    },
              child: FoodListItemView(
                restaurant: restaurants[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
