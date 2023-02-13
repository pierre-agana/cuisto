/*
import 'package:cuistoapp/app/models/menus.dart';
import 'package:flutter/material.dart';
import '../../models/categoryMenu.dart';
import '../../utils/ui_helper.dart';


class MenuListItemView extends StatelessWidget {
  const MenuListItemView({
    Key? key,
    required this.categoryMenu,
  }) : super(key: key);

  final CategoryMenu categoryMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
              categoryMenu.categoriemenuimage,
              height: 80.0,
              width: 80.0,
              fit: BoxFit.cover,
            ),
          ),
          UIHelper.horizontalSpaceSmall(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  categoryMenu.categoriemenulibelle,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 18.0),textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
*/
