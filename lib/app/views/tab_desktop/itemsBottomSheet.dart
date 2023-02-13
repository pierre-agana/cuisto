
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cuistoapp/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class ItemBottomSheet extends StatefulWidget {
  final  foods;
  ItemBottomSheet({Key? key, required this.foods});

  @override
  State<ItemBottomSheet> createState() => _ItemBottomSheetState();
}

class _ItemBottomSheetState extends State<ItemBottomSheet> {

  int quantity = 0;
  int total_Prix = 0;

  @override
  void initState() {
    quantity = 1;
    total_Prix = int.parse(widget.foods.price);
    super.initState();
    //Get.find<ItemController>().initData(widget.item, widget.cart);
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 600,
        margin: EdgeInsets.only(top: 0 ),
        padding: EdgeInsets.only(left: 50, bottom: Dimensions.PADDING_SIZE_DEFAULT),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius:  BorderRadius.all(Radius.circular(Dimensions.RADIUS_EXTRA_LARGE)),
        ),
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.end, children: [

            InkWell(onTap: () => Get.back(), child: Padding(
              padding:  EdgeInsets.only(right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              child: Icon(Icons.close),
            )),

            Padding(
              padding: EdgeInsets.only(
                right: Dimensions.PADDING_SIZE_DEFAULT, top: 0 ,
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [

                //Product
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [

                  InkWell(
                    onTap: () {
                      /*if(!widget.isCampaign) {
                         // Get.toNamed(RouteHelper.getItemImagesRoute(widget.item));
                        }*/
                    },
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                        child: CustomImage(
                          image: widget.foods.image,
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // DiscountTag(discount: _discount, discountType: _discountType, fromTop: 20),
                    ]),
                  ),
                  SizedBox(width: 10),

                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(widget.foods.name,
                        maxLines: 2, overflow: TextOverflow.ellipsis,
                      ),
                      //RatingBar(rating: widget.item.avgRating, size: 15, ratingCount: widget.item.ratingCount, ratingWidget: null,),
                          SizedBox(height:  10 ),
                      Text(
                       'Prix : ${widget.foods.price} CFA',
                      ),
                          SizedBox(height:  10 ),
                          Text('Description',),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          Text(widget.foods.desc, ),
                          SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    ]),
                  ),

                  Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL, horizontal: Dimensions.PADDING_SIZE_SMALL),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                        color: Theme.of(context).primaryColor,
                      ),

                    ),
                    SizedBox(height:  50 ),

                  ]),

                ]),

                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                /*Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description',),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Text('widget.item', ),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                  ],
                ) ,*/

                // Variation
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Variation Size',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10,
                          childAspectRatio: (1 / 0.25),
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: 4,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              // itemController.setCartVariationIndex(index, i, widget.item);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              decoration: BoxDecoration(
                                color:  Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                                border: Border.all(color: Theme.of(context).disabledColor, width: 2) ,
                              ),
                              child: Text(' widget.item',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE ),
                    ]);
                  },
                ),
                SizedBox(height:  Dimensions.PADDING_SIZE_LARGE ),

                // Quantity
                Row(children: [
                  Text('Quantite',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                  Expanded(child: SizedBox()),
                  Row(children: [
                    InkWell(
                      onTap: () {
                        //minus();
                        if (quantity > 1) {
                          setState(() {
                            quantity --;
                            total_Prix = int.parse(widget.foods.price) * quantity;
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
                        padding: const EdgeInsets.all(10.0),
                        child: Text('$quantity',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: () {
                        //add();
                        setState(() {
                          quantity ++;
                          total_Prix = int.parse(widget.foods.price) * quantity;
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
                  ]),
                ]),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                // Addons
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Supplements', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 20, mainAxisSpacing: 10, childAspectRatio: (1 / 1.1),
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            /*if (!itemController.addOnActiveList[index]) {
                                itemController.addAddOn(true, index);
                              } else if (itemController.addOnQtyList[index] == 1) {
                                itemController.addAddOn(false, index);
                              }*/
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 2 ),
                            decoration: BoxDecoration(
                              color:  Theme.of(context).backgroundColor,
                              borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                              border:  Border.all(color: Theme.of(context).disabledColor, width: 2),
                              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 1)] ,
                            ),
                            child: Column(children: [
                              Expanded(
                                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                  Text('Supp Nom',
                                    maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '300',
                                    maxLines: 1, overflow: TextOverflow.ellipsis,

                                  ),
                                ]),
                              ),
                              Container(
                                height: 25,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL), color: Theme.of(context).cardColor),
                                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        /*if (itemController.addOnQtyList[index] > 1) {
                                            itemController.setAddOnQuantity(false, index);
                                          } else {
                                            itemController.addAddOn(false, index);
                                          }*/
                                      },
                                      child: Center(child: Icon(Icons.remove, size: 15)),
                                    ),
                                  ),
                                  Text('supp Qty',),
                                  Expanded(
                                    child: InkWell(
                                      // onTap: () => itemController.setAddOnQuantity(true, index),
                                      child: Center(child: Icon(Icons.add, size: 15)),
                                    ),
                                  ),
                                ]),
                              ),
                            ]),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Text('Prix : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: cuistoOrange) ),
                  Text(total_Prix.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: cuistoOrange)),
                  SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  Text('CFA', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: cuistoOrange)),
                ]),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                //Add to cart Button
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                  ),
                  child: Column(children: [
                    Text('not_available_now'),
                    Text('available_will_be',
                    ),
                  ]),
                ),

                Row(children: [

                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                  Expanded(
                      child: CustomButton(
                    width:  MediaQuery.of(context).size.width / 2.0 ,
                    margin: EdgeInsets.all(10),
                    height: 5,
                    fontSize: 10,
                    buttonText: ( 'Ajouter au panier'),
                    onPressed: () {
                      Get.back();
                      /*if(widget.isCampaign) {
                          Get.toNamed(RouteHelper.getCheckoutRoute('campaign'), arguments: CheckoutScreen(
                            fromCart: false, cartList: [_cartModel],
                          ));
                        }else {
                          if (Get.find<CartController>().existAnotherStoreItem(_cartModel.item.storeId)) {
                            Get.dialog(ConfirmationDialog(
                              icon: Images.warning,
                              title: 'are_you_sure_to_reset'.tr,
                              description: Get.find<SplashController>().configModel.moduleConfig.module.showRestaurantText
                                  ? 'if_you_continue'.tr : 'if_you_continue_without_another_store'.tr,
                              onYesPressed: () {
                                Get.back();
                              //  Get.find<CartController>().removeAllAndAddToCart(_cartModel);
                               // _showCartSnackBar(context);
                              },
                            ), barrierDismissible: false);
                          } else {
                            *//*Get.find<CartController>().addToCart(
                              _cartModel, widget.cartIndex != null ? widget.cartIndex : itemController.cartIndex,
                            );*//*
                           // _showCartSnackBar(context);
                          }
                        }*/
                    },

                  )),
                ]),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  /*void _showCartSnackBar(BuildContext context) {
    ScaffoldMessenger.of(Get.context).showSnackBar(SnackBar(
      dismissDirection: DismissDirection.horizontal,
      margin: EdgeInsets.only(
        right: ResponsiveHelper.isDesktop(context) ? context.width*0.7 : Dimensions.PADDING_SIZE_SMALL,
        top: Dimensions.PADDING_SIZE_SMALL, bottom: Dimensions.PADDING_SIZE_SMALL, left: Dimensions.PADDING_SIZE_SMALL,
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL)),
      content: Text('item_added_to_cart'.tr, style: robotoMedium.copyWith(color: Colors.white)),
      action: SnackBarAction(label: 'view_cart'.tr, onPressed: () => Get.toNamed(RouteHelper.getCartRoute()), textColor: Colors.white),
    ));
    // Get.showSnackbar(GetSnackBar(
    //   backgroundColor: Colors.green,
    //   message: 'item_added_to_cart'.tr,
    //   mainButton: TextButton(
    //     onPressed: () => Get.toNamed(RouteHelper.getCartRoute()),
    //     child: Text('view_cart'.tr, style: robotoMedium.copyWith(color: Theme.of(context).cardColor)),
    //   ),
    //   onTap: (_) => Get.toNamed(RouteHelper.getCartRoute()),
    //   duration: Duration(seconds: 3),
    //   maxWidth: Dimensions.WEB_MAX_WIDTH,
    //   snackStyle: SnackStyle.FLOATING,
    //   margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
    //   borderRadius: 10,
    //   isDismissible: true,
    //   dismissDirection: DismissDirection.horizontal,
    // ));
  }*/
}

