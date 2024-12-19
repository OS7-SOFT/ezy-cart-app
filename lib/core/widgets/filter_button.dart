import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;
  const FilterButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    icon,
                    size: 18,
                  ),
                ],
              ),
            )));
  }
}
