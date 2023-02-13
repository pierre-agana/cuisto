import 'package:cuistoapp/app/models/item_model.dart';
import 'package:cuistoapp/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../models/spotlight_best_top_food.dart';
import '../../utils/ui_helper.dart';


class SearchFoodListItemView extends StatelessWidget {
  const SearchFoodListItemView({
    Key? key,
    required this.food,
  }) : super(key: key);

  final Itemes food;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              food.menuimg,
              height: 80.0,
              width: 80.0,
              fit: BoxFit.fill,
            ),
          ),
          UIHelper.horizontalSpaceSmall(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  food.menulibelle,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 15.0),
                ),
                UIHelper.verticalSpaceSmall(),
                Text(food.menudescription,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.grey[600], fontSize: 13.5)),
                Text(
                  '${food.menuprix} CFA',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color:cuistoOrange, fontSize: 13.0),
                ),
                UIHelper.verticalSpaceSmall(),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 14.0,
                      color: Colors.grey[600],
                    ),
                    Text('food.rating'),
                    SizedBox(width: 10,),
                    Text('${food.menudureepreparation} min',style: TextStyle(color: cuistoOrange),),

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
