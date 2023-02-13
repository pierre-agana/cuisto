

import 'package:cuistoapp/app/utils/app_colors.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/ui_helper.dart';
import '../../../widgets/mobile/drawer/cartBtn.dart';
import '../cart/Commande_screen.dart';
import '../cuisto/tables/cash.dart';
import '../cuisto/tables/index.dart';

class DashboardScreen extends StatefulWidget{

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        titleTextStyle: TextStyle(color: cuistoOrange,fontSize: 16,fontWeight: FontWeight.w500),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    Flexible(
                      flex: 1,
                      child: InkWell(
                           onTap: (){
                            Get.to(
                                TableViewScreen(),
                            );
                           },
                        child: const CourseCard(
                            level: "Mes tables",
                            title: "5",
                            color: Color(0xff8E97FD),
                            textColor: Color(0xffffffff),
                            image: Image(
                              image: AssetImage('assets/icons/css.png'),
                            )
                        ),
                      ),
                    ),
                     Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          Get.to(
                            CashScreen(),
                          );
                        },
                        child: const CourseCard(
                            level: "Cash encaisser",
                            title: "10",
                            color: Color(0xffed9a23),
                            textColor: Color(0xffffffff),
                            image: Image(
                              image: AssetImage('assets/icons/js.png'),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          print('Mon profil');
                        },
                        child: const CourseCard(
                            level: "Mon profil",
                            title: "20",
                            color: Color(0xffFA6E5A),
                            textColor: Color(0xffffffff),
                            image: Image(
                              image: AssetImage('assets/icons/python.png'),
                            )
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          print('BASIC');
                        },
                        child: const CourseCard(
                            level: "Parametres",
                            title: "1",
                            color: Color(0xff6CB28E),
                            textColor: Color(0xffffffff),
                            image: Image(
                              image: AssetImage('assets/icons/html.png'),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpaceSmall(),
              const Text("5 dernieres tables",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,

                ),
              ),
              const Flexible(
                child: CommandeScreen(),

              ),
            ],
          ),
        ),
      ),
        floatingActionButton: DraggableFab(
            child: DraggableFabview()
        )
    );
  }

}
class CourseCard extends StatelessWidget {
  const CourseCard(
      {Key? key,
        required this.level,
        required this.title,
        required this.color,
        required this.image,
        required this.textColor})
      : super(key: key);

  final String level;
  final String title;
  final Color color;
  final Image image;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 190,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 90,
                      child: image,
                    ),
                  ),
                  Padding(
                    child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 16,
                            color: cuistoOrange,
                            fontFamily: 'MontserratLight'),
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(100, 130, 0, 0),
                  ),
                  Padding(
                    child: Text(
                      level,
                      style: TextStyle(
                          fontSize: 18,
                          color: textColor,
                          fontFamily: 'MontserratLight',fontWeight: FontWeight.w500),
                    ),
                    padding: const EdgeInsets.fromLTRB(15, 93, 0, 0),
                  ),
                ],
              )),
        ));
  }
}

