import 'package:cuistoapp/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/ui_helper.dart';
import '../../../../widgets/mobile/appBar.dart';
import '../../../../widgets/mobile/drawer/custom_drawer.dart';

class TableViewScreen extends StatefulWidget{

  const TableViewScreen({super.key});
  @override
  _TableViewScreenState createState() => _TableViewScreenState();
}

class _TableViewScreenState extends State<TableViewScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /*appBar: AppBar(),
      drawer: CustomDrawer(),*/
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: AppBarview(
                text:"Mes tables" ,
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,color: Colors.white,size: 30,
                ),
              ),
            ),
        Expanded(
          child: Container(
            child:GridView.builder(
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,childAspectRatio: 1.0/1.20),
              itemBuilder: (ctx,index){
                return tableList(index);
              },
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
  Widget tableList(int index)
  {
    return Card(
      color: Colors.green,
      borderOnForeground: true,
      child: Hero(
        tag: "text$index",
        child: Material(
          child: InkWell(
            onTap: (){
              print('Table ${index +1}');
            },
            child: Wrap(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset("assets/images/table.jpg"),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: cuistoOrange,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Text('Table ${index +1}',style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontSize: 16.0,color: Colors.white),textAlign: TextAlign.center,),
                    ),
                  ],
                )
              ],

            ),
          ),
        ),
      ),
    );
  }
}