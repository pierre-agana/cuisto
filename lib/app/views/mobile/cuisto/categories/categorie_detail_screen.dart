import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:cuistoapp/app/models/popular_brands.dart';
import 'package:cuistoapp/app/utils/app_colors.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../controller/ItemesController.dart';
import '../../../../models/restaurant_detail.dart';
import '../../../../utils/ui_helper.dart';
import '../../../../widgets/custom_divider_view.dart';
import '../../../../widgets/responsive.dart';
import '../../../../widgets/veg_badge_view.dart';

class CategorieDetailScreen extends StatefulWidget {

  const CategorieDetailScreen( {Key? key, required this.category} ) : super(key: key);
  final category;


  @override
  CategorieDetailScreenState createState() => CategorieDetailScreenState();
}

class CategorieDetailScreenState extends State<CategorieDetailScreen> {
  TextEditingController textController = TextEditingController();

  var restaurantid = 1;

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // focusNode = FocusNode();

    // focusNode?.requestFocus()
  }
  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.categoriemenulibelle,style: TextStyle(fontWeight: FontWeight.w500,color: cuistoOrange,fontSize: 18,),),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        actions: <Widget>[
          Center(
            child: Text('Appeler un serveur',style: TextStyle (
                color: cuistoOrange,
                fontSize: 12,
                fontWeight: FontWeight.w200
            )),
          ),
          UIHelper.horizontalSpaceMedium(),
      AnimSearchBar(
              width: 250,
              textController: textController,
              textFieldIconColor: cuistoOrange,
              suffixIcon: const Icon(Icons.close,color: Colors.deepOrange,),
              onSuffixTap: () {
                setState(() {
                  textController.clear();
                });
              },
              //color: cuistoOrange!,
              helpText: "Recherche...",
              //focusNode: focusNode,
              autoFocus: true,
              closeSearchOnSuffixTap: true,
              animationDurationInMilli: 1000,
              rtl: true,
              onSubmitted: (String ) {
                print(String);
      },
            )

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomDividerView(dividerHeight: 1.0),
                  UIHelper.verticalSpaceMedium(),
                  Column(
                    children: <Widget>[
                      _buildOfferTile(
                          context, "Remise jusqu'à 30%"),
                      _buildOfferTile(context,
                          "Réduction jusqu'à 40% avec les cartes de crédit Orange Bank, une fois par semaine")
                    ],
                  ),
                  UIHelper.verticalSpaceSmall(),
                ],
              ),
            ),
            const CustomDividerView(dividerHeight: 15.0),
            /* Container(
            height: 80.0,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.filter_vintage,
                        color: Colors.deepOrange,
                        size: 12.0,
                      ),
                      UIHelper.horizontalSpaceExtraSmall(),
                      Text('Recommande',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 16.0))
                    ],
                  ),
                ),
                const CustomDividerView(dividerHeight: 0.5, color: Colors.black)
              ],
            ),
          ),*/
            _RecommendedFoodView(widget.category.categoriemenuid.toString(),restaurantid.toString())
          ],
        ),
      )

    );
  }
  Padding _buildOfferTile(BuildContext context, String desc) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      children: <Widget>[
        Icon(Icons.local_offer, color: cuistoOrange, size: 15.0),
        UIHelper.horizontalSpaceSmall(),
        Flexible(
          child: Text(
            desc,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 13.0),
          ),
        )
      ],
    ),
  );

}

class _RecommendedFoodView extends StatelessWidget {
  _RecommendedFoodView(this.cateId ,this.restaurantid);
  final foods = RestaurantDetail.getBreakfast();
  ItemsController itemsController = Get.put(ItemsController());
  String restaurantid ;
  String cateId ;

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);
    return Container(
      padding: isTabletDesktop ? const EdgeInsets.all( 20.0) :const EdgeInsets.all( 10.0),
      child: FutureBuilder(
          future: itemsController.getItemsByCategory(cateId.toString(),restaurantid.toString()),
          builder: (context, snapshot){
            return snapshot.hasData
                ? itemsController.itemes.length >0
                ?GridView.count(
              shrinkWrap: true,
              crossAxisCount: isTabletDesktop ? 4: 2,
              childAspectRatio: 0.8,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                itemsController.itemes.length,
                    (index) => Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Image.network(
                          itemsController.itemes[index].menuimg,
                          fit: BoxFit.fill,
                        ),
                      ),
                      UIHelper.verticalSpaceExtraSmall(),
                      SizedBox(
                        height: 90.0,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Row(
                              children: <Widget>[
                                const VegBadgeView(),
                                UIHelper.horizontalSpaceExtraSmall(),
                                Flexible(
                                  child: Text(
                                    itemsController.itemes[index].menulibelle,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style:
                                    const TextStyle(fontWeight: FontWeight.bold ,fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpaceMedium(),
                            Text(
                              itemsController.itemes[index].menudescription,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 10.0,
                                color: Colors.grey[700],
                              ),
                            ),
                            UIHelper.verticalSpaceExtraSmall(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('${itemsController.itemes[index].menuprix.toInt()}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontSize: 14.0)),
                                InkWell(
                                    onTap: (){
                                      print( itemsController.itemes[index].menulibelle);
                                      print( itemsController.itemes[index].menuprix.toInt());
                                    },
                                    child:  AddBtnView()
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
      /*GridView.count(
        shrinkWrap: true,
        crossAxisCount: isTabletDesktop ? 4: 2,
        childAspectRatio: 0.8,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          itemsController.itemes.length,
          (index) => Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    itemsController.itemes[index].menuimg,
                    fit: BoxFit.fill,
                  ),
                ),
                UIHelper.verticalSpaceExtraSmall(),
                SizedBox(
                  height: 90.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Row(
                        children: <Widget>[
                          const VegBadgeView(),
                          UIHelper.horizontalSpaceExtraSmall(),
                          Flexible(
                            child: Text(
                              itemsController.itemes[index].menulibelle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold ,fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpaceMedium(),
                      Text(
                        itemsController.itemes[index].menudescription,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 10.0,
                          color: Colors.grey[700],
                        ),
                      ),
                      UIHelper.verticalSpaceExtraSmall(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('${itemsController.itemes[index].menuprix.toInt()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 14.0)),
                          InkWell(
                            onTap: (){
                              print( itemsController.itemes[index].menulibelle);
                              print( itemsController.itemes[index].menuprix.toInt());
                            },
                              child:  AddBtnView()
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),*/
    );
  }
}

class AddBtnView extends StatelessWidget {
  const AddBtnView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrange,),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        'Ajouter',
        style: Theme.of(context)
            .textTheme
            .subtitle2!
            .copyWith(color: cuistoOrange),
      ),
    );
  }
}
