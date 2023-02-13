import 'package:cuistoapp/app/models/item_model.dart';
import 'package:cuistoapp/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/popular_brands.dart';
import '../../models/spotlight_best_top_food.dart';
import '../../utils/ui_helper.dart';
import '../../views/mobile/cuisto/bottomModal.dart';
import '../../views/mobile/cuisto/categories/categorie_detail_screen.dart';
import '../responsive.dart';

class SpotlightBestTopFoodItem extends StatelessWidget {
   SpotlightBestTopFoodItem({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final  Itemes restaurant;

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);

    return InkWell(
      onTap: isTabletDesktop
          ? () {
        Get.to(
          ModalBottomSheet(foods: restaurant),
          fullscreenDialog: true,
          transition: Transition.zoom,
        );
      }
          : () {
       /* Get.to(
          CategorieDetailScreen(brands: brands),
        );*/
        Get.to(
          ModalBottomSheet(foods: restaurant),
          fullscreenDialog: true,
          transition: Transition.zoom,
        );
            },
      child: Container(
        margin: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                  )
                ],
              ),
              child: Image.network(
                restaurant.menuimg,
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            UIHelper.horizontalSpaceSmall(),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    restaurant.menulibelle,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 18.0),
                  ),
                  Text(
                    restaurant.menudescription,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.grey[800], fontSize: 13.5),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Text(
                    '${restaurant.menuprix.toInt()} CFA',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: cuistoOrange, fontSize: 13.0),
                  ),
                  const Divider(),
                  FittedBox(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 14.0,
                          color: Colors.grey[600],
                        ),
                        Text(
                          'rating',
                          style: const TextStyle(fontSize: 12.0),
                        ),
                        SizedBox(width: 10,),
                        Icon(
                          Icons.timer,
                          size: 14.0,
                          color: Colors.grey[600],
                        ),
                        Text(
                         '${ restaurant.menudureepreparation} min',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: cuistoOrange, fontSize: 12.0),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
