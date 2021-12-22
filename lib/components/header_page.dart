import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back_ios),
          ),
          Image(
            height: 50,
            image: AssetImage("assets/images/small-logo.png"),
          ),
        ],
      ),
    );
  }
}
