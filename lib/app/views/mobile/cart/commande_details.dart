import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/ui_helper.dart';
import '../../../widgets/custom_divider_view.dart';
import '../../../widgets/dotted_seperator_view.dart';

class Commande_details extends StatelessWidget {

  Commande_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        foregroundColor: cuistoOrange,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _AppBar(),

              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15.0),
                height: 50.0,
                color: Colors.grey[200],
                child: Text(
                  'Details de la commande',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.grey[700], fontSize: 12.0),
                ),
              ),
              _PastOrderListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subtitleStyle = Theme.of(context).textTheme.bodyText1;

    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'CMD-3457-2023',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              const Spacer(),
              Text('Paye', style: Theme.of(context).textTheme.subtitle2),
              UIHelper.horizontalSpaceSmall(),
              ClipOval(
                child: Container(
                  padding: const EdgeInsets.all(2.2),
                  color: Colors.green,
                  child: const Icon(Icons.check,
                      color: Colors.white, size: 14.0),
                ),
              )
            ],
          ),
          UIHelper.verticalSpaceSmall(),
          Row(
            children: <Widget>[
              Text('27 Janvier 2023 10:50 ', style: subtitleStyle),
              UIHelper.horizontalSpaceSmall(),
              ClipOval(
                child: Container(
                  height: 3.0,
                  width: 3.0,
                  color: Colors.grey[700],
                ),
              ),
              UIHelper.horizontalSpaceSmall(),
              Text('Table N-3', style: subtitleStyle)
            ],
          ),
          UIHelper.verticalSpaceLarge(),
          const CustomDividerView(
            dividerHeight: 1.8,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}



class _PastOrderListView extends StatelessWidget {
  final List<String> foods = [
    'Francisco',
    'Street',
    'Truck',
  ];

  final List<String> foodItem = [
    'Quantite x 1',
    'Chicken Noodles x 1',
    'Milk Tea x 1',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          itemCount: foods.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _PastOrdersListItemView(
            restaurant: foods[index],
            foodItem: foodItem[index],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
             alignment: Alignment.center,
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepOrangeAccent,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Text(
              '20.000 CFA',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: darkOrange,fontSize: 18),
            ),

          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 20.0),
          height: 130.0,
          color: Colors.grey[200],
          child: Text(
            'Cuisto Version v1.0.0',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.grey[700], fontSize: 13.0),
          ),
        )
      ],
    );
  }
}

class _PastOrdersListItemView extends StatelessWidget {
  const _PastOrdersListItemView({
    Key? key,
    required this.restaurant,
    required this.foodItem,
  })  : assert(restaurant != '', foodItem != ''),
        super(key: key);

  final String restaurant;
  final String foodItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      restaurant,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    UIHelper.verticalSpaceExtraSmall(),
                    Text(
                      'Medavakkam',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12.0),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(foodItem,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                        SizedBox(width: 20,),
                        Icon(Icons.keyboard_arrow_right,
                            color: cuistoOrange),
                        const Text('4.500 CFA',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.deepOrange,fontSize: 16),),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          UIHelper.verticalSpaceSmall(),
          const DottedSeperatorView(),
        ],
      ),
    );
  }
}
