import 'package:dio/native_imp.dart';
import 'package:testelogin/app/shared/utils/api.dart';

class CustomDio {
  final DioForNative client;

  CustomDio(this.client) {
    client.options.baseUrl = API.BASE_URL;
    // client.interceptors.add(CustomInterceptors());

    client.options.connectTimeout = 30000;
  }
}
