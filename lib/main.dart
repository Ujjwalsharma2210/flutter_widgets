import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:widgets/blog_page.dart';
import 'package:widgets/settings_page.dart';
import 'package:widgets/shop_page.dart';
import 'package:widgets/signup_page.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'reuse_widgets.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // initialRoute: '/',
      routes: {
        '/MyHomePage': (context) => MyHomePage(),
        '/SignupPage': (context) => SignupPage(),
        '/LoginPage': (context) => LoginPage(),
        '/SettingsPage': (context) => SettingsPage(),
      },
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyHomePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  Color primaryColor = Colors.black;
  Color white = Colors.grey.shade600;

  final tabs = [const HomePage(), const BlogPage(), const ShopPage()];

  // void openSideDrawer() {
  //   Scaffold().of(context).openDrawer();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Start sleep',
          style: TextStyle(fontSize: 16),
        ),
        onPressed: () {},
      ),
      backgroundColor: primaryColor,
      drawerEnableOpenDragGesture: true,
      drawer: DrawerWidget(context),
      appBar: AppBar(
        title: const Text('Widgets'),
        // leading: IconButton(icon: Icon(Icons.menu), onPressed: () { openSideDrawer(); },),
        leadingWidth: 35,
        // elevation: 5,
        toolbarHeight: 60,
        // shadowColor: Colors.grey,
        // backgroundColor: primaryColor,
        backgroundColor: primaryColor,
      ),
      // body: tabs[currentPageIndex],
      body: tabs[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        height: 70,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: white,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: white,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.library_books,
              color: white,
            ),
            icon: Icon(
              Icons.library_books_outlined,
              color: white,
            ),
            label: 'Blog',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.shopping_bag,
              color: white,
            ),
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: white,
            ),
            label: 'Shop',
          ),
        ],
        backgroundColor: primaryColor,
      ),
    );
  }
}
