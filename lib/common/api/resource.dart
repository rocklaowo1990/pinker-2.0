import 'package:pinker/common/data/response_data.dart';
import 'package:pinker/common/utils/library.dart';

class ResourceApi {
  static Future<ResponseData> getResourceList({
    required int type,
    int? pageNo,
    void Function(int, int)? onReceiveProgress,
    int? pageSize,
    int? sort,
    int? mediaType,
    int? country,
    String? keyword,
    int? year,
  }) async {
    var response = await MyHttp().get(
      '/resource/getResourceList',
      queryParameters: {
        'type': type,
        'pageNo': pageNo,
        'pageSize': pageSize ?? 20,
        'sort': sort,
        'mediaType': mediaType,
        'country': country,
        'keyword': keyword,
        'year': year,
      },
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  static Future<ResponseData> getResourceType() async {
    var response = await MyHttp().get('/resource/getResourceType');
    return response;
  }

  static Future<ResponseData> getType() async {
    var response = await MyHttp().get('/resource/getType');
    return response;
  }
}
