import 'package:ezy_cart_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:ezy_cart_app/features/category/dependency_injection_.dart'
    as di;
import 'package:introduction_screen/introduction_screen.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme:
          ThemeData(primaryColorLight: const Color.fromRGBO(248, 55, 88, 100)),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  IntroductionWidget({
    super.key,
  });

  final List<PageViewModel> getPages = [
    PageViewModel(
        image: Image.asset("assets/images/fashion shop-rafiki 1.png"),
        title: "Choose Products",
        body:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
    PageViewModel(
        image: Image.asset("assets/images/Sales consulting-pana 1.png"),
        title: "Make Payment",
        body:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
    PageViewModel(
        image: Image.asset("assets/images/Shopping bag-rafiki 1.png"),
        title: "Get Your Order",
        body:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      next: const Text(
        "Next",
        style: TextStyle(
            color: Color.fromARGB(255, 248, 55, 87),
            fontSize: 18,
            fontWeight: FontWeight.w700),
      ),
      globalBackgroundColor: Colors.white,
      doneStyle: TextButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 248, 55, 87)),
      done: const Text("Get Started",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
      pages: getPages,
      onDone: () => context.go('/home'),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/logo.png")),
            SizedBox(
              width: 5,
            ),
            Text(
              "EzyCart",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Color.fromRGBO(67, 146, 249, 1)),
            )
          ],
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              maxRadius: 22,
              backgroundColor: Colors.red,
              backgroundImage: AssetImage("assets/images/avater-6.png"),
            ),
          )
        ],
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              
            ),
          ],
        ),
      ),
    );
  }
}
