import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/item_model.dart';
import '../utils/app_constants.dart';

class ItemsController extends GetxController{

  var status = RxInt(0);
  var message= RxString('');
  var error_message= RxString('');
  var isLoading = false.obs;
  var token ;
  RxList<Itemes> itemes = <Itemes>[].obs;


  @override
  void onInit() {
    //getItems('','1');
    super.onInit();
  }

  Future<List<Itemes>> getItems(String id, String rest) async {

    final prefs  = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    isLoading(true);

    var url = Uri.parse(AppConstants.BASE_URL+AppConstants.MENU_URI+"?restaurantid=$rest");

    print(url);

    http.Response response = await http.get(url,
        headers: {
          'Accept':'application/json',
          //'Authorization' : 'Bearer $token',
          'Content-Type': 'application/json',
        });

    var data =  json.decode(response.body);
    if (response.statusCode == 200) {
      isLoading(false);
      print(data);
      return  itemes((data as List)
          .map((data) => new Itemes.fromJson(data))
          .toList());

    } else {
      isLoading(false);
      throw Exception('Veuillez verifier votre connexion internet');
    }

  }



  Future<List<Itemes>> getItemsByCategory(String id, String rest) async {

    final prefs  = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    isLoading(true);

    var url = Uri.parse(AppConstants.BASE_URL+AppConstants.MENU_URI+"?categorieid=$id&restaurantid=$rest");

    print(url);

    http.Response response = await http.get(url,
        headers: {
          'Accept':'application/json',
          //'Authorization' : 'Bearer $token',
          'Content-Type': 'application/json',
        });

    var data =  json.decode(response.body);
    if (response.statusCode == 200) {
      isLoading(false);
      print(data);
      return  itemes((data as List)
          .map((data) => new Itemes.fromJson(data))
          .toList());

    } else {
      isLoading(false);
      throw Exception('Veuillez verifier votre connexion internet');
    }

  }

}


