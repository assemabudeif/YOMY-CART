import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/models/register/register_error400_model.dart';
import '/models/register/register_error_model.dart';
import '/models/register/register_model.dart';
import '/models/register/register_success_model.dart';
import '/presentation/resources/routes_manager.dart';

import '../../../../repository/repo.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  static RegistrationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool agree = false;

  void onAgreeChanged(bool? value) {
    emit(RegistrationInitial());
    log(value.toString());
    agree = value!;
    emit(OnAgreeChanged());
  }

  void termsOfServicePressed() {}

  void skipButtonPressed() {}

  Future<void> registerButtonPressed(BuildContext context) async {
    if (formKey.currentState!.validate() && agree) {
    emit(RegistrationLoading());

      RegisterModel registerModel = await Repository.instance.register(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        userName: userNameController.text,
        mobile: mobileController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );
      if (registerModel is RegisterSuccessModel) {
        log(registerModel.message!);
        Fluttertoast.showToast(
          msg: registerModel.message!,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.home, (route) => false);
        emit(RegistrationSuccess());
      } else if (registerModel is RegisterErrorModel) {
        log(registerModel.messages!.toString());
        Fluttertoast.showToast(
          msg: registerModel.messages![0],
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        emit(RegistrationError(registerModel.messages![0]));
      } else if (registerModel is RegisterError400Model) {
        log(registerModel.errors![0].toString());
        Fluttertoast.showToast(
          msg: registerModel.errors!.toString(),
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        emit(RegistrationError(registerModel.errors![0].toString()));
      }
    }
  }
}
