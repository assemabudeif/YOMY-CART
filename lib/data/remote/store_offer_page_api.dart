import 'package:dio/dio.dart';

import '../../models/Store_page/store_page_error400_model.dart';
import '../../models/Store_page/store_page_error_model.dart';
import '../../models/Store_page/store_page_model.dart';
import '../../models/Store_page/store_page_success_model.dart';
import '../../utilis/consetant.dart';
import 'dio_logger.dart';
import 'end_points.dart';

class StoreOfferPageApi {
  static StoreOfferPageApi instance = StoreOfferPageApi._();
  StoreOfferPageApi._();

  Future<StorePageModel> fetchStoreOfferPage(
      {required int storeOfferId}) async {
    try {
      Response response = await DioLogger.getDio().post(
        Endpoints.storeOfferPageApi,
        data: {
          "pageId": 1,
          "offerId": storeOfferId,
          "langId": 1,
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
