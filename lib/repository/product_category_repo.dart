import 'package:yomy_cart/data/remote/api_services.dart';
import 'package:yomy_cart/models/product_category_page/product_category_page_model.dart';

class ProductCaegoryRepo {
  static ProductCaegoryRepo instance = ProductCaegoryRepo._();
  ProductCaegoryRepo._();

  Future<ProductCategoryPageModel> getProductCategory() {
    return ApiServices.instance.productCategoryPageApi().fetchProductCategory();
  }
}
