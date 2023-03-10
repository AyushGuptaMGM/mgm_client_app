import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/screens/common_base_class.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/widgets/app_text_button.dart';
import '../../common/widgets/app_text_field.dart';
import '../controllers/authentication_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String routeName = "/auth/login";
  final AuthenticationController _authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showBottomWidget: true,
      bottomWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextButton(
            text: "Continue to Get OTP",
            onTap: () {
              _authenticationController.firebasePhoneSignIn();
            },
          ),
          const VSpace(24),
          RichText(
            text: TextSpan(
                text: "Don't have Account? ",
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                      text: "Sign Up",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppThemes.primary))
                ]),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Text(
            //   "Bakery App",
            //   style: Theme.of(context).textTheme.headlineSmall,
            // ),
            Text(
              "Welcome Back!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Column(
              children: [
                const VSpace(15),
                AppTextField(
                  title: "Phone Number",
                  controller: _authenticationController.phoneNumberCtr,
                  textInputType: TextInputType.phone,

                ),
                const VSpace(15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
