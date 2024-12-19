import 'package:flutter/material.dart';

class AppBarHelper {
  static AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).highlightColor,
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
    );
  }
}
