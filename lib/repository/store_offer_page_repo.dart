import '../data/remote/api_services.dart';
import '../models/Store_page/store_page_model.dart';

class StoreOfferPageRepository {
  static final instance = StoreOfferPageRepository._internal();

  StoreOfferPageRepository._internal();

  factory StoreOfferPageRepository() => instance;

  Future<StorePageModel> getStoreOfferDetails(int storeOfferId) async =>
      await ApiServices.instance
          .storeOfferPageApi()
          .fetchStoreOfferPage(storeOfferId: storeOfferId);
}
