import 'package:dio/dio.dart';

class characterweb{
  late Dio dio;
  characterweb(){
    BaseOptions options =BaseOptions(
      baseUrl :"http://192.168.1.7:80/api/admin/flights/",
      receiveDataWhenStatusError: true,

    );
    dio = Dio(options);
  }

  Future<List<dynamic>?> gettall ()async{
    try{
      Response response =await dio.get('get-all-flights');
      return response.data;}
    catch(e){
      print(e.toString());
      return [];
    }
  }
}