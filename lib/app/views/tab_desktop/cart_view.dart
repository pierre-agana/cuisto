import 'package:flutter/material.dart';

import '../../models/menus.dart';
import '../../models/tab_desktop/order_menu.dart';
import '../../utils/app_colors.dart';
import '../../utils/ui_helper.dart';


class CartView extends StatelessWidget {
  const CartView({Key? key, this.isTab = false}) : super(key: key);

  final bool isTab;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.only(
            left: isTab ? 20.0 : 13.0,
            top: 10.0,
            right: isTab ? 20.0 : 13.0,
            bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 8.0 , right: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[100],
                ),
                height: 75.0,
                width: MediaQuery.of(context).size.width/6.5
                ,
                child: Row(
                  children: const [
                    Icon(
                      Icons.notifications_outlined,color: Colors.deepOrange ,
                    ),
                    Text("Appeler un serveur" ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.deepOrange),)
                  ],
                )
            ),
            _MyOrdersList(),
            _Checkout(),
          ],
        ),
      ),
    );
  }
}

class _UserHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  UIHelper.horizontalSpaceMedium(),

                  UIHelper.horizontalSpaceMedium(),

                  UIHelper.horizontalSpaceMedium(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyOrdersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final cartItems = OrderMenu.getCartItems();
    final List<MenuFood> menus = [
      ...MenuFood.getPopularAllRestaurants(),
    ];

    return Expanded(
      flex: 6,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(' Menu',
                    style: Theme.of(context).textTheme.headline6),
                const Spacer(),
                Text('Voir plus',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: cuistoOrange)),
              ],
            ),
            UIHelper.verticalSpaceSmall(),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: List.generate(
                  menus.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 4.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.grey),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18.0),
                          child: Image.asset(
                            menus[index].image,
                            height: 70.0,
                            width: 80.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                        UIHelper.horizontalSpaceSmall(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(menus[index].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: 14.0)),
                              UIHelper.verticalSpaceMedium(),
                            /*  Row(
                                children: [
                                  const Icon(Icons.close, size: 18.0),
                                  UIHelper.horizontalSpaceMedium(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0, horizontal: 10.0),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.grey[300]!),
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.grey[100],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('{cartItems[index].quantity}'),
                                        const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )*/
                            ],
                          ),
                        ),
                      /*  Text(
                          '{cartItems[index].price} FCA',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: 16.0, fontWeight: FontWeight.w800),
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listTileStyle = Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(fontSize: 14.0, fontWeight: FontWeight.w600);
    final amountStyle = Theme.of(context)
        .textTheme
        .headline6!
        .copyWith(fontSize: 15.0, fontWeight: FontWeight.bold);

    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          ListTile(
            dense: true,
            // title: Text(' Total', style: listTileStyle),
            trailing: Text('235 FCA', style: amountStyle),
          ),
        /*  Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: swiggyOrange!),
              color: Colors.deepOrange[50],
            ),
            child: Row(
              children: [
                const Expanded(child: Text('Trouver une promotion')),
                UIHelper.horizontalSpaceMedium(),
                SizedBox(
                  height: 38.0,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.countertops_outlined),
                    label: const Text('Ajouter le code promo'),
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: swiggyOrange,
                      elevation: 0.0,
                    ),
                  ),
                ),
              ],
            ),
          ),*/
          const Divider(),
          ListTile(
            dense: true,
            title: Text('A Paye', style: listTileStyle),
            trailing: Text('5400 FCA', style: amountStyle),
          ),
          UIHelper.verticalSpaceMedium(),
          SizedBox(
            height: 45.0,
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.countertops_outlined),
              label: const Text('Payer'),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: cuistoOrange,
              ),
            ),
          )
        ],
      ),
    );
  }
}
