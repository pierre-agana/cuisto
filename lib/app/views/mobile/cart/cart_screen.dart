import 'package:cuistoapp/app/models/cart_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/ui_helper.dart';
import 'package:flutter/material.dart';



class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => CartScreenState();
}

enum Place { road, home }

class CartScreenState extends State<CartScreen> {

  Place? _place;
  bool _homeFieldVisible = false;

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
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void handleSelection(Place? value) {
    setState(() {
      _place = value;
      _homeFieldVisible = value == Place.home;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: cuistoOrange,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 3,
              child: _cartItems(),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.grey[200],
                        height: 58.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '21.000',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontSize: 18.0,color: cuistoOrange),
                            ),
                            UIHelper.verticalSpaceExtraSmall(),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          confirmBox();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10.0),
                          color: cuistoOrange,
                          height: 58.0,
                          child: Text(
                            'Confirmer',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.white,fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                UIHelper.verticalSpaceExtraSmall(),
              ],
            )
          ],
        ),
      )
    );
  }

  void showModal(context){
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder( // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return SizedBox(
            height: 400,
            child:Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  RadioListTile(
                    title: const Text('Sur place '),
                    value: Place.road,
                    groupValue: _place,
                    onChanged: (Place? value) {
                      setState(() {
                        _place = value;
                        _homeFieldVisible = value == Place.home;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Emporter'),
                    value: Place.home,
                    groupValue: _place,
                    onChanged: (Place? value) {
                      setState(() {
                        _place = value;
                        _homeFieldVisible = value == Place.home;
                      });
                    },
                  ),
                  if (_homeFieldVisible == true)
                    DropdownButton2(
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
                ],
              ),
            ),
          );
        });
  }

  int _n = 0; //counter variable

  void add(setState) {
    setState(() {
      _n++;
    });
  }

  void minus(setState) {
    setState(() {
      if (_n != 0) _n--;
    });
  }
  void confirmBox() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Container(
              child: Scaffold(
                body: Column(
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: () => add(setState),
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.white,
                          ),
                          Text("$_n", //_n value is not updating yet
                              style: TextStyle(fontSize: 60.0)),
                          FloatingActionButton(
                            onPressed: () => minus(setState),
                            child: Icon(
                                const IconData(0xe15b,
                                    fontFamily: 'MaterialIcons'),
                                color: Colors.black),
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

}

class _cartItems extends StatefulWidget {
  @override
  _cartItemsState createState() => _cartItemsState();
}

class _cartItemsState extends State<_cartItems> {
  int cartCount = 1;
  final cartItems = Cart_model.getCart();
  late final List<Cart_model> cart;
   int sub_price = 0 ;


  @override
  void dispose() {
    sub_price = 0 ;
    super.dispose();
  }

  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(10),
      height: 730,
      child: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, int index) {
          return  Row(
            children: <Widget>[
              Container(
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(cartItems[index].image),
                )
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(

                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                           Flexible(
                            child: Text(
                              cartItems[index].name,
                              overflow: TextOverflow.fade,
                              softWrap: true,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          Container(
                            width: 50,
                            child: IconButton(
                              onPressed: () {
                                print("Button Pressed");
                              },
                              color: cuistoOrange,
                              icon: const Icon(Icons.delete),
                              iconSize: 20,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Text("Prix: "),
                          const SizedBox(width: 5,),
                          Text(
                            cartItems[index].price.toString()+' CFA',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w300,color: cuistoOrange),
                          )
                        ],
                      ),
                      const SizedBox(height: 3,),
                      Row(
                        children: <Widget>[
                          const Text("Sous Total: "),
                          const SizedBox(width: 5,),
                          Text(sub_price.toString()+' CFA',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: cuistoOrange,
                              ))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              if (cartCount > 0) {
                                setState(() {
                                  cartCount --;
                                  sub_price = cartItems[index].price * cartCount ;
                                });
                              }
                            },
                           // splashColor: Colors.redAccent.shade200,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.redAccent,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('$cartCount'),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                cartCount ++;
                                sub_price = cartItems[index].price * cartCount;
                              });
                            },
                            //splashColor: Colors.lightBlue,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),

    );
  }

}


class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(16.0),
    this.margin,
    this.borderRadius,
    this.alignment,
    this.elevation,
  }) : super(key: key);
  final Widget child;
  final double? width;
  final double? height;
  final Color color;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final AlignmentGeometry? alignment;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? const EdgeInsets.all(0),
      color: color,
      elevation: elevation ?? 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(20.0),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
            )
          ],
        ),
        alignment: alignment,
        height: height,
        width: width,
        padding: padding,
        child: child,
      ),
    );
  }
}


