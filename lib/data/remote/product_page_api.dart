import 'package:dio/dio.dart';

import '../../models/Store_page/store_page_error400_model.dart';
import '../../models/Store_page/store_page_error_model.dart';
import '../../models/Store_page/store_page_model.dart';
import '../../models/Store_page/store_page_success_model.dart';
import '../../utilis/consetant.dart';
import 'dio_logger.dart';
import 'end_points.dart';

class ProductPageApi {
  static ProductPageApi instance = ProductPageApi._();
  ProductPageApi._();

  Future<StorePageModel> fetchProductPage({required int productId}) async {
    try {
      Response response = await DioLogger.getDio().post(
        Endpoints.productPageApi,
        data: {
          "pageId": 1,
          "productId": productId,
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
