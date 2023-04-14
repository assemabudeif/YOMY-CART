import '../data/remote/store_page_api.dart';
import '../models/Store_page/store_page_model.dart';

class StorePageRepository {
  static final instance = StorePageRepository._internal();

  StorePageRepository._internal();

  factory StorePageRepository() => instance;

  Future<StorePageModel> featchHomeData() async =>
      await StorePageApi.getHomePageData();
}
