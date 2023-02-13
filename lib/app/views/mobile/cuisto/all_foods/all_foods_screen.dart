import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../../../models/all_restaurant.dart';
import '../../../../models/spotlight_best_top_food.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/ui_helper.dart';
import '../../../../widgets/mobile/search_food_list_item_view.dart';
import '../groceries/grocery_screen.dart';
import '../popular_category_view.dart';


class AllfoodsScreen extends StatefulWidget {
  const AllfoodsScreen({Key? key}) : super(key: key);

  @override
  State<AllfoodsScreen> createState() => _AllfoodsScreenState();
}

class _AllfoodsScreenState extends State<AllfoodsScreen> {


  final List<String> items = [
    'Table 1',
    'Table 2',
    'Table 3',
    'Table 4',
    'Table 5',
    'Table 6',
    'Table 7',
    'Table 8',
  ];
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PopularcategoriesView(),
                    ),
                    _LargeRestaurantBannerView(
                      title: 'LES MEILLEURS',
                      desc:
                          'découvrir la gastronomie locale fait partie des expériences de voyage les plus enrichissantes',
                      restaurants:
                          LargeRestaurantBanner.getBestInSafetyRestaurants(),
                    ),
                     GroceryListView(
                      title: 'Populaires',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildAppBar(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 5.0, right: 15.0),
        height: 60.0,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back,color: Colors.deepOrange,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            UIHelper.horizontalSpaceSmall(),
            Text(
              'Cuisto App',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 18.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            UIHelper.horizontalSpaceSmall(),
            /*Container(
              alignment: Alignment.center,
              height: 25.0,
              width: 25.0,
              decoration: BoxDecoration(
                border: Border.all(width: 1.3),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Icon(Icons.arrow_forward_ios, size: 13.0),
            ),*/
            UIHelper.horizontalSpaceSmall(),
            /*Text(
              'Other',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 21.0),
            ),*/
            UIHelper.horizontalSpaceExtraSmall(),
            const Spacer(),
            //const Icon(Icons.local_offer),
            UIHelper.horizontalSpaceExtraSmall(),
            Container(
              padding: const EdgeInsets.all(5.0),
              child: TextButton.icon(
                  icon:Icon(Icons.add_alert,color: Colors.white, size: 17,),
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(7.0))),
                            contentPadding: const EdgeInsets.only(top: 10.0),
                            content: Container(
                              width: 300.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget> [
                                  const Center(
                                    child: Text(
                                      "Appeler un serveur",
                                      style: TextStyle(fontSize: 24.0 ,),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    height: 4.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      hint: Text(
                                        'Selectionner votre table',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      items: items
                                          .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                          .toList(),
                                      value: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value as String;
                                        });
                                      },
                                      buttonHeight: 40,
                                      buttonWidth: 200,
                                      itemHeight: 40,
                                      dropdownMaxHeight: 200,
                                      searchController: textEditingController,
                                      searchInnerWidget: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8,
                                          bottom: 4,
                                          right: 8,
                                          left: 8,
                                        ),
                                        child: TextFormField(
                                          controller: textEditingController,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: const EdgeInsets.symmetric(
                                              horizontal: 40,
                                              vertical: 8,
                                            ),
                                            hintText: 'Recherche...',
                                            hintStyle: const TextStyle(fontSize: 15),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                      searchMatchFn: (item, searchValue) {
                                        return (item.value.toString().contains(searchValue));
                                      },
                                      onMenuStateChange: (isOpen) {
                                        if (!isOpen) {
                                          textEditingController.clear();
                                        }
                                      },
                                    ),


                                  ),
                                  InkWell(
                                    onTap: (){
                                      print(selectedValue);
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 20.0, bottom: 20.0),
                                      decoration: BoxDecoration(
                                        color: cuistoOrange,
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(7.0),
                                            bottomRight: Radius.circular(
                                                7.0)),
                                      ),
                                      child: const Text(
                                        "Appeler",
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                    );
                  },
                  label: const Text('Appeler un serveur',style: TextStyle (
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w200
                  )),
                  style: TextButton.styleFrom(
                    backgroundColor: cuistoOrange,
                  )
              ),
            ),
          ],
        ),
      );
}

class _LargeRestaurantBannerView extends StatelessWidget {
  const _LargeRestaurantBannerView({
    Key? key,
    required this.title,
    required this.desc,
    required this.restaurants,
  }) : super(key: key);

  final String title;
  final String desc;
  final List<LargeRestaurantBanner> restaurants;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      color: Colors.blueGrey[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          UIHelper.verticalSpaceMedium(),
          Text(
            title,
            style:
                Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 18.0),
          ),
          UIHelper.verticalSpaceSmall(),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
          ),
          UIHelper.verticalSpaceSmall(),
          LimitedBox(
            maxHeight: 310.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: restaurants.length,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(10.0),
                width: 160.0,
                child: Column(
                  children: <Widget>[
                    UIHelper.verticalSpaceMedium(),
                    Image.asset(
                      restaurants[index].image,
                      height: 160.0,
                      fit: BoxFit.cover,
                    ),
                    UIHelper.verticalSpaceMedium(),
                    Text(
                      restaurants[index].title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0,
                          ),
                    ),
                    UIHelper.verticalSpaceMedium(),
                    Container(
                      height: 2.0,
                      width: 50.0,
                      color: Colors.grey[400],
                    ),
                    UIHelper.verticalSpaceSmall(),
                    Text(
                      restaurants[index].subtitle,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
