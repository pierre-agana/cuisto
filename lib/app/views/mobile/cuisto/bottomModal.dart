import 'package:cuistoapp/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:item_selector/item_selector.dart';
import 'package:select_card/select_card.dart';

import '../../../models/spotlight_best_top_food.dart';
import '../../../utils/ui_helper.dart';
import '../../../widgets/responsive.dart';
import '../../tab_desktop/menu_view.dart';

class ModalBottomSheet extends StatefulWidget{

  const ModalBottomSheet({
    Key? key,
    required this.foods,
  }) : super(key: key);

  final  foods;

  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {

  double cartCount = 0;
  double sub_price = 0;

  /*@override
  void dispose() {
    sub_price = widget.foods.menuprix;
    cartCount = 1;
    super.dispose();
  }*/
  @override
  void initState() {
    sub_price = widget.foods.menuprix;
    cartCount = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.transparent,
                  image: DecorationImage(
                      image: NetworkImage(widget.foods.menuimg), fit: BoxFit.cover)),
            ),
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,color: Colors.deepOrange,size: 30,
                    ),
                  ),
                ),
              ),
            ),
            DraggableScrollableSheet(
              minChildSize: 0.5,
              maxChildSize: 0.9,
              initialChildSize: 0.5,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0))),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 2,
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.foods.menulibelle,
                                          style:
                                          TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          " ${widget.foods.menuprix.toInt()} CFA",
                                          style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        size: 20.0,
                                        color: cuistoOrange,
                                      ),
                                      Text(
                                        widget.foods.menulibelle,
                                        style: TextStyle(color: Colors.grey.shade700),
                                      ),
                                      SizedBox(width: 10.0),
                                      Icon(
                                        Icons.timer,
                                        size: 20.0,
                                        color: cuistoOrange,
                                      ),
                                      Text("${widget.foods.menudureepreparation} min",
                                        style: TextStyle(color: cuistoOrange) ,),
                                      SizedBox(width: 10.0),
                                      FittedBox(
                                        child: Container(
                                          width: 116.0,
                                          decoration: BoxDecoration(

                                            borderRadius: BorderRadius.circular(20.0),
                                          ),
                                          child:  Row(
                                            children: <Widget>[
                                              const Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  //minus();
                                                  if (cartCount > 1) {
                                                    setState(() {
                                                      cartCount --;
                                                      sub_price = widget.foods.menuprix * cartCount;
                                                    });
                                                  }
                                                },
                                                // splashColor: Colors.redAccent.shade200,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(50)),
                                                  alignment: Alignment.center,
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(4.0),
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: Colors.redAccent,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Card(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Text('${cartCount.toInt()}'),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  //add();
                                                  setState(() {
                                                    cartCount ++;
                                                    sub_price = widget.foods.menuprix * cartCount;
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
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Container(
                                          child: Text(
                                            ' ${sub_price.toInt()} CFA',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,color: cuistoOrange,
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(widget.foods.menulibelle,style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),),
                          //         Container(
                          //           //height: 100,
                          //           width: double.maxFinite,
                          //           child: /*ItemSelectionController(
                          //   child: ListView(
                          //     physics: NeverScrollableScrollPhysics(),
                          //       children: <Widget>[*/
                          //           GridView.builder(
                          //             physics: NeverScrollableScrollPhysics(),
                          //             shrinkWrap: true,
                          //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //               crossAxisCount: 4,
                          //               crossAxisSpacing: 8.0,
                          //               mainAxisSpacing: 2.0,
                          //             ),
                          //             itemCount:8,
                          //             itemBuilder: (context, index) {
                          //               return SelectSingleCard(context,
                          //                   title: widget.foods.name,
                          //                   //id: ids[2],
                          //                   imageSourceType: ImageSourceType.network,
                          //                   image:  widget.foods.image,
                          //                   //content: contents[0],
                          //                   cardBackgroundColor: Colors.amberAccent,
                          //                   cardSelectedColor: Colors.blue,
                          //                   titleTextColor: Colors.blue.shade900,
                          //                   contentTextColor: Colors.black87, onTap: (title) {
                          //                     debugPrint(title);
                          //                     setState(() {
                          //                       singleCardResult = title ;
                          //                     });
                          //                   });
                          //             },
                          //           ),
                          //
                          //           /*],
                          //   ),
                          // ),*/
                          //         ),
                                  SizedBox(height: 10,),
                                  if(sub_price != 0)SizedBox(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10.0)),
                                              backgroundColor: cuistoOrange,
                                              foregroundColor: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  ' ${sub_price.toInt()} CFA',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0,color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onPressed: () {
                                              print('Prix total : ${sub_price.toInt()}');
                                              print('Nombre : ${cartCount.toInt()}');
                                              print('Menu id : ${widget.foods.menuid}');
                                            },
                                          ),
                                          SizedBox(width: 20,),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10.0)),
                                              backgroundColor: cuistoOrange,
                                              foregroundColor: Colors.white,
                                            ),
                                            child: Row(
                                              children: const [
                                                Text("Ajouter au panier"),
                                              ],
                                            ),
                                            onPressed: () {
                                              print('Prix total : ${sub_price.toInt()}');
                                              print('Nombre : ${cartCount.toInt()}');
                                              print('Menu id : ${widget.foods.menuid}');
                                            },
                                          ),
                                        ],
                                      )
                                  ),
                                  SizedBox(height: 10.0),

                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
