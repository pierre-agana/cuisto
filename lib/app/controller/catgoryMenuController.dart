import 'dart:convert';
import 'package:cuistoapp/app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/categoryMenu.dart';

class CategoryMenuController extends GetxController{

  var status = RxInt(0);
  var message= RxString('');
  var error_message= RxString('');
  var isLoading = false.obs;
  var token ;
  RxList<Categoriemenu> categoryMenu = <Categoriemenu>[].obs;


  @override
  void onInit() {
    //getCategoryMenu('1');
    super.onInit();
  }

  Future<List<Categoriemenu>> getCategoryMenu(String restaurantid ) async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('access_token');

    print('access_token');
    print(token);
    print('access_token');

    isLoading(true);

    var url = Uri.parse(AppConstants.BASE_URL+AppConstants.CATEGORYMENU_URI+restaurantid);

    print(url);

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
      return  categoryMenu((data as List)
          .map((data) => new Categoriemenu.fromJson(data))
          .toList());

    } else {
      isLoading(false);
      throw Exception('Veuillez verifier votre connexion internet');
    }

  }
}