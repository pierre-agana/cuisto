import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../utils/app_constants.dart';

class AuthController extends GetxController {
  //String serverUrl = "http://192.168.0.105:8081";
  var message= RxString('');
  var error_message= RxString('');
  var isLoading = false.obs;
  var status = RxInt(0);
  var name = ''.obs;
  var phone = ''.obs;
  var roles = ''.obs;
  var enabled = ''.obs;
  var accountNonExpired = ''.obs;
  var credentialsNonExpired = ''.obs;
  var authorities = ''.obs;
  var accountNonLocked = ''.obs;
  var username = ''.obs;
  var createdAt = ''.obs;
  var updatedAt = ''.obs;
  var user_token = ''.obs;
  var isMobile;
  var token ;


  @override
  void onInit() {
    checkAuth();
    super.onInit();
  }

  checkAuth() async{
    final prefs = await SharedPreferences.getInstance();
    token = prefs.get('access_token');
    print("-------- init check auth --------");
    if(token != null){
      getUserData();
      user_token(prefs.get('access_token') as String?);
      print('user_token');
      print(user_token);
      name(prefs.get('name') as String?);
      phone(prefs.get('phone') as String?);
    }

  }
  /*
   *  login
   */
  login(String user, String password) async{

    isLoading(true);
    var url = Uri.parse(AppConstants.BASE_URL+AppConstants.LOGIN_URI);
    final response = await  http.post(url,
        headers: {
          'Accept':'application/json',
          'Content-Type': 'application/json'
        },
        body: json.encode({'user': user, 'password': password})
    );
    status(response.statusCode);
    print(response.body);

    var data = json.decode(response.body);

    print(' ****** data *******');
    print(data["access_token"]);
    print(' ****** data *******');

    message(data["message"]);
    if(response.statusCode == 200){
      save(data["access_token"]);
      saveData('name', data["name"]);
      saveData('phone', data["phone"]);
      user_token(data["access_token"]);
      sync(data);
      checking();
      isLoading(false);
    }else{
      isLoading(false);
      print('errormsg : ${data["message"]}');
    }

  }

  /*
   *  recuperation des infos de l'utilisateur
   */
  getUserData() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('access_token');

    if(token != null){
      var url = Uri.parse(AppConstants.BASE_URL+AppConstants.GETUSER_URI);
      http.Response response = await http.get(url,
          headers: {
            'Accept':'application/json',
            'Content-Type': 'application/json',
            'Authorization' : 'Bearer $token'
          });

      var data =  json.decode(response.body);

      print('****getUserData****');
      print(data);
      print('****getUserData****');

      if(response.statusCode == 200){
        save(data["access_token"]);
        saveData('name', data["name"]);
        saveData('phone', data["phone"]);
        user_token(data["access_token"]);

        sync(data);
        isLoading(false);
      }else{
        isLoading(false);
        print('errormsg : ${data["message"]}');
      }

    }

  }


 save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  saveData(String key,String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

 /*  saveIntData(String key,int data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, data);
  }

  saveBool(String ref, data) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(ref, data);
  }*/

  // check if is first connexion
  checking() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showOnboarding',true);
  }

  sync(var data){
    print(data);
   name(data["name"]);
  }

}