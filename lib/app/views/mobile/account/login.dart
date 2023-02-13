import 'package:cuistoapp/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../controller/auth_controller.dart';
import '../../../widgets/bezierContainer.dart';
import '../../../widgets/responsive.dart';
import '../../tab_desktop/desktop_screen.dart';
import '../../tab_desktop/tab_screen.dart';
import '../mobile_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      child: Text(
        'Connexion',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }


  Widget _title() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Image.asset('assets/icons/logo-red.png',fit: BoxFit.fill,),
        ),
        SizedBox(height: 15,),
        Text('Bienvenue!',style: TextStyle(color: cuistoOrange, fontSize: 20,fontWeight: FontWeight.w500),)
      ],
    );
  }

  final  formKey = GlobalKey<FormState>();
  String initialCountry = 'CI';
  PhoneNumber number = PhoneNumber(isoCode: 'CI');

  TextEditingController _numeroController  = new TextEditingController() ;
  TextEditingController _passwordController = new TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final isTabletDesktop = Responsive.isTabletDesktop(context);
    return Obx(() =>LoadingOverlay(
      isLoading: _authController.isLoading.value,
      opacity: 0.5,
      color: Colors.white,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
          body: Container(
            height: height,
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: -height * .15,
                    right: -MediaQuery.of(context).size.width * .4,
                    child: BezierContainer()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .3),
                        _title(),
                        SizedBox(height: 50),
                        Form(
                          key: formKey,
                          child: Padding(
                            padding: isTabletDesktop ? const EdgeInsets.only(left: 200.0,right: 200):  const EdgeInsets.all(8.0),
                            child:  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: TextField(
                                        controller: _numeroController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Numero',
                                        ),
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: TextField(
                                        controller: _passwordController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Mot de passe',
                                        ),
                                        onChanged: (text) {
                                          setState(() {
                                           // fullName = text;
                                            //you can access nameController in its scope to get
                                            // the value of text entered as shown below
                                            //fullName = nameController.text;
                                          });
                                        },
                                      )),
                                  InkWell(
                                    onTap: () {
                                      //formKey.currentState?.validate();
                                      login();
                                    },
                                     child: _submitButton()

                                  ),
                                ],
                              ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          )),
    )
    );
  }

  /*void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'CI');

    setState(() {
      this.number = number;
    });
  }*/
  @override
  void dispose() {
    _passwordController.dispose();
    _numeroController.dispose();
    super.dispose();
  }

  login(){
    if(formKey.currentState!.validate()){
      _authController.login(_numeroController.text, _passwordController.text).whenComplete((){
        if(_authController.status.value == 200){
          print(_numeroController.text);
          print('****** ok ok *******');
          print(_passwordController.text);

          Get.to(
              const Responsive(
                mobile: MobileScreen(),
                tablet: TabScreen(),
                desktop: DesktopScreen(),
              )
          );
        }else{
          print(_numeroController.text);
          print('*************');
          print(_passwordController.text);
          Get.snackbar('Erreur',
              "Numero ou mot de passe incorrect",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: cuistoOrange,
              colorText: Colors.white
          );
        }
      });
    }
  }
}