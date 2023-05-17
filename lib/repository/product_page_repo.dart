import '../data/remote/api_services.dart';
import '../models/Store_page/store_page_model.dart';

class ProductPageRepository {
  static final instance = ProductPageRepository._internal();

  ProductPageRepository._internal();

  factory ProductPageRepository() => instance;

  Future<StorePageModel> getProductDetails(int productId) async =>
      await ApiServices.instance
          .productPageApi()
          .fetchProductPage(productId: productId);
}
