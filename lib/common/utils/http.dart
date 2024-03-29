import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pinker/common/constant/library.dart';
import 'package:pinker/common/widgets/library.dart';

class MyHttp {
  // final Function errorCallBack;

  Dio dio = Dio();

  static final MyHttp _instance = MyHttp._internal();

  factory MyHttp() => MyHttp._instance;

  MyHttp._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions(
      // 请求基地址,可以包含子路径
      baseUrl: baseUrl,

      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 50000,

      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 30000,

      // Http请求头.
      headers: {},

      /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
      /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
      /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
      /// 就会自动编码请求体.
      contentType: 'application/json; charset=utf-8',

      /// [responseType] 表示期望以那种格式(方式)接受响应数据。
      /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`.
      /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
      /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
      /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
      responseType: ResponseType.json,
    );

    dio.options = options;

    // Cookie管理
    // CookieJar cookieJar = CookieJar();
    // dio.interceptors.add(CookieManager(cookieJar));

    // 添加拦截器
    // dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options, handler) {
    //     // Do something before request is sent
    //     return handler.next(options); //continue
    //     // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
    //     // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
    //     //
    //     // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
    //     // 这样请求将被中止并触发异常，上层catchError会被调用。
    //   },
    //   onResponse: (response, handler) async {
    //     // Do something with response data
    //     // 如果token过期将直接退出登陆
    //     // ResponseEntity responseEntity = ResponseEntity.fromJson(response.data);
    //     // if (responseEntity.code == 1) {
    //     //   await MyTimer.futureMill(500);
    //     //   goLoginPage();
    //     // }

    //     return handler.next(response);

    //     // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
    //     // 这样请求将被中止并触发异常，上层catchError会被调用。
    //   },
    //   onError: (DioError err, handler) {
    //     // Do something with response error

    //     // Get.dialog(AlertCenter(
    //     //   child: AlertCenter.alert(
    //     //     title: e.type.toString(),
    //     //     content: e.message,
    //     //   ),
    //     // ));

    //     var eInfo = createErrorEntity(err);
    //     onError(eInfo);

    //     // return;

    //     // return handler.next(err);

    //     // errorCallBack(eInfo);

    //     //continue
    //     // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
    //     // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
    //   },
    // ));
  }

  /// 错误处理
  void onError(ErrorEntity eInfo) async {
    MyDialog.getSnakBar('错误码: ${eInfo.code}', eInfo.message);
  }

  // 错误信息
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return ErrorEntity(code: -1, message: "请求取消");
      case DioErrorType.connectTimeout:
        return ErrorEntity(code: -1, message: "连接超时");
      case DioErrorType.sendTimeout:
        return ErrorEntity(code: -1, message: "请求超时");
      case DioErrorType.receiveTimeout:
        return ErrorEntity(code: -1, message: "响应超时");
      case DioErrorType.response:
        {
          try {
            int errCode =
                error.response != null ? error.response!.statusCode! : -1;
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (errCode) {
              case 400:
                return ErrorEntity(code: errCode, message: "请求语法错误");
              case 401:
                return ErrorEntity(code: errCode, message: "没有权限");
              case 403:
                return ErrorEntity(code: errCode, message: "服务器拒绝执行");
              case 404:
                return ErrorEntity(code: errCode, message: "无法连接服务器");
              case 405:
                return ErrorEntity(code: errCode, message: "请求方法被禁止");
              case 500:
                return ErrorEntity(code: errCode, message: "服务器内部错误");
              case 502:
                return ErrorEntity(code: errCode, message: "无效的请求");
              case 503:
                return ErrorEntity(code: errCode, message: "服务器挂了");
              case 505:
                return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
              default:
                {
                  // return ErrorEntity(code: errCode, message: "未知错误");
                  return ErrorEntity(
                    code: errCode,
                    message: error.response != null
                        ? error.response!.statusMessage!
                        : '',
                  );
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "未知错误");
          }
        }
      default:
        {
          return ErrorEntity(code: -1, message: '网络连接失败');
        }
    }
  }

  /// 读取本地配置
  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};

    return headers;
  }

  /// restful get 操作
  /// refresh 是否下拉刷新 默认 false
  /// noCache 是否不缓存 默认 true
  /// list 是否列表 默认 false
  /// cacheKey 缓存key
  /// cacheDisk 是否磁盘缓存
  Future<Response?> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool refresh = true,
    bool noCache = !cacheEnable,
    bool list = false,
    String cacheKey = '',
    bool cacheDisk = false,
    void Function(int, int)? onReceiveProgress,
    Future<void> Function(ErrorEntity eInfo)? errorCallBack,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    requestOptions.extra ??= {};
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "noCache": noCache,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    Response response;

    try {
      response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      log(response.data.toString());
      return response;
    } on DioError catch (err) {
      var eInfo = createErrorEntity(err);
      if (errorCallBack != null) await errorCallBack(eInfo);
      return null;
    }
  }

  /// restful post 操作
  Future<Response?> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Future<void> Function(ErrorEntity eInfo)? errorCallBack,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    Response response;

    try {
      response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (err) {
      var eInfo = createErrorEntity(err);
      if (errorCallBack != null) await errorCallBack(eInfo);
      return null;
    }
  }

  /// restful put 操作
  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    Future<void> Function(ErrorEntity eInfo)? errorCallBack,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    Response response;

    try {
      response = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (err) {
      var eInfo = createErrorEntity(err);
      if (errorCallBack != null) await errorCallBack(eInfo);
      return null;
    }
  }

  /// restful patch 操作
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    Future<void> Function(ErrorEntity eInfo)? errorCallBack,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    Response response;

    try {
      response = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (err) {
      var eInfo = createErrorEntity(err);
      if (errorCallBack != null) await errorCallBack(eInfo);
      return null;
    }
  }

  /// restful delete 操作
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    Future<void> Function(ErrorEntity eInfo)? errorCallBack,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    Response response;

    try {
      response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (err) {
      var eInfo = createErrorEntity(err);
      if (errorCallBack != null) await errorCallBack(eInfo);
      return null;
    }
  }

  /// restful post form 表单提交操作
  Future postForm(
    String path, {
    Map<String, dynamic> data = const {},
    Map<String, dynamic>? queryParameters,
    Options? options,
    void Function(int, int)? onSendProgress,
    CancelToken? cancelToken,
    Future<void> Function(ErrorEntity eInfo)? errorCallBack,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    Response response;

    try {
      response = await dio.post(
        path,
        data: FormData.fromMap(data),
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioError catch (err) {
      var eInfo = createErrorEntity(err);
      if (errorCallBack != null) await errorCallBack(eInfo);
      return null;
    }
  }

  /// restful post Stream 流数据
  Future postStream(
    String path, {
    dynamic data,
    int dataLength = 0,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    Future<void> Function(ErrorEntity eInfo)? errorCallBack,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    requestOptions.headers!.addAll({
      Headers.contentLengthHeader: dataLength.toString(),
    });

    Response response;

    try {
      response = await dio.post(
        path,
        data: Stream.fromIterable(data.map((e) => [e])),
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (err) {
      var eInfo = createErrorEntity(err);
      if (errorCallBack != null) await errorCallBack(eInfo);
      return null;
    }
  }
}

// 异常处理
class ErrorEntity implements Exception {
  int code = -1;
  String message = '';
  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == '') return "Exception";
    return "Exception: code $code, $message";
  }
}
