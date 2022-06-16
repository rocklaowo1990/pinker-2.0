import 'package:pinker/common/data/library.dart';
import 'package:pinker/common/utils/library.dart';

class HomeApi {
  /// 获取首页数据
  static Future<ResponseData> getHomeData({
    required int type,
    void Function(int, int)? onReceiveProgress,
  }) async {
    var response = await MyHttp().get(
      '/home/getHomeData',
      queryParameters: {
        'type': type,
      },
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  /// 获取搜索关键字
  static Future<ResponseData> getSearchWord() async {
    var response = await MyHttp().get('/home/searchWord');
    return response;
  }
}
