import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hub_file_flutter/utils/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:hub_file_flutter/Widgets/round_button.dart';
import 'package:hub_file_flutter/Models/user_login_model.dart';
import 'package:hub_file_flutter/Screens/Authentication/login_page.dart';

class ForgotPassViaPhone extends StatefulWidget {
  ForgotPassViaPhone({Key? key}) : super(key: key);

  @override
  State<ForgotPassViaPhone> createState() => _ForgotPassViaPhoneState();
}

class _ForgotPassViaPhoneState extends State<ForgotPassViaPhone> {

  bool isDesktop(BuildContext context)=>MediaQuery.of(context).size.width >=630;
  bool isMobile(BuildContext context)=> MediaQuery.of(context).size.width < 630;

  final GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();
  UserLoginModel userLoginModelObject = UserLoginModel();

  var loginEmailController = TextEditingController();
  var loginPasswordController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;
  var textEditingController = TextEditingController();
  String currentText = "";

  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    if(isDesktop(context)){
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width* 0.07),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.05),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Image.asset('assets/profile_images/back_button.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 05),
                        child: Text('Forgot Password', style: TextStyle(
                            fontSize: 25, color: kBlue, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.04),

                  Row(
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/welcome_images/business_woman.png',
                              height: 80, width: 80, fit: BoxFit.fill),
                          Positioned(
                            top: 0,
                            left: 03,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: kBlue,
                                  borderRadius: BorderRadius.circular(
                                      50)),
                              child: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Center(
                                  child: Text('1', style: TextStyle(
                                      fontWeight: FontWeight.bold, color: kWhite)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Get.width* 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text('Julie Clary',
                                  maxLines: 2, style: TextStyle(
                                      fontSize: 14, color: Colors.grey.shade300,
                                      fontWeight: FontWeight.w700)),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Center(
                              child: Text('#Musiclover #traveller #businessman',
                                  maxLines: 5, style: TextStyle(
                                      fontSize: 08, color: Colors.grey.shade200)),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            Row(
                              children: [
                                myWidget('10', 'Posts'),
                                SizedBox(width: Get.width * 0.05),
                                Container(
                                  height: 30.0,
                                  width: 2.0,
                                  color: Colors.grey.shade300,
                                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                                ),
                                SizedBox(width: Get.width * 0.05),
                                myWidget('231', 'Followers'),
                                SizedBox(width: Get.width * 0.05),
                                Container(
                                  height: 30.0,
                                  width: 2.0,
                                  color: Colors.grey.shade300,
                                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                                ),
                                SizedBox(width: Get.width * 0.05),
                                myWidget('100', 'CollabsPage'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.04),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width* 0.0),
                    child: Text(
                        'Lorem ipsum is simply dummy text of the printing and typesetting industry, Lorem Ipsum has been the industr\'s standard dummy text ever since the 1500s',
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                        maxLines: 15),
                  ),
                  SizedBox(height: Get.height * 0.04),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                      child: PinCodeTextField(
                        appContext: context,
                        textStyle: TextStyle(color: kBlue),
                        pastedTextStyle: TextStyle(
                            color: kBlue, fontWeight: FontWeight.bold),
                        length: 4,
                        hintStyle: TextStyle(color: textLabelColor),
                        hintCharacter: "",
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 3) {
                            return "Please Input OTP";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(05),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          inactiveFillColor: Colors.red,
                          selectedFillColor: Colors.purple,
                          activeFillColor: kGrey,
                          activeColor: kBlueLight,
                          selectedColor: kBlueLight,
                          inactiveColor: Colors.grey.shade300,
                        ),
                        cursorColor: Colors.grey,
                        animationDuration: Duration(milliseconds: 300),
                        enableActiveFill: false,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),

                  SizedBox(height: Get.height * 0.02),
                  RoundButton(
                    title: "Reset Password",
                    height: Get.height* 0.06,
                    width: Get.width,
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    buttonColor: kBlue,

                  ),

                  SizedBox(height: Get.height * 0.4),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Back to ',
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade300),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Login?', style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 12, color: kBlue),
                            recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(
                                context, MaterialPageRoute(builder: (context) => LoginPage())),
                          ),
                        ],
                      ),
                    ),
                  )


                ],
              ),
            ),
          ),
        ),
      );
    }
    else{
      return SafeArea(
          child: Scaffold(
            backgroundColor: kWhite,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width* 0.07),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.05),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset('assets/profile_images/back_button.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 05),
                          child: Text('Forgot Password', style: TextStyle(
                              fontSize: 25, color: kBlue, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.04),

                    Row(
                      children: [
                        Stack(
                          children: [
                            Image.asset('assets/welcome_images/business_woman.png',
                                height: 80, width: 80, fit: BoxFit.fill),
                            Positioned(
                              top: 0,
                              left: 03,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: kBlue,
                                    borderRadius: BorderRadius.circular(
                                        50)),
                                child: Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Center(
                                    child: Text('1', style: TextStyle(
                                        fontWeight: FontWeight.bold, color: kWhite)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Get.width* 0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text('Julie Clary',
                                    maxLines: 2, style: TextStyle(
                                        fontSize: 14, color: Colors.grey.shade300,
                                        fontWeight: FontWeight.w700)),
                              ),
                              SizedBox(height: Get.height * 0.01),
                              Center(
                                child: Text('#Musiclover #traveller #businessman',
                                    maxLines: 5, style: TextStyle(
                                        fontSize: 08, color: Colors.grey.shade200)),
                              ),
                              SizedBox(height: Get.height * 0.01),
                              Row(
                                children: [
                                  myWidget('10', 'Posts'),
                                  SizedBox(width: Get.width * 0.05),
                                  Container(
                                    height: 30.0,
                                    width: 2.0,
                                    color: Colors.grey.shade300,
                                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                                  ),
                                  SizedBox(width: Get.width * 0.05),
                                  myWidget('231', 'Followers'),
                                  SizedBox(width: Get.width * 0.05),
                                  Container(
                                    height: 30.0,
                                    width: 2.0,
                                    color: Colors.grey.shade300,
                                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                                  ),
                                  SizedBox(width: Get.width * 0.05),
                                  myWidget('100', 'CollabsPage'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.04),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width* 0.0),
                      child: Text(
                        'Lorem ipsum is simply dummy text of the printing and typesetting industry, Lorem Ipsum has been the industr\'s standard dummy text ever since the 1500s',
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                        maxLines: 15),
                    ),
                    SizedBox(height: Get.height * 0.04),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                        child: PinCodeTextField(
                          appContext: context,
                          textStyle: TextStyle(color: kBlue),
                          pastedTextStyle: TextStyle(
                              color: kBlue, fontWeight: FontWeight.bold),
                          length: 4,
                          hintStyle: TextStyle(color: textLabelColor),
                          hintCharacter: "",
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 3) {
                              return "Please Input OTP";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(05),
                            fieldHeight: 50,
                            fieldWidth: 50,
                            inactiveFillColor: Colors.red,
                            selectedFillColor: Colors.purple,
                            activeFillColor: kGrey,
                            activeColor: kBlueLight,
                            selectedColor: kBlueLight,
                            inactiveColor: Colors.grey.shade300,
                          ),
                          cursorColor: Colors.grey,
                          animationDuration: Duration(milliseconds: 300),
                          enableActiveFill: false,
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          keyboardType: TextInputType.number,
                          onCompleted: (v) {
                            debugPrint("Completed");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            debugPrint(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),

                    SizedBox(height: Get.height * 0.02),
                    RoundButton(
                      title: "Reset Password",
                      height: Get.height* 0.06,
                      width: Get.width,
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      buttonColor: kBlue,

                    ),

                    SizedBox(height: Get.height * 0.4),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Back to ',
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade300),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Login?', style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 12, color: kBlue),
                              recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => LoginPage())),
                            ),
                          ],
                        ),
                      ),
                    )


                  ],
                ),
              ),
            ),
          )
      );
    }

  }

  myWidget(text1, text2) {
    return Column(
      children: [
        Text(text1, style: TextStyle(fontSize: 12,
            color: kBlack, fontWeight: FontWeight.bold)),
        SizedBox(height: Get.height * 0.01),
        Text(text2, style: TextStyle(fontSize: 08, color: kGrey)),
      ],
    );
  }
}
