import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/menus.dart';
import '../utils/app_constants.dart';


class MenuAllController extends GetxController{

  var status = RxInt(0);
  var message= RxString('');
  var error_message= RxString('');
  var isLoading = false.obs;
  var token ;
  RxList<Menuall> menuAll = <Menuall>[].obs;

  @override
  void onInit() {
    getCategoryMenu('1','');
    super.onInit();
  }


  Future<List<Menuall>> getCategoryMenu(String id, String rest) async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    isLoading(true);

    var url = Uri.parse(AppConstants.BASE_URL+AppConstants.MENU_URI+"?categorieid=$id&restaurantid=$rest");
    http.Response response = await http.get(url,
      headers: {
        'Accept':'application/json',
        //'Authorization' : 'Bearer $token',
        'Content-Type': 'application/json',
      },);
    status(response.statusCode);
    print(status);

    var data =  json.decode(response.body);
    if (response.statusCode == 200) {
      isLoading(false);
      print(data);
      return  menuAll((data as List)
          .map((data) => new Menuall.fromJson(data))
          .toList());

    } else {
      isLoading(false);
      throw Exception('Veuillez verifier votre connexion internet');
    }

  }

}