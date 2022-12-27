import 'package:dio/dio.dart';

class DioHelper2
{
  static Dio dio = Dio();

  static Future<Response> getData({
  required String url ,
})async
  {
    return await dio.get(url );
  }
  static Future<Response> postData({
  required String url ,
    required Map<String , dynamic>data ,
})async
  {
    return await dio.post(url , data: data);
  }
}