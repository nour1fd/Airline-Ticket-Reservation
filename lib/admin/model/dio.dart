import 'package:dio/dio.dart';

class Dio_Admin{
  static late Dio dio;
  static init(){
    dio =Dio(
        BaseOptions(
            baseUrl: "http://192.168.1.7:80/api/admin/flights/",
            receiveDataWhenStatusError: true,
            headers: {
              'Content-Type':'application/json',
            }
        )

    );
  }

  static Future<Response<dynamic>>postData({
    required String url,
    required Map<String,dynamic>data,
  })async
  {
    dio.options.headers=
    {
      'Content-Type':'application/json',
    };
    return dio.post(
      url,
      data: data,
    );
  }

  static Future<Response> getdata({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers =
    {
      'Content-Type':'application/json',
    };
    return await dio.get(url, queryParameters: query);
  }



  static Future<Response> deleteData ({
    required String url,

  })async
  {

    return await dio.delete(url);
  }


  static Future<Response> PutData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String Lang = 'en' ,
    String? Token,
  }) async {
    dio.options.headers =
    {
      'Content-Type':'application/json',

    };
    return await dio.put(url, queryParameters: query ,data: data);
  }
}