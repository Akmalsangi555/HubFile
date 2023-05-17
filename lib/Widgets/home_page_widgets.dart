
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hub_file_flutter/utils/colors.dart';

drawerIconWidget(image){
  return Container(
    height: 30, width: 30,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.02),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(image, height: 30, width: 30, fit: BoxFit.fill),
    ),
  );
}

notificationIconWidget(image){
  return Container(
    height: 30, width: 30,
    decoration: BoxDecoration(
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Image.asset(image, height: 25, width: 25),
    ),
  );
}

onLineImageWidget(image, image2){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
    child: Stack(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(image),
        ),
        Positioned(
            bottom: 0, right: 02,
            child: Image.asset(image2, height: 10, width: 10,)),
      ],
    ),
  );
}

activityRequestWidget(image1, requestText){
  return Row(
    children: [
      Stack(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(image1),
          ),
          Positioned(
              top: 0, left: 02,
              child: Image.asset('assets/home_images/ellipse_icon.png', height: 10, width: 10,)),
        ],
      ),
      SizedBox(width: 10),
      Container(
          color: Colors.transparent,
          width: Get.width * 0.115,
          child: Text(requestText, maxLines: 2,
            style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
          )
      ),
      SizedBox(width: 05),
      Container(
        height: Get.height* 0.03,
        decoration: BoxDecoration(
            color: kBlueLight,
            borderRadius: BorderRadius.circular(05)
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(child: Text('Accept', style: TextStyle(color: kWhite, fontSize: 09))),
        ),
      ),
      SizedBox(width: 05),
      Container(
        height: Get.height* 0.03,
        decoration: BoxDecoration(
            color: Colors.red.shade500,
            borderRadius: BorderRadius.circular(05)
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(child: Text('Remove', style: TextStyle(color: kWhite, fontSize: 09))),
        ),
      ),
    ],
  );
}