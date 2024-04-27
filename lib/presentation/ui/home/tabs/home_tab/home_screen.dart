import 'package:ecommerce_app_c10_frida/core/local/prefs_helper.dart';
import 'package:ecommerce_app_c10_frida/core/utils/routes_manager.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/category_tab.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/home_tab_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index)
    {
      selectedIndex = index;
      setState(() {});
    },
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.blue,
    fixedColor: Colors.blue,
    items: [
    selectedIndex == 0
    ? const BottomNavigationBarItem(
    icon: CircleAvatar(
    child:
    ImageIcon(AssetImage("assets/icons/ic_home.png"))),
    label: "")
        : const BottomNavigationBarItem(
    icon: ImageIcon(AssetImage("assets/icons/ic_home.png")),
    label: ""),
    selectedIndex == 1
    ? const BottomNavigationBarItem(
    icon: CircleAvatar(
    child: ImageIcon(
    AssetImage("assets/icons/ic_category.png"))),
    label: "")
        : const BottomNavigationBarItem(
    icon: ImageIcon(AssetImage("assets/icons/ic_category.png")),
    label: ""),
    selectedIndex == 2
    ? const BottomNavigationBarItem(
    icon: CircleAvatar(
    child:
    ImageIcon(AssetImage("assets/icons/ic_fav.png"))),
    label: "")
        : const BottomNavigationBarItem(
    icon: ImageIcon(AssetImage("assets/icons/ic_fav.png")),
    label: ""),
    selectedIndex == 3
    ? const BottomNavigationBarItem(
    icon: CircleAvatar(
    child: ImageIcon(
    AssetImage("assets/icons/ic_person.png"))),
    label: "")
        : const BottomNavigationBarItem(
    icon: ImageIcon(AssetImage("assets/icons/ic_person.png")),
    label: ""),
    ]),
    appBar: AppBar(
    title: const Text('Route e-commerce app'),
    actions: [
    IconButton(onPressed: () {
    logOut();
    }, icon: Icon(Icons.logout_rounded))
    ],),
    body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    HomeTabView(),
    CategoryTab(),
    HomeTabView(),
    HomeTabView(),
  ];

  void logOut() {
    PrefsHelper.clearToken();
    Navigator.pushReplacementNamed(context, RoutesManager.signInRouteName);
  }
}