class QuantityButton extends StatelessWidget {
  final bool isIncrement;
  final Function onTap;
  QuantityButton({required this.isIncrement, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
     // onTap: onTap,
      child: Container(
        height: 22, width: 22,
        margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: isIncrement ? Theme.of(context).primaryColor : Theme.of(context).disabledColor),
          color: isIncrement ? Theme.of(context).primaryColor : Theme.of(context).disabledColor.withOpacity(0.2),
        ),
        alignment: Alignment.center,
        child: Icon(
          isIncrement ? Icons.add : Icons.remove,
          size: 15,
          color: isIncrement ? Theme.of(context).cardColor : Theme.of(context).disabledColor,
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;
  final bool transparent;
  final EdgeInsets margin;
  final double height;
  final double width;
  final double fontSize;
  final double radius;
  //final IconData icon;
  CustomButton({required this.onPressed, required this.buttonText, this.transparent = false, required this.margin,
    required this.width, required this.height,
    required this.fontSize, this.radius = 5, });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.deepOrange,
      minimumSize: Size(width != null ? width : Dimensions.WEB_MAX_WIDTH, height != null ? height : 50),
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );

    return Center(
        child: SizedBox(width: width != null ? width : Dimensions.WEB_MAX_WIDTH, child: Padding(
      padding:  EdgeInsets.all(10) ,
          child: TextButton(
            onPressed: (){},
            style: _flatButtonStyle,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
            Padding(
            padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              ) ,
              Text(buttonText ??'', textAlign: TextAlign.center, ),
              ]
            ),
      ),
    )
    )
    );
  }
}

class CustomImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final BoxFit fit;
  CustomImage({required this.image, required this.height, required this.width, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image, height: height, width: width, fit: fit,
      placeholder: (context, url) => Image.asset('Images', height: height, width: width, fit: fit),
      errorWidget: (context, url, error) => Image.asset('Images', height: height, width: width, fit: fit),
    );
  }
}
