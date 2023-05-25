import 'package:yomy_cart/models/update_person_account/update_person_account_error400_model.dart';

import '../../../models/update_person_account/update_person_account_error_model.dart';

abstract class AccountState {}

class AccountInitial extends AccountState {}

class ChangeBannerButtonState extends AccountState {}

class LogOutState extends AccountState {}

class UpdatePersonalAccountLoadingState extends AccountState {}

class UpdatePersonalAccountSuccessState extends AccountState {
  final String message;

  UpdatePersonalAccountSuccessState(this.message);
}

class UpdatePersonalAccountErrorState extends AccountState {
  final UpdatePersonalAccountErrorModel updatePersonalAccountErrorModel;

  UpdatePersonalAccountErrorState(this.updatePersonalAccountErrorModel);
}

class UpdatePersonalAccountError400State extends AccountState {
  final UpdatePersonalAccountError400Model updatePersonalAccountError400Model;

  UpdatePersonalAccountError400State(this.updatePersonalAccountError400Model);
}
