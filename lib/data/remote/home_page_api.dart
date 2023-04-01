import 'package:dio/dio.dart';
import 'package:yomy_cart/data/remote/dio_logger.dart';

import '../../models/home_page/home_page_api_error400_model.dart';
import '../../models/home_page/home_page_api_error_model.dart';
import '../../models/home_page/home_page_api_model.dart';
import '../../models/home_page/home_page_api_success_model.dart';
import 'end_points.dart';

class HomePageApi {
  static Future<HomePageApiModel> getHomePageData() async {
    try {
      Response response = await DioLogger.getDio().post(Endpoints.homePageApi);
      if (response.statusCode == 200) {
        return HomePageApiSuccessModel.fromJson(response.data);
      } else {
        return HomePageApiErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return HomePageApiError400Model.fromJson(e.response!.data);
      } else {
        return HomePageApiErrorModel.fromJson(e.response!.data);
      }
    }
  }
}
