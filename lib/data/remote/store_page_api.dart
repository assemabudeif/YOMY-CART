import 'package:dio/dio.dart';
import 'package:yomy_cart/data/remote/dio_logger.dart';
import 'package:yomy_cart/models/Store_page/store_page_error_model.dart';
import 'package:yomy_cart/models/Store_page/store_page_model.dart';
import 'package:yomy_cart/models/Store_page/store_page_success_model.dart';

import '../../models/Store_page/store_page_error400_model.dart';
import '../../utilis/consetant.dart';
import 'end_points.dart';

class StorePageApi {
  static Future<StorePageModel> getHomePageData() async {
    try {
      Response response = await DioLogger.getDio().post(
        Endpoints.storePageApi,
        data: {
          ///ToDo Parameters
          "advancedSearch": {
            "fields": [
              "string"
            ],
            "keyword": "string"
          },
          "keyword": "string",
          "advancedFilter": {
            "logic": "string",
            "filters": [
              "string"
            ],
            "field": "string",
            "operator": "string",
            "value": "string"
          },
          "pageNumber": 0,
          "pageSize": 0,
          "orderBy": [
            "string"
          ],
          "pageId": 1,
          "storeId": 0,
          "langId": 1
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return StorePageSuccessModel.fromJson(response.data);
      } else {
        return StorePageErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return StorePageError400Model.fromJson(e.response!.data);
      } else {
        return StorePageErrorModel.fromJson(e.response!.data);
      }
    }
  }
}
