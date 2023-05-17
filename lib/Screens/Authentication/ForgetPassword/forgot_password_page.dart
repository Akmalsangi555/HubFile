import 'package:get/get.dart';
import 'forgot_password_step2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hub_file_flutter/utils/colors.dart';
import 'package:hub_file_flutter/Widgets/round_button.dart';
import 'package:hub_file_flutter/Models/user_login_model.dart';
import 'package:hub_file_flutter/Widgets/address_text_form_field.dart';
import 'package:hub_file_flutter/Screens/Authentication/login_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  bool isDesktop(BuildContext context)=>MediaQuery.of(context).size.width >=630;
  bool isMobile(BuildContext context)=> MediaQuery.of(context).size.width < 630;

  final GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();
  UserLoginModel userLoginModelObject = UserLoginModel();

  var loginEmailController = TextEditingController();
  var loginPasswordController = TextEditingController();

  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    if(isDesktop(context)){
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
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
                            fontSize: 20, color: kBlue, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.04),
                  AddressTextFormField().getCustomEditTextArea(
                    labelValue: 'Email / Username',
                    validation: true,
                    controller: loginEmailController,
                    keyboardType: TextInputType.text,
                  ),

                  RoundButton(
                    title: "Reset Password",
                    height: Get.height* 0.06,
                    width: Get.width,
                    buttonColor: kBlue,
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordStep2()));
                    },
                  ),

                  SizedBox(height: Get.height * 0.6),
                  // Spacer(),
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
              padding: EdgeInsets.symmetric(horizontal: 30),
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
                              fontSize: 20, color: kBlue, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.04),
                    AddressTextFormField().getCustomEditTextArea(
                      labelValue: 'Email / Username',
                      validation: true,
                      controller: loginEmailController,
                      keyboardType: TextInputType.text,
                    ),

                    RoundButton(
                      title: "Reset Password",
                      height: Get.height* 0.06,
                      width: Get.width,
                      buttonColor: kBlue,
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordStep2()));
                      },
                    ),

                    SizedBox(height: Get.height * 0.6),
                    // Spacer(),
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
}
