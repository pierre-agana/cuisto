import 'package:draggable_fab/draggable_fab.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth_controller.dart';
import '../../../models/spotlight_best_top_food.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/ui_helper.dart';
import '../../../widgets/custom_divider_view.dart';
import '../../../widgets/mobile/appBar.dart';
import '../../../widgets/mobile/drawer/cartBtn.dart';
import '../../../widgets/responsive.dart';
import '../cart/cart_screen.dart';
import 'all_foods/all_foods_screen.dart';
import 'categories/categorie_vertical_list_view.dart';
import 'food_groceries_availability_view.dart';
import 'in_the_spotlight_view.dart';
import 'offers/offer_banner_view.dart';
import 'top_offer_view.dart';
import 'top_picks_for_you_view.dart';


class CuistoScreen extends StatefulWidget {
  const CuistoScreen({Key? key}) : super(key: key);

  @override
  State<CuistoScreen> createState() => _CuistoScreenState();
}

class _CuistoScreenState extends State<CuistoScreen> {

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
  final AuthController _authController = Get.put(AuthController());

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //_buildAppBar(context),
            const AppBarview(
              text: "Cuisto App",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    OfferBannerView(),
                    const FoodGroceriesAvailabilityView(),
                    TopPicksForYouView(),
                    const CustomDividerView(),
                    InTheSpotlightView(),
                    const CustomDividerView(),
                    //TopOffersViews(),
                    const CustomDividerView(),
                    RestaurantVerticalListView(
                      title: 'Populaires',
                      restaurants: SpotlightBestTopFood.getPopularAllRestaurants(),
                    ),
                    const CustomDividerView(),
                    const SeeAllRestaurantBtn(),
                    const LiveForFoodView(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
        floatingActionButton: DraggableFab(
            child: DraggableFabview()
        )

    );
  }

 /* Container _buildAppBar(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: cuistoOrange,
        border: Border.all(
          color: Colors.deepOrange,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20))
    ),
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        padding: const EdgeInsets.all(8),
        height: 80.0,
        child: Row(
          children: <Widget>[
            const CircleAvatar(
              radius: 27,
              child: CircleAvatar(
                radius: 25,
                foregroundImage: AssetImage('assets/icons/logo-red.png',),
              ),
            ),
            UIHelper.horizontalSpaceExtraSmall(),
            Text(
              'Cuisto App',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 16.0,color: Colors.white),
            ),

            const Spacer(),
             Container(
                padding: const EdgeInsets.all(5.0),
                child: TextButton.icon(
                  icon:Icon(Icons.add_alert,color: cuistoOrange, size: 17,),
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
                  label: Text('Appeler un serveur',style: TextStyle (
                      color: cuistoOrange,
                      fontSize: 12,
                      fontWeight: FontWeight.w200
                  )),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                  )
                ),
              ),
          ],
        ),
      );*/
}


class SeeAllRestaurantBtn extends StatelessWidget {
  const SeeAllRestaurantBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 50.0,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: darkOrange),
        onPressed: isTabletDesktop
            ? () {}
            : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllfoodsScreen(),
                  ),
                );
              },
        child: Text(
          'Voir plus',
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: Colors.white, fontSize: 19.0),
        ),
      ),
    );
  }
}

class LiveForFoodView extends StatelessWidget {
  const LiveForFoodView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.all(15.0),
      height: 300.0,
      color: Colors.grey[200],
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'SE NOURRIR POUR VIVRE',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.grey[400],
                      fontSize: 50.0,
                      letterSpacing: 0.2,
                      height: 1.1,
                    ),
              ),
              UIHelper.verticalSpaceLarge(),
              Text(
                'VAS-TECHNOLOGIE',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey),
              ),
              Text(
                "CUISTO, CÔTE D'IVOIRE",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey),
              ),
              UIHelper.verticalSpaceExtraLarge(),
              Row(
                children: <Widget>[
                  Container(
                    height: 1.0,
                    width: MediaQuery.of(context).size.width / 4,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
          Positioned(
            left: 103.0,
            top: 7.8,
            child: Image.asset(
              'assets/image/burger.png',
              height: 80.0,
              width: 65.0,
            )
          )
        ],
      ),
    );
  }
}


