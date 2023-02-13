import 'package:cuistoapp/app/controller/ItemesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../models/spotlight_best_top_food.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/ui_helper.dart';
import '../../../../widgets/mobile/search_food_list_item_view.dart';
import '../../../../widgets/responsive.dart';
import '../bottomModal.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const _GroceryHeaderView(),
            UIHelper.verticalSpaceMedium(),
             GroceryListView(
              title: 'Special Hamburger',
            ),
          ],
        ),
      ),
    );
  }
}

class _GroceryHeaderView extends StatelessWidget {
  const _GroceryHeaderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);

    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/image/banner3.jpg',
          height: MediaQuery.of(context).size.height / 2.1,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        if (!isTabletDesktop)
          Positioned(
            top: 40.0,
            left: 0.4,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 28.0,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
      ],
    );
  }
}

class GroceryListView extends StatelessWidget {
   GroceryListView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
   var restaurantid = 1;
  ItemsController itemsController = Get.put(ItemsController());

  @override
  Widget build(BuildContext context) {

    final headerStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontWeight: FontWeight.w500, fontSize: 13.0);

    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: headerStyle,
              ),
              const Spacer(),
              UIHelper.horizontalSpaceSmall(),
            ],
          ),
          UIHelper.verticalSpaceSmall(),
          FutureBuilder(
              future: itemsController.getItems('',restaurantid.toString()),
              builder:(context, snapshot){
                return snapshot.hasData
                    ? itemsController.itemes.length >0
                    ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: itemsController.itemes.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.to(
                            ModalBottomSheet(foods: itemsController.itemes[index]),
                            fullscreenDialog: true,
                            transition: Transition.zoom,
                          );
                        },
                        child: SearchFoodListItemView(
                          food: itemsController.itemes[index],
                        ),
              ),
            ):
                Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Pas de ",
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
                    center: Text("100%",style: TextStyle(color: Colors.white),),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: cuistoOrange,
                  ),);
          }
          )
        ],
      ),
    );
  }
}
