import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/personal_account/personal_account_success_model.dart';
import '/presentation/resources/assets_manager.dart';
import '/presentation/resources/colors_manager.dart';
import '/presentation/resources/routes_manager.dart';
import '/presentation/resources/strings_manager.dart';
import '/presentation/resources/values_manager.dart';
import '/presentation/widgets/default_button_widget.dart';
import '/presentation/widgets/edit_account_text_field_widget.dart';
import '/presentation/widgets/white_app_bar_widget.dart';

var emailController = TextEditingController();
var nameController = TextEditingController();
var phoneController = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();

class AccountInformationScreen extends StatelessWidget {
  final PersonalAccountSuccessModel model;

  const AccountInformationScreen({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///todo password
    passwordController.text = '123';
    nameController.text = '${model.firstName!} ${model.lastName}';
    phoneController.text = model.phoneNumber ?? '0100000';
    emailController.text = model.email! ?? 'email@gmail.com';
    return Scaffold(
      appBar: whiteAppBarWidget(
        context: context,
        color: ColorManager.primaryMoreLight,
        title: StringsManager.accountInformation,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p31),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // profile image
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    model.imageUrl == null
                        ? SvgPicture.asset(
                            ImageAssets.profileImage,
                            height: AppSize.s60,
                            width: AppSize.s60,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            model.imageUrl!,
                            height: AppSize.s60,
                            width: AppSize.s60,
                            fit: BoxFit.cover,
                          ),
                    const Padding(
                      padding: EdgeInsetsDirectional.only(
                        bottom: 1.0,
                        end: 1.0,
                      ),

                      ///todo camera
                      child: InkWell(
                        child: CircleAvatar(
                          radius: AppSize.s9,
                          backgroundColor: ColorManager.accent,
                          child: Icon(
                            Icons.add,
                            color: ColorManager.white,
                            size: 19.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppPadding.p14,
              ),

              //name
              EditAccountTextFieldWidget(
                controller: nameController,
                label: StringsManager.name,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              //phone
              EditAccountTextFieldWidget(
                controller: phoneController,
                label: StringsManager.phone,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              //email
              EditAccountTextFieldWidget(
                controller: emailController,
                label: StringsManager.email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              //password
              EditAccountTextFieldWidget(
                controller: passwordController,
                label: StringsManager.editPassword,
                keyboardType: TextInputType.text,
                isRead: true,
                isObscure: true,
                onPress: () {
                  Navigator.pushNamed(context, Routes.changePassword);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppPadding.p31),
        child: DefaultButtonWidget(
          text: StringsManager.update,
          onPressed: () {},
        ),
      ),
    );
  }
}
