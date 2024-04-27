import 'package:ecommerce_app_c10_frida/core/local/prefs_helper.dart';
import 'package:ecommerce_app_c10_frida/core/utils/routes_manager.dart';
import 'package:ecommerce_app_c10_frida/di/di.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/sign_up/sign_up_viewModel.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/widgets/custom_button.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController fullNameController;

  late TextEditingController mobileController;

  late TextEditingController emailController;

  late TextEditingController passwordController;

  var formKey = GlobalKey<FormState>();
  SignUpViewModel viewModel = getIt<SignUpViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    mobileController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    mobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset(
                    'assets/icons/route_ic.svg',
                    colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  Text(
                    'Full Name',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    hintText: 'enter your full name',
                    keyboardType: TextInputType.text,
                    controller: fullNameController,
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter valid name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Text(
                    'Mobile Number',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    maxLength: 11,
                    hintText: 'enter your mobile no.',
                    keyboardType: TextInputType.phone,
                    controller: mobileController,
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter valid name';
                      }
                      if (input.length < 11) {
                        return 'Mobile num should be at least 11 char';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Text(
                    'Email Address',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    hintText: 'enter your email',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'enter your email address';
                      }
                      if (!(RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(input))) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    hintText: 'Password',
                    maxLength: 6,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    validator: (input) {
                      if (input == null || input
                          .trim()
                          .isEmpty) {
                        return 'enter your password';
                      }
                      if (input.length < 6) {
                        return 'Password should be at least 6 char ';
                      }
              
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  BlocConsumer<SignUpViewModel, SignUpViewModelState>(

                    bloc: viewModel,
                    builder: (context, state) {
                        if (state is LoadingState) {
                          return Center(
                              child: CircularProgressIndicator(color: Colors
                                  .white,));
                        }
                        return CustomButton(
                          buttonTitle: 'Sign Up',
                          onButtonClicked: () {
                            signUp();
                          },
                        );
                      },
                      listener: (context, state) {
                        if (state is ErrorState) {
                          Fluttertoast.showToast(
                              msg: state.errorMessage,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                        if (state is SuccessState) {
                          PrefsHelper.setToken(state.token);
                        Fluttertoast.showToast(
                            msg: "Registered Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        Navigator.pushReplacementNamed(context, RoutesManager.signInRouteName);
                      }
                      },
              
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.signUp(email: emailController.text, password: passwordController.text, mobileNumber: mobileController.text, name: fullNameController.text);

    // now u should sign up
  }
}
