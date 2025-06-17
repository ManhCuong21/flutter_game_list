import 'package:flutter/material.dart';

Widget bottomAppBar() {
  List<String> icons = [
    "assets/images/home.png",
    "assets/images/search.png",
    "assets/images/send.png",
    "assets/images/safari.png",
    "assets/images/settings.png",
  ];
  return Positioned(
    bottom: 20,
    left: 10,
    right: 10,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        shape: BoxShape.rectangle,
        color: Colors.black54,
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(icons.length, (index) {
            return GestureDetector(
              onTap: () => {},
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  // color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                  icons[index],
                  // color: isSelected ? Colors.black : Colors.white,
                ),
              ),
            );
          }),
        ),
      ),
    ),
  );
}
