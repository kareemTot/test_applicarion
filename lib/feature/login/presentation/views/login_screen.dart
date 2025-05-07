import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_applicarion/core/constant/constant.dart';
import 'package:test_applicarion/core/utils/app_images.dart';
import 'package:test_applicarion/feature/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:test_applicarion/feature/login/presentation/cubit/login_cubit.dart';

import '../../../../core/func/show_toast.dart';
import '../../../../core/widget/cstom_text_form_filed.dart';
import '../../../../core/widget/custom_app_button.dart';
import '../../../../di.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            showToast(message: "Login Success", backgroundColor: Colors.green);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNavBarScreen()),
            );
          } else if (state is LoginFailureState) {
            showToast(message: state.message, backgroundColor: Colors.red);
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      AppImages.logo,
                      fit: BoxFit.fill,
                      width: double.maxFinite,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Form(
                      key: cubit.formkey,
                      child: Column(
                        spacing: 16,
                        children: [
                          Text("welcome back", style: TextStyle(fontSize: 20)),
                          Text(
                            "please login to your account",
                            style: TextStyle(fontSize: 16),
                          ),
                          CustomTextFormFiled(
                            color: Colors.white,
                            controller: TextEditingController(
                              text: "saheralaa555@gmail.com",
                            ),
                            hintText: "ادخل البريد الالكتروني الخاص بك",
                            validator:
                                (valu) => valu!.isEmpty ? validationText : null,
                          ),
                          CustomTextFormFiled(
                            color: Colors.white,
                            obscureText: true,
                            controller: TextEditingController(
                              text: "1111111Sa",
                            ),
                            hintText: "ادخل كلمة المرور الخاصة بك",
                            validator:
                                (valu) => valu!.isEmpty ? validationText : null,
                          ),

                          CustomAppButton(
                            text:
                                state is LoginLoadingState
                                    ? "Loading..."
                                    : "LOGIN",
                            containerColor: Colors.white,
                            textColor: Colors.black,
                            onPressed: () {
                              cubit.login();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
