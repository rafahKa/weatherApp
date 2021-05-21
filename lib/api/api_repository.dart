import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';

class ApiRepository {
  final String url;
  final Map payload;
  DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
  Options _cacheOptions =
      buildCacheOptions(Duration(minutes: 20), forceRefresh: true);
  Dio _dio = Dio();

  ApiRepository({@required this.url, this.payload});

  void get({
    Function() beforeSend,
    Function(dynamic data) onSuccess,
    Function(dynamic error) onError,
  }) async {
    _dio.interceptors.add(_dioCacheManager.interceptor);
    await _dio
        .get(this.url, queryParameters: this.payload, options: _cacheOptions)
        .then((response) {
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
      }
    });
  }
}
