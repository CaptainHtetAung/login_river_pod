import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_river_pod/ulti/logging_interceptor.dart';

abstract class NetworkProvider {
  Future<Response> doPost({@required String url, data});

  Future<Response> doPostWithOptions(
      {@required BaseOptions options, @required String url, data});
}

class NetworkProviderDioImpl implements NetworkProvider {
  static NetworkProviderDioImpl _instance = NetworkProviderDioImpl._internal();
  static Dio _dio;

  factory NetworkProviderDioImpl() {
    BaseOptions options = new BaseOptions(
      connectTimeout: 60000,
      receiveTimeout: 60000,
    );

    _dio = new Dio(options);
//    _dio.interceptors.add(LoggingInterceptor());

    return _instance;
  }

  NetworkProviderDioImpl._internal() {
    _dio = new Dio();
    _dio.interceptors.add(LoggingInterceptor());
  }

  @override
  Future<Response> doPost({@required String url, data}) async {
   
    return await _dio.post(url, data: data);
  }

  @override
  Future<Response> doPostWithOptions(
      {BaseOptions options, String url, data}) async {
    // TODO: implement doPostWithOptions
    Dio dio = new Dio(options);
    return await dio.post(url, data: data);
  }
}
