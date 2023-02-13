import 'dart:async';

import 'package:cuistoapp/app/controller/auth_controller.dart';
import 'package:cuistoapp/app/utils/app_colors.dart';
import 'package:cuistoapp/app/views/mobile/mobile_screen.dart';
import 'package:cuistoapp/app/views/tab_desktop/desktop_screen.dart';
import 'package:cuistoapp/app/views/tab_desktop/tab_screen.dart';
import 'package:cuistoapp/app/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/mobile/account/login.dart';


class RoutePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  final AuthController authController = Get.put(AuthController(),permanent: true);

  static bool logIn_statu =false;

  void initState(){
    checkIfUserLogged();
    super.initState();
    startSplashScreenTimer();

  }

  checkIfUserLogged() async{
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');
    if(token == null)
    {
      setState(() {
        logIn_statu = false;
      });
    }
    else{
      setState(() {
        logIn_statu= true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Container(
          width: Get.width,
          height: Get.height,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children : <Widget>[
                  Image.asset('assets/icons/logo-red.png',height: 250,),
                  const Text('Chargement des données ...',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.deepOrange),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: new LinearPercentIndicator(
                      backgroundColor: Colors.orange[100],
                      barRadius: Radius.circular(10),
                      width: MediaQuery.of(context).size.width - 50,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2500,
                      percent: 1,
                      //center: Text("100%",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: cuistoOrange,
                    ),
                  ),
                ]
            ),
          ),
        )
    );
  }
  void navigationToNextPage() {

    if(logIn_statu == true) {
        Get.offAll(
            const Responsive(
              mobile: MobileScreen(),
              tablet: TabScreen(),
              desktop: DesktopScreen(),
            ),
        );
      }
      else{
        Get.offAll(()=>LoginPage(),transition: Transition.fadeIn);
      }


  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationToNextPage);
  }
}