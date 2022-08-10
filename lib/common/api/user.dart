import 'package:dio/dio.dart';
import 'package:pinker/common/data/library.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/utils/library.dart';

class UserApi {
  static Future<ResponseData?> getUserInfo({
    Future<void> Function(ErrorEntity)? errorCallBack,
  }) async {
    Response? response = await MyHttp().get(
      '/user/getUserInfo',
      errorCallBack: ConfigController.to.errorDaliog,
      options: Options(
        headers: {'token': UserController.to.token},
      ),
    );
    return response != null ? ResponseData.fromJson(response.data) : null;
  }

  static Future<ResponseData?> deleteBank({
    required int type,
    Future<void> Function(ErrorEntity)? errorCallBack,
  }) async {
    Response? response = await MyHttp().post(
      '/user/deleteBank',
      errorCallBack: ConfigController.to.errorDaliog,
      options: Options(
        headers: {'token': UserController.to.token},
      ),
      data: {'type': type},
    );
    return response != null ? ResponseData.fromJson(response.data) : null;
  }

  static Future<ResponseData?> addBank({
    required String name,
    required String number,
    required String bankName,
    Future<void> Function(ErrorEntity)? errorCallBack,
  }) async {
    Response? response = await MyHttp().post(
      '/user/addBank',
      errorCallBack: ConfigController.to.errorDaliog,
      options: Options(
        headers: {'token': UserController.to.token},
      ),
      data: {'name': name, 'number': number, 'bankName': bankName},
    );
    return response != null ? ResponseData.fromJson(response.data) : null;
  }

  static Future<ResponseData?> addUsdt({
    required String number,
    Future<void> Function(ErrorEntity)? errorCallBack,
  }) async {
    Response? response = await MyHttp().post(
      '/user/addUsdt',
      errorCallBack: ConfigController.to.errorDaliog,
      options: Options(
        headers: {'token': UserController.to.token},
      ),
      data: {'number': number},
    );
    return response != null ? ResponseData.fromJson(response.data) : null;
  }
}
