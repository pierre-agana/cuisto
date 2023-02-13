import 'package:cuistoapp/app/views/mobile/cart/cart_details.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/ui_helper.dart';
import '../../../widgets/mobile/drawer/cartBtn.dart';
import 'commande_details.dart';


class CommandeScreen extends StatelessWidget {
  const CommandeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body:Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, int index) {
                return InkWell(
                  onTap: (){
                   Get.to(
                     Commande_details(),
                     fullscreenDialog: true,
                     transition: Transition.zoom,
                   );
                  },
                    child: cartItems(index)
                );
              },
            ),
          ),

        ],
      ),
        floatingActionButton: DraggableFab(
            child: DraggableFabview()
        )
    );
  }
}

Widget cartItems(int index) {
  return RoundedContainer(
    padding: const EdgeInsets.all(0),
    margin: EdgeInsets.all(10),
    height: 80,
    child: Row(
      children: <Widget>[
        Container(
          width: 100,
          //height: 50,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/logo-red.png'),
                fit: BoxFit.contain,
              )),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        "COMD-456-2023" + index.toString(),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ),
                    SizedBox(width: 60,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 60,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                          ),
                          child: Text('Paye',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("27-01-2023  15:45  ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.orange,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),

              ],
            ),
          ),
        )
      ],
    ),
  );
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
        alignment: alignment,
        height: height,
        width: width,
        padding: padding,
        child: child,
      ),
    );
  }
}

class _AddressPaymentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '10.00',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontSize: 16.0,color: cuistoOrange,),
                      ),
                    ),
                    UIHelper.verticalSpaceExtraSmall(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                color:cuistoOrange ,
                height: 58.0,
                child: Text(
                  'PAYER',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
