import 'dart:convert';

import 'package:dio/dio.dart';
import 'shared/utils/api.dart';

class AppRepository {

  final Dio _dio = Dio();

  Future getData(String date,String state)async{
    String newDate = '${date.split('/').last}-${date.split('/')[1]}-${date.split('/').first}';
    String link = API.BASE_URL + '?search=&date=${newDate}&state=${state}&place_type=state&is_last=&city_ibge_code';
    var result = await _dio.get(link,
      options: Options(
        headers: {
          'Authorization': API.TOKEN, // set content-length
        },
      ),
    );
    return result.data;
  }

  Future getNextData(String link)async{
    var result = await _dio.get(link,
      options: Options(
        headers: {
          'Authorization': API.TOKEN, // set content-length
        },
      ),
    );
    return result.data;
  }

}