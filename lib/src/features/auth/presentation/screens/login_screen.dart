import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scube_task/src/core/assets/app_assets.dart';
import 'package:scube_task/src/core/theme/app_colors.dart';
import 'package:scube_task/src/features/shared/widgets/custom_elevated_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> isPasswordObscured = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
              child: Column(
                children: [
                  Image.asset(AppAssets.appLogo),
                  const SizedBox(height: 20),
                  Text(
                    "SCUBE",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text(
                    "Control & Monitoring System",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
            ),
            //Form
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 32, left: 12, right: 12),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(color: AppColors.loginTextColor),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 12,
                          ),
                          hint: Text(
                            "Username",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ValueListenableBuilder(
                        valueListenable: isPasswordObscured,
                        builder: (context, isObscured, child) {
                          return TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            obscureText: isObscured,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  isPasswordObscured.value = !isPasswordObscured.value;
                                },
                                child: Container(
                                  height: 12,
                                  width: 12,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      isObscured
                                          ? AppAssets.eyeOffIcon
                                          : AppAssets.eyeOnIcon,
                                      color: AppColors.eyeIconColor,
                                    ),
                                  ),
                                ),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 12.0,
                              ),
                              hint: Text(
                                "Password",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forget password?",
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(color: AppColors.grey, decoration: TextDecoration.underline),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomElevatedButton(title: "Login", onTap: (){
                        FocusScope.of(context).unfocus();
                      },),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: AppColors.grey),
                          children: [
                            const TextSpan(
                              text: "Don't have any account? ",
                            ),
                            TextSpan(
                              text: "Register Now",
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                fontSize: 14,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
