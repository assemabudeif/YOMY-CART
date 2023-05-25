import 'package:yomy_cart/models/product_details/product_details_model.dart';

import '../data/remote/api_services.dart';

class ProductPageRepository {
  static final instance = ProductPageRepository._internal();

  ProductPageRepository._internal();

  factory ProductPageRepository() => instance;

  Future<ProductDetailsModel> getProductDetails(int productId) async =>
      await ApiServices.instance
          .productDetailsPageApi()
          .fetchProductDetailsPage(productId: productId);
}
