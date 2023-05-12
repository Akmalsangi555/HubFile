
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hub_file_flutter/utils/colors.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    super.initState();
    // splashNavigator();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:90, top: 0),
              child: Container(
                decoration: BoxDecoration(
                  // color: kBlue,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Image.asset('assets/welcome_images/rectangle_container.png',
                  fit: BoxFit.fill,
                  width: Get.width,
                ),
                height: Get.height* 0.1,
                width: Get.width* 0.6,
              ),
            ),
            SizedBox(height: Get.height *0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.asset('assets/welcome_images/business_woman.svg'),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: Image.asset('assets/welcome_images/business_woman.png',
                      fit: BoxFit.fill,
                      height: 35, width: 45).image,
                ),
                SizedBox(width: Get.width *0.02),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: Get.height* 0.15,
                  width: Get.width* 0.6,
                  child: Image.asset('assets/welcome_images/fun_together.png',
                    fit: BoxFit.fill,
                    width: Get.width,
                  ),
                ),

              ],
            ),
            SizedBox(height: Get.height *0.02),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          // color: kBlue,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      height: Get.height* 0.14,
                      width: Get.width* 0.6,
                      child: Image.asset('assets/welcome_images/young_smiling_man.png',
                        fit: BoxFit.fill,
                        width: Get.width,

                      ),
                    ),
                    SizedBox(height: Get.height *0.02),
                    Container(
                      decoration: BoxDecoration(
                          // color: kBlue,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Image.asset('assets/welcome_images/rectangle_container.png',
                        fit: BoxFit.fill,
                        width: Get.width,
                      ),
                      height: Get.height* 0.1,
                      width: Get.width* 0.6,
                    ),
                  ],
                ),
                SizedBox(width: Get.width *0.02),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          // color: kBlue,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      height: Get.height* 0.25,
                      width: Get.width* 0.3,
                      child: Image.asset('assets/welcome_images/smiling-handsome-man.png',
                        fit: BoxFit.fill,
                        width: Get.width,

                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: Get.height *0.02),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('hub', style: TextStyle(fontSize: 35, color: kBlue, fontWeight: FontWeight.bold)),
                Text('file', style: TextStyle(fontSize: 25, color: kBlue),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  splashNavigator() {
    Timer(Duration(seconds: 3), () {
      // sharedPrefs();
      // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }
}
