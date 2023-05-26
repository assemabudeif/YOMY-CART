import 'package:yomy_cart/models/product_details/product_details_model.dart';

import '../data/remote/api_services.dart';

class ProductDetailsRepository {
  static final instance = ProductDetailsRepository._internal();

  ProductDetailsRepository._internal();

  factory ProductDetailsRepository() => instance;

  Future<ProductDetailsModel> getProductDetails(int productId) async =>
      await ApiServices.instance
          .productDetailsPageApi()
          .fetchProductDetailsPage(productId: productId);
}
