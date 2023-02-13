import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../controller/ItemesController.dart';
import '../../../models/spotlight_best_top_food.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/ui_helper.dart';
import '../../../widgets/mobile/spotlight_best_top_food_item.dart';
import '../../../widgets/responsive.dart';

class InTheSpotlightView extends StatelessWidget {
  final restaurants = SpotlightBestTopFood.getSpotlightRestaurants();

  var restaurantid = 1 ;
  ItemsController itemsController = Get.put(ItemsController());

  InTheSpotlightView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);
    final customWidth =
        MediaQuery.of(context).size.width / (isTabletDesktop ? 3.8 : 1.1);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          UIHelper.verticalSpaceSmall(),
          _buildSpotlightHeaderView(context),
          UIHelper.verticalSpaceMedium(),
          LimitedBox(
            maxHeight: 270.0,
            child: FutureBuilder(
                future: itemsController.getItems('', restaurantid.toString()),
                builder: (context, snapshot){
                  return snapshot.hasData
                      ? itemsController.itemes.length>0
                      ?GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 90 / 270,
                      crossAxisCount: 2,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: itemsController.itemes.length,
                    itemBuilder: (context, index) => SizedBox(
                      width: customWidth,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SpotlightBestTopFoodItem(restaurant: itemsController.itemes[index]),
                        ],
                      ),
                    ),
                  )
                      :
                  Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text("Pas de menu ",
                              style:TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'OpenSans',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          Padding(padding: EdgeInsets.all(2)),
                        ],
                      )
                  ) :
                  Center(
                    child: LinearPercentIndicator(
                      barRadius: Radius.circular(10),
                      width: MediaQuery.of(context).size.width - 50,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 250,
                      percent: 1,
                      center: Text("100%"),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: cuistoOrange,
                    ),);
                }),

          ),
        ],
      ),
    );
  }

  Container _buildSpotlightHeaderView(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Icon(Icons.shopping_basket, size: 20.0),
                UIHelper.horizontalSpaceSmall(),
                Text(
                  'A la une',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 20.0),
                )
              ],
            ),
            UIHelper.verticalSpaceExtraSmall(),
            Text(
              'Explorez les meilleurs plats',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.grey),
            ),
          ],
        ),
      );
}
