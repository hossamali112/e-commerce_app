import 'package:ecommerce_app_c10_frida/core/local/prefs_helper.dart';
import 'package:ecommerce_app_c10_frida/core/utils/routes_manager.dart';
import 'package:ecommerce_app_c10_frida/di/di.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/sign_in/sign_in_viewModel.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/widgets/custom_button.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
SignInViewModel viewModel  = getIt<SignInViewModel>();
var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  'assets/icons/route_ic.svg',
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                Text(
                  'Welcome Back To Route',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  'Please sign in with your mail',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 8,
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
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 36,
                ),
                BlocConsumer<SignInViewModel, SignInViewModelState>(
                  bloc: viewModel,
                  builder: (context, state) {
                    if(state is LoadingState){
                      return Center(child: CircularProgressIndicator(color: Colors.white,));
                    }
                    return CustomButton(
                      buttonTitle: 'Sign In',
                      onButtonClicked: () {
                        login();

                      },
                    );
                  },
                  listener: (context, state) {
                    if(state is ErrorState){
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
                    if(state is SuccessState){
                      print('hello');
                      PrefsHelper.setToken(state.authEntity.token ?? '');
                      Fluttertoast.showToast(
                          msg: "Logged in Successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      Navigator.pushReplacementNamed(context, RoutesManager.homeRouteName);
                    }
                  },


                ),
                SizedBox(
                  height: 30.h,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesManager.signUpRouteName);
                    },
                    child: Text(
                      'Don’t have an account? Create Account',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if(formKey.currentState?.validate() == false){
      return ;
    }
    viewModel.signIn(email: emailController.text, password: passwordController.text);

  }
}
