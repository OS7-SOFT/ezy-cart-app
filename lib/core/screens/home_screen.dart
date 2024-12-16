import 'package:ezy_cart_app/core/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';

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
      body: const Column(
        children: [
          SearchFieldWidget(),
        ],
      ),
    );
  }
}
