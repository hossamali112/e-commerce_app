import 'package:ecommerce_app_c10_frida/core/local/prefs_helper.dart';
import 'package:ecommerce_app_c10_frida/core/utils/routes_manager.dart';
import 'package:ecommerce_app_c10_frida/di/di.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/home_screen.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsHelper.init();
  configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        navigatorKey:navigatorKey ,
        routes: {
          RoutesManager.signUpRouteName:(context) => SignUpScreen(),
          RoutesManager.signInRouteName:(context) => SignInScreen(),
          RoutesManager.homeRouteName:(context) => HomeScreen(),
        },
        initialRoute: PrefsHelper.getToken().isNotEmpty ? RoutesManager.homeRouteName : RoutesManager.signInRouteName,
      ),
    );
  }
}