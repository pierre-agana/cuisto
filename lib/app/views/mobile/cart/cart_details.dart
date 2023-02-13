import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/ui_helper.dart';
import '../../../widgets/custom_divider_view.dart';
import '../../../widgets/veg_badge_view.dart';


class CartDetails extends StatelessWidget {
  const CartDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          foregroundColor: cuistoOrange,
        ),
        body:Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, int index) {
                  return cartItems(index);
                },
              ),
            ),
            _AddressPaymentView(),
          ],
        )
    );
  }
}

Widget cartItems(int index) {
  return RoundedContainer(
    padding: const EdgeInsets.all(0),
    margin: EdgeInsets.all(10),
    height: 130,
    child: Row(
      children: <Widget>[
        Container(
          width: 130,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/food1.jpg'),
                fit: BoxFit.cover,
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
                    Container(
                      width: 50,
                      child: IconButton(
                        onPressed: () {
                          print("delete");
                        },
                        color: Colors.red,
                        icon: Icon(Icons.delete),
                        iconSize: 20,
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
                Row(
                  children: <Widget>[

                    Spacer(),
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          splashColor: Colors.redAccent.shade200,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.remove,
                                color: Colors.redAccent,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('2'),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        InkWell(
                          onTap: () {},
                          splashColor: Colors.lightBlue,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.add,
                                color: Colors.green,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
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
