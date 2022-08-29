import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:plane/cons.dart';
import 'package:plane/model/account_model.dart';
import 'package:plane/model/flight_info/flightmodel.dart';
import 'package:plane/model/modeling.dart';

class Get_Account {
  static var clinet = http.Client();

  static Future fetchaccount()async {
    var response = await clinet.get(Uri.parse(
        'http://192.168.1.7:80/api/users/payment/details/$accountId',
    ),
      headers: {
      HttpHeaders.authorizationHeader:"Bearer $token"
      },
    );
    print('tokenssssssssssssssssss');
    print('$token');
    print('tokenssssssssssssssssss');

    if (response.statusCode == 200) {
      print("sosooooooooooooooo");
      print("200000000000000000");

      var jsonString = response.body;
      print(response.body);
      return accountsFromJson(jsonString);
    }
    if (response.statusCode == 500) {
      print("ereor on 500");

      var j=response.body;
      print(j.toString());

    }
    else {
      print("ereor on fetch");
      return [];
    }
  }

}