import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              blurRadius: 3,
              color: Color.fromARGB(34, 0, 0, 0),
              offset: Offset(0, 3))
        ]),
        child: _buildTextFormField(context));
  }

  TextFormField _buildTextFormField(BuildContext context) {
    return TextFormField(
        // onFieldSubmitted: (val) {
        //   showSearch(
        //       context: context,
        //       delegate: SearchDelegateImpl(),
        //       query: val.trim());
        // },
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            hintText: "Search any Product",
            hintStyle: TextStyle(fontSize: 17, color: Colors.grey[500]),
            prefixIcon: const Icon(Icons.search)));
  }
}
