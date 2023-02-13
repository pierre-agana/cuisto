
import 'package:cuistoapp/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/mobile/appBar.dart';
import 'ListCash.dart';

class CashScreen extends StatefulWidget{

  @override
  _CashScreenState createState() => _CashScreenState();
}
class Trx {
  final String? type, number, amount, date;
  Trx({this.type, this.amount, this.date, this.number});
}

final List transactions = [
  Trx(
    type: 'cwdr/',
    number: 'CMD/9874513365478965',
    amount: '10,000',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: 'CMD/9874513365478965',
    amount: '11,000',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: 'CMD/9874513365478965',
    amount: '12,000',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: 'CMD/9874513365478965',
    amount: '13.000',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: 'CMD/9874513365478965',
    amount: '14.000',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: 'CMD/9874513365478965',
    amount: '15.000',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: 'CMD/9874513365478965',
    amount: '16.000',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: 'CMD/9874513365478965',
    amount: '55000',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: 'CMD/9874513365478965',
    amount: '15.000',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: 'CMD/9874513365478965',
    amount: '25,000',
    date: '10-06-2019',
  ),
];

class _CashScreenState extends State<CashScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarview(
              text: "Cash encaisser",
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: transactions.length,
                    itemBuilder: (context, int index) => Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Material(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          elevation: 3.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            child: InkWell(
                              onTap: (){
                                print(transactions[index].number);
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.10,
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      width: 10.0,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Container(
                                    width: 60,
                                    height: 50,
                                    child: Image.asset(
                                      'assets/images/cash.jpg',
                                      fit: BoxFit.fill,),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                        Text(
                                         " ${transactions[index].number}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          transactions[index].date,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Text(
                                          "${transactions[index].amount} CFA",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,color: cuistoOrange
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ),
          ],
        )
      ),
    );
  }

}