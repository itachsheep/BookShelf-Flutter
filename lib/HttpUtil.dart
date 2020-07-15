import 'package:dio/dio.dart';
import 'package:legado_flutter/utils/logutils.dart';
final String TAG = "HttpUtil";

class HttpUtil {
  static HttpUtil _instance;
  Options option;
  Dio dio;
  static getInstance() {
    if(_instance == null) {
      _instance = new HttpUtil._internal();
    }
    return _instance;
  }
  HttpUtil._internal(){
    option = Options(
      connectTimeout: 10000,
      receiveTimeout: 3000,
      responseType: ResponseType.JSON,
      headers: {

      },
    );
    dio = new Dio(option);
  }

  get(url,{data,options,cancelToken,errorCallback,successCallback,startCallback}) async{
    if(startCallback != null) {
      startCallback();
    }
    Response response;
    try {
      response = await dio.get(url,data: data,cancelToken: cancelToken);
      if(successCallback != null) {
        successCallback(response.data);
      }
      LogUtils.d(TAG, "json结果： ${response.data}");
    } on DioError catch(e) {
      if(CancelToken.isCancel(e)) {
        LogUtils.d(TAG, "get 请求取消 " + e.message);
      }
      if(errorCallback != null) {
        errorCallback();
      }
      LogUtils.d(TAG, "get 请求失败：" + e.message);
    }
    return response.data;
  }

}