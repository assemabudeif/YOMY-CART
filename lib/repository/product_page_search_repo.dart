import 'package:yomy_cart/models/product_search/product_details_search_model.dart';

import '../data/remote/api_services.dart';

class ProductPageSearchRepository {
  static final instance = ProductPageSearchRepository._internal();

  ProductPageSearchRepository._internal();

  factory ProductPageSearchRepository() => instance;

  Future<ProductDetailsSearchModel> getProductDetailsSearch(
          int productId) async =>
      await ApiServices.instance
          .productDetailsSearchPageApi()
          .fetchProductDetailsSearchPage(productId: productId);
}
