import 'package:plane/admin/model/adminmodel.dart';
import 'package:http/http.dart' as http;

class Get_Flight {
  static var clinet = http.Client();

  static Future<List<FlightModeladmin>>fetchproduct()async {
    var response = await clinet.get(Uri.parse(
        'http://192.168.1.7:80/api/admin/flights/get-all-flights'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(response.body);
      return flightModelFromJson(jsonString);
    }
    else {
      print("ereor on fetch");
      return [];
    }
  }
  deletpost()async{

  }
}