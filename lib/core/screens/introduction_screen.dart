import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:go_router/go_router.dart';

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
