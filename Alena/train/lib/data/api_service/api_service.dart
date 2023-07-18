import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../presentation/util/standard_url.dart';

abstract class ApiService {
  Dio get dio;
}

class ApiServiceImp implements ApiService {

  static const _WEB_URL =  StandardUrl.webUrl;



  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _WEB_URL,
      responseType: ResponseType.json,
      contentType: Headers.jsonContentType,
    ),
  );

  ApiServiceImp() {
    final prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      responseHeader: true,
    );
    final interceptorWrapper = InterceptorsWrapper(
      onRequest: (options, handler) async {
        handler.next(options);
      },
      onResponse: (e, handler) {
        handler.next(e);
      },
      onError: (e, handler) {
        if (e.response?.statusCode == 401) {}
        handler.next(e);
      },
    );
    _dio.interceptors.addAll([
      prettyDioLogger,
     interceptorWrapper,
    ]);
  }

  @override
  Dio get dio => _dio;

}
