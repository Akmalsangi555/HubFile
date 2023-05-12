
import 'login_page.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hub_file_flutter/utils/colors.dart';
import 'package:hub_file_flutter/utils/api_urls.dart';
import 'package:hub_file_flutter/Widgets/round_button.dart';
import 'package:hub_file_flutter/Widgets/toast_message.dart';
import 'package:hub_file_flutter/Models/user_register_model.dart';
import 'package:hub_file_flutter/Widgets/address_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool isDesktop(BuildContext context)=>MediaQuery.of(context).size.width >=630;
  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <630;

  bool checkBoxValue = false;

  final GlobalKey<FormState> singUpFormKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  UserRegisterModel signUpModel = UserRegisterModel();
  registerUser() async {
    // try {
    String apiUrl = signUpApiUrl;
    print("apiUrl: $apiUrl");
    print("userName: ${nameController.text}");
    print("userEmail: ${emailController.text}");
    print("userPassword: ${passwordController.text}");
    final response = await http.post(Uri.parse(apiUrl),
        headers: {
          'Accept': 'application/json'
        },
        body: {
          'name': nameController.text.trim(),
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
        });
    final responseString = response.body;
    print("responseSignUpApi: $responseString");

    print("status Code SignUp: ${response.statusCode}");
    print("in 200 signUp");
    if (response.statusCode == 200) {
      signUpModel = userRegisterModelFromJson(responseString);
      setState(() {});
      print('signUpModel status: ${signUpModel.status}');
    }
    // } catch (e) {
    //   print('singUp error in catch = ${e.toString()}');
    //   return null;
    // }
  }

  @override
  Widget build(BuildContext context) {
    if(isDesktop(context)){
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/img.png',
                        height: 70,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Text('Frame your social space in the hubfile',
                        maxLines: 5, style: TextStyle(fontSize: 30,
                            color: kBlack, fontWeight: FontWeight.bold)),
                      SizedBox(height: Get.height * 0.005),
                      Text(
                        'Lorem ipsum is simply dummy text of the printing and typesetting industry, Lorem Ipsum has been the industr\'s standard dummy text ever since the 1500s',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        maxLines: 15,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: Get.width * 0.05),
                Expanded(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: Get.width * 0.5,
                            decoration: BoxDecoration(
                            ),
                          ),

                          Image.asset('assets/login_images/login_bg.png',
                            height: MediaQuery.of(context).size.height,
                            width: Get.width,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            left: 1,
                            right: 1,
                            top: Get.height*0.1,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: Get.width*0.01),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                shadowColor: Colors.black,
                                elevation: 01,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: Get.width*0.02,vertical: Get.height*0.05),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('SignUp', style: TextStyle(fontSize: 25,
                                          color: kBlue, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: Get.height * 0.04),
                                      Form(
                                        key: singUpFormKey,
                                        child: Column(
                                          children: [
                                            WebAddressTextFormField().getCustomEditTextArea(
                                              // hintValue: "Street address line 1",
                                              labelValue: 'Username',
                                              validation: true,
                                              keyboardType: TextInputType.text,
                                            ),
                                            WebAddressTextFormField().getCustomEditTextArea(
                                                labelValue: 'Email',
                                                validation: true,
                                                keyboardType: TextInputType.text),

                                            WebAddressTextFormField().getCustomEditTextArea(
                                                labelValue: '+1 | Phone number',
                                                validation: true,
                                                keyboardType: TextInputType.text),
                                            WebAddressTextFormField().getCustomEditTextArea(
                                              labelValue: 'Password',
                                              validation: true,
                                              keyboardType: TextInputType.text,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: Get.height * 0.02),
                                      WebRoundButton(
                                        title: "Create New Account",
                                        width: Get.width,
                                        onPressed: () async {
                                          if(singUpFormKey.currentState!.validate()){
                                            if (nameController.text.isEmpty) {
                                              toastFailedMessage('name cannot be empty', kRed);
                                            } else if (emailController.text.isEmpty) {
                                              toastFailedMessage('email cannot be empty', kRed);
                                            } else if (passwordController.text.isEmpty) {
                                              toastFailedMessage('password cannot be empty', kRed);
                                            } else if (passwordController.text.length < 6) {
                                              toastFailedMessage('password must be of 6 digit', kRed);
                                            } else {
                                              await registerUser();

                                              if(signUpModel.status == "success"){
                                                Future.delayed(Duration(seconds: 3), () {
                                                  toastSuccessMessage("success", colorGreen);
                                                  toastOTPMessage("${signUpModel.message}", colorGreen);
                                                  // Navigator.push(context, MaterialPageRoute(
                                                  //     builder: (context) => LoginPage()));
                                                });
                                              }
                                              if(signUpModel.status != "success"){
                                                toastFailedMessage(signUpModel.message, kRed);
                                              }
                                            }
                                          }
                                        },
                                        buttonColor: kBlue,
                                      ),
                                      SizedBox(height: Get.height * 0.04),
                                      Row(children: <Widget>[
                                        Expanded(child: Divider()),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          child: Text("Third-Party", style: TextStyle(color: Colors.grey.shade300, fontSize: 12),),
                                        ),
                                        Expanded(child: Divider()),
                                      ]),
                                      SizedBox(height: Get.height * 0.03),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset('assets/login_images/facebook_icon.png',
                                              height: 30, width: 30, fit: BoxFit.fill, color: Color(0xff9AC2F7)),
                                          Image.asset('assets/login_images/google_icon.png',
                                              height: 30, width: 30, fit: BoxFit.fill, color: Color(0xff9AC2F7)
                                          ),
                                          Image.asset('assets/login_images/apple_icon.png',
                                              height: 30, width: 30, fit: BoxFit.fill, color: Color(0xff9AC2F7)
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: Get.height * 0.03),
                                      Center(
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Already a Member ',
                                            style: TextStyle(
                                                fontSize: 12, color: Colors.grey.shade300),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'Login',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12, color: kRed),
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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
                    Text('Sign Up', style: TextStyle(
                        fontSize: 25, color: kBlue, fontWeight: FontWeight.bold),),
                    SizedBox(height: Get.height * 0.04),
                    AddressTextFormField().getCustomEditTextArea(
                      // hintValue: "Street address line 1",
                      labelValue: 'Username',
                      validation: true,
                      // autoFocus: true,
                      // textController: address1ControllerBilling,
                      keyboardType: TextInputType.text,
                    ),

                    SizedBox(height: Get.height * 0.0),
                    AddressTextFormField().getCustomEditTextArea(
                      // hintValue: "Street address line 1",
                      labelValue: 'Email',
                      validation: true,
                      // autoFocus: true,
                      // textController: address1ControllerBilling,
                      keyboardType: TextInputType.text,
                    ),
                    AddressTextFormField().getCustomEditTextArea(
                      // hintValue: "Street address line 1",
                      labelValue: '+1  |  Phone number',
                      validation: true,
                      // autoFocus: true,
                      // textController: address1ControllerBilling,
                      keyboardType: TextInputType.text,
                    ),
                    AddressTextFormField().getCustomEditTextArea(
                      // hintValue: "Street address line 1",
                      labelValue: 'Password',
                      validation: true,
                      // autoFocus: true,
                      // textController: address1ControllerBilling,
                      keyboardType: TextInputType.text,
                    ),

                    SizedBox(height: Get.height * 0.02),

                    RoundButton(
                      title: "Create New Account",
                      width: Get.width,
                      onPressed: () {  },
                      buttonColor: kBlue,

                    ),
                    SizedBox(height: Get.height * 0.05),

                    Row(
                        children: <Widget>[
                          Expanded(
                              child: Divider()
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Third-Party", style: TextStyle(color: Colors.grey.shade300, fontSize: 12)),
                          ),

                          Expanded(
                              child: Divider()
                          ),
                        ]
                    ),

                    SizedBox(height: Get.height * 0.05),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/login_images/facebook_icon.png',
                          height: 30, width: 30, fit: BoxFit.fill,
                        ),
                        Image.asset('assets/login_images/google_icon.png',
                          height: 30, width: 30, fit: BoxFit.fill,
                        ),
                        Image.asset('assets/login_images/apple_icon.png',
                          height: 30, width: 30, fit: BoxFit.fill,
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.15),

                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Already a Member ',
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade300),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Login?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: kBlue),
                              recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => LoginPage())),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )
      );
    }

  }
}
