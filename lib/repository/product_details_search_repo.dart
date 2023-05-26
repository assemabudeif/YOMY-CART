import 'package:yomy_cart/models/product_search/product_details_search_model.dart';

import '../data/remote/api_services.dart';

class ProductDetailsSearchRepository {
  static final instance = ProductDetailsSearchRepository._internal();

  ProductDetailsSearchRepository._internal();

  factory ProductDetailsSearchRepository() => instance;

  Future<ProductDetailsSearchModel> getProductDetailsSearch(
          int productId) async =>
      await ApiServices.instance
          .productDetailsSearchPageApi()
          .fetchProductDetailsSearchPage(productId: productId);
}
