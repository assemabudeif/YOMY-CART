import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/local/shared_prefrences.dart';
import '../../../utilis/consetant.dart';
import '../../resources/routes_manager.dart';
import '/presentation/account/cubit/account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());

  static AccountCubit get(BuildContext context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isMyAccount = true;
  bool isSettings = true;
  bool isAlnassya = true;

  void changeRadioButton(String type) {
    if (type == 'settings') {
      isSettings = !isSettings;
    }
    if (type == 'account') {
      isMyAccount = !isMyAccount;
    }
    if (type == '3alnassya') {
      isAlnassya = !isAlnassya;
    }
    emit(ChangeBannerButtonState());
  }

  logout({required BuildContext context}) {
    SharedPref.deleteData(key: tokenKey);
    SharedPref.deleteData(key: refreshTokenKey);
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.loginRoute,
      (route) => false,
    );
    emit(LogOutState());
  }
}
