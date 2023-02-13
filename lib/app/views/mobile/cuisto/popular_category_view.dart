import 'package:cuistoapp/app/controller/ItemesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../controller/catgoryMenuController.dart';
import '../../../models/popular_brands.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/ui_helper.dart';
import '../../../widgets/responsive.dart';
import 'categories/categorie_detail_screen.dart';


 class PopularcategoriesView extends StatelessWidget {
  final brands = PopularBrands.getPopularBrands();

  PopularcategoriesView({Key? key}) : super(key: key);
  var restaurantid = 1 ;
  CategoryMenuController _categoryMenuController = Get.put(CategoryMenuController());

  @override

  /*void initState() {
    _categoryMenuController.categoryMenu;
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          UIHelper.verticalSpaceSmall(),
          _buildPopularHeader(context),
          LimitedBox(
            maxHeight: 160.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: FutureBuilder(
                future: _categoryMenuController.getCategoryMenu(restaurantid.toString()),
                builder: (context, snapshot){
                  return snapshot.hasData
                      ? _categoryMenuController.categoryMenu.length>0
                      ?ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _categoryMenuController.categoryMenu.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: isTabletDesktop
                            ? () {
                                Get.to(
                                  CategorieDetailScreen(category:_categoryMenuController.categoryMenu[index] ),
                                );
                                print('menu');
                                print(' _categoryMenuController.getCategoryMenu(index.toString()),');
                                print('menu');
                              }
                            : () {
                          Get.to(
                            CategorieDetailScreen(category:_categoryMenuController.categoryMenu[index] ),
                          );
                              },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Container(
                              margin: const EdgeInsets.only(right: 15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey[300]!,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    child: ClipOval(
                                      child: Image.network(
                                        _categoryMenuController
                                            .categoryMenu[index]
                                            .categoriemenuimage,
                                        height: 70.0,
                                        width: 70.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  UIHelper.verticalSpaceSmall(),
                                  Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: cuistoOrange,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Padding(
                                        padding: EdgeInsets.all(7),
                                        child: Text(
                                          _categoryMenuController
                                              .categoryMenu[index]
                                              .categoriemenulibelle,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ],
                              ),
                            )),
                      ),
                    )
                      :
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
                        center: Text("100%"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: cuistoOrange,
                      ),);
                  }),
            ),
          )
        ],
      ),
    );
  }

  Column _buildPopularHeader(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Categories',
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 20.0),
          ),
          UIHelper.verticalSpaceExtraSmall(),
          Text(
            'Les plus commandés ',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.grey),
          ),
        ],
      );
}