// class _AddressPaymentView extends StatefulWidget {
//   const _AddressPaymentView({Key? key}) : super(key: key);
//
//   @override
//   State<_AddressPaymentView> createState() => _AddressPaymentViewState();
// }
//
// enum Place { road, home }
//
// class _AddressPaymentViewState extends State<_AddressPaymentView> {
// /*class _AddressPaymentView extends StatelessWidget {*/
//
//   Place? _place;
//   bool _homeFieldVisible = false;
//
//   void handleSelection(Place? value) {
//     setState(() {
//       _place = value;
//       _homeFieldVisible = value == Place.home;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Expanded(
//               child: Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.all(10.0),
//                 color: Colors.grey[200],
//                 height: 58.0,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       '21.000',
//                       style: Theme.of(context)
//                           .textTheme
//                           .subtitle2!
//                           .copyWith(fontSize: 18.0,color: cuistoOrange),
//                     ),
//                     UIHelper.verticalSpaceExtraSmall(),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: InkWell(
//                 onTap: (){
//                   /* showModal(context){*/
//                     showModalBottomSheet(
//                         context: context,
//                         shape: const RoundedRectangleBorder( // <-- SEE HERE
//                           borderRadius: BorderRadius.vertical(
//                             top: Radius.circular(25.0),
//                           ),
//                         ),
//                         builder: (context) {
//                           return SizedBox(
//                             height: 400,
//                             child:Padding(
//                               padding: const EdgeInsets.all(16),
//                               child: Column(
//                                 children: [
//                                   RadioListTile(
//                                     title: const Text('emporter'),
//                                     value: Place.road,
//                                     groupValue: _place,
//                                     onChanged: handleSelection,
//                                   ),
//                                   RadioListTile(
//                                     title: const Text('Sur place'),
//                                     value: Place.home,
//                                     groupValue: _place,
//                                     onChanged: handleSelection,
//                                   ),
//                                   if (_homeFieldVisible)
//                                     const TextField(
//                                       decoration: InputDecoration(
//                                         border: OutlineInputBorder(),
//                                         hintText: 'Enter a search term',
//                                       ),
//                                     ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         });
//                   //}
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   padding: const EdgeInsets.all(10.0),
//                   color: cuistoOrange,
//                   height: 58.0,
//                   child: Text(
//                     'Confirmer',
//                     style: Theme.of(context)
//                         .textTheme
//                         .subtitle2!
//                         .copyWith(color: Colors.white,fontSize: 18),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//         UIHelper.verticalSpaceExtraSmall(),
//       ],
//     );
//   }
// }



/*void showModal(context){
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder( // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
        return SizedBox(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                RadioListTile(
                  title: const Text('on the road'),
                  value: Place.road,
                  groupValue: ,
                  onChanged: handleSelection,
                ),
                RadioListTile(
                  title: const Text('at home'),
                  value: Place.home,
                  groupValue: _place,
                  onChanged: handleSelection,
                ),
                if (_homeFieldVisible)
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                    ),
                  ),
                RadioListTile(
                  title: const Text('at work'),
                  value: Place.work,
                  groupValue: _place,
                  onChanged: handleSelection,
                ),
              ],
            ),
          ),
        );
      });
}*/
