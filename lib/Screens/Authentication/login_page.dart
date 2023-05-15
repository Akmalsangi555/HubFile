
import 'signUp_page.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ForgetPassword/forgot_password_page.dart';
import 'package:hub_file_flutter/utils/colors.dart';
import 'package:hub_file_flutter/utils/api_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hub_file_flutter/Widgets/round_button.dart';
import 'package:hub_file_flutter/Widgets/toast_message.dart';
import 'package:hub_file_flutter/Models/user_login_model.dart';
import 'package:hub_file_flutter/Screens/HomePage/home_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:hub_file_flutter/Widgets/address_text_form_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool isDesktop(BuildContext context)=>MediaQuery.of(context).size.width >=630;
  bool isMobile(BuildContext context)=> MediaQuery.of(context).size.width < 630;

  final GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();
  UserLoginModel userLoginModelObject = UserLoginModel();

  var loginEmailController = TextEditingController();
  var loginPasswordController = TextEditingController();


  loginUserWidget() async {
    // try {
    String apiUrl = signInApiUrl;
    print("apiUrl: $apiUrl");
    print("userEmail: ${loginEmailController.text}");
    print("userPassword: ${loginPasswordController.text}");
    final response = await http.post(Uri.parse(apiUrl),
        headers: {
          'Accept': 'application/json'
        },
        body: {
          'email': loginEmailController.text.trim(),
          'password': loginPasswordController.text.trim(),
        });
    final responseString = response.body;
    print("responseSignInApi: $responseString");

    print("status Code SignIn: ${response.statusCode}");
    print("in 200 signIn");
    if (response.statusCode == 200) {
      userLoginModelObject = userLoginModelFromJson(responseString);
      setState(() {});
      print('signInModel status: ${userLoginModelObject.status}');
    }
    // } catch (e) {
    //   print('singUp error in catch = ${e.toString()}');
    //   return null;
    // }
  }

  bool checkBoxValue = false;
  bool progress = false;
  @override
  Widget build(BuildContext context) {
    if(isDesktop(context)){
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ModalProgressHUD(
            inAsyncCall: progress,
            opacity: 0.02,
            blur: 0.5,
            color: Colors.transparent,
            progressIndicator: CircularProgressIndicator(
              color: kBlueLight,
            ),
            child: Padding(
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
                              decoration: BoxDecoration(),
                            ),

                            Image.asset('assets/login_images/login_bg.png',
                              height: MediaQuery.of(context).size.height,
                              width: Get.width,
                              fit: BoxFit.fill,
                            ),

                            Positioned(
                              left: 1,
                              right: 1,
                              top: Get.height*0.12,
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
                                    padding: EdgeInsets.symmetric(horizontal: Get.width*0.02, vertical: Get.height*0.05),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Login', style: TextStyle(fontSize: 25,
                                            color: kBlue, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: Get.height * 0.04),
                                        Form(
                                          key: logInFormKey,
                                          child: Column(
                                            children: [
                                              WebAddressTextFormField().getCustomEditTextArea(
                                                labelValue: 'Email/Username',
                                                controller: loginEmailController,
                                                validation: true,
                                                keyboardType: TextInputType.text,
                                              ),
                                              SizedBox(height: Get.height * 0.0),
                                              WebAddressTextFormField().getCustomEditTextArea(
                                                labelValue: 'Password',
                                                controller: loginPasswordController,
                                                validation: true,
                                                keyboardType: TextInputType.text,
                                              ),
                                            ],
                                          ),

                                        ),

                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: <Widget>[
                                                Theme(
                                                  data: ThemeData(
                                                      unselectedWidgetColor: Color(0xff9AC2F7)),
                                                  child: Checkbox(
                                                    materialTapTargetSize:
                                                    MaterialTapTargetSize.shrinkWrap,
                                                    activeColor: Colors.grey,
                                                    checkColor: kBlue,
                                                    value: checkBoxValue,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        checkBoxValue = value!;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Text(
                                                  'Remember me',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.grey, fontSize: 12),
                                                ), //Text
                                              ], //<Widget>[]
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20),
                                              child: Text(
                                                'Forgot your password?',
                                                style:
                                                TextStyle(color: Color(0xff9AC2F7), fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: Get.height * 0.02),
                                        WebRoundButton(
                                          title: "Login",
                                          width: Get.width,
                                          onPressed: () async {
                                            print('loginEmailController ${loginEmailController.text}');
                                            print('loginPasswordController ${loginPasswordController.text}');

                                            if(logInFormKey.currentState!.validate()){
                                              if (loginEmailController.text.isEmpty) {
                                                toastFailedMessage('email cannot be empty', Colors.red);
                                              } else if (loginPasswordController.text.isEmpty) {
                                                toastFailedMessage('password cannot be empty', Colors.red);
                                              }
                                              else{
                                                setState(() {
                                                  progress = true;
                                                });
                                                await loginUserWidget();
                                                if (userLoginModelObject.status == "success") {
                                                  print("LogIn Success");
                                                  SharedPreferences sharedPref = await SharedPreferences.getInstance();
                                                  await sharedPref.setString('user_id', "${userLoginModelObject.user?.id.toString()}");
                                                  await sharedPref.setString('user_token', "${userLoginModelObject.authorisation!.token}");
                                                  print("userId in sharedPref: ${userLoginModelObject.user?.id.toString()}");
                                                  print("userToken in sharedPref: ${userLoginModelObject.authorisation!.token}");

                                                  Future.delayed(Duration(seconds: 3), () {
                                                    toastSuccessMessage("${userLoginModelObject.status}", Colors.green);

                                                    Navigator.pushReplacement(context,
                                                        MaterialPageRoute(builder: (context) => HomePage(
                                                          userName: userLoginModelObject.user?.name,
                                                        )));
                                                    setState(() {
                                                      progress = false;
                                                    });
                                                    print("false: $progress");
                                                  });
                                                }
                                                if (userLoginModelObject.status != "success") {
                                                  setState(() {
                                                    progress = false;
                                                  });
                                                  print("false: $progress");
                                                  print("LoginErrorMessage: ${userLoginModelObject.status}");
                                                  print("LoginErrorMessage: ${userLoginModelObject.message}");
                                                  toastFailedMessage("${userLoginModelObject.status}", Colors.red);
                                                }
                                              }
                                            }

                                            // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

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
                                              text: 'Not a Member ',
                                              style: TextStyle(fontSize: 12, color: Colors.grey.shade300),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Sign up?', style: TextStyle(fontWeight: FontWeight.bold,
                                                    fontSize: 12, color: kRed),
                                                  recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(
                                                      context, MaterialPageRoute(builder: (context) => SignUpPage())),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
        ),
      );
    }
    else{
      return SafeArea(
          child: Scaffold(
            backgroundColor: kWhite,
            body: ModalProgressHUD(
              inAsyncCall: progress,
              opacity: 0.02,
              blur: 0.5,
              color: Colors.transparent,
              progressIndicator: CircularProgressIndicator(
                color: kBlueLight,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height * 0.05),
                      Text('Login', style: TextStyle(
                          fontSize: 25, color: kBlue, fontWeight: FontWeight.bold)),
                      SizedBox(height: Get.height * 0.04),
                      Form(
                        key: logInFormKey,
                        child: Column(
                          children: [
                            AddressTextFormField().getCustomEditTextArea(
                              labelValue: 'Email / Username',
                              validation: true,
                              controller: loginEmailController,
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(height: Get.height * 0.0),
                            AddressTextFormField().getCustomEditTextArea(

                              labelValue: 'Password',
                              validation: true,
                              controller: loginPasswordController,
                              keyboardType: TextInputType.text,
                            ),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Theme(
                                data: ThemeData(unselectedWidgetColor: kBlue),
                                child: Checkbox(
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  activeColor: Colors.grey,
                                  checkColor: kBlue,
                                  value: checkBoxValue,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkBoxValue = value!;
                                    });
                                  },
                                ),
                              ),
                              Text('Remember me', textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.grey, fontSize: 10),
                              ), //Text
                            ], //<Widget>[]
                          ),
                          // SizedBox(width: Get.width * 0.15),
                          GestureDetector(
                            onTap: (){
                              print('clicked...');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text('Forgot Password?', style: TextStyle(
                                  color: kBlue, fontSize: 12),),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.02),

                      RoundButton(
                        title: "Login",
                        width: Get.width,
                        onPressed: () async {
                          print('loginEmailController ${loginEmailController.text}');
                          print('loginPasswordController ${loginPasswordController.text}');

                          if(logInFormKey.currentState!.validate()){
                            if (loginEmailController.text.isEmpty) {
                              toastFailedMessage('email cannot be empty', Colors.red);
                            }
                            else if (loginPasswordController.text.isEmpty) {
                              toastFailedMessage('password cannot be empty', Colors.red);
                            }
                            else{
                              setState(() {
                                progress = true;
                              });
                              await loginUserWidget();
                              if (userLoginModelObject.status == "success") {
                                print("LogIn Success");
                                SharedPreferences sharedPref = await SharedPreferences.getInstance();
                                await sharedPref.setString('user_id', "${userLoginModelObject.user?.id.toString()}");
                                await sharedPref.setString('user_token', "${userLoginModelObject.authorisation!.token}");
                                print("userId in sharedPref: ${userLoginModelObject.user?.id.toString()}");
                                print("userToken in sharedPref: ${userLoginModelObject.authorisation!.token}");

                                Future.delayed(Duration(seconds: 3), () {
                                  toastSuccessMessage("${userLoginModelObject.status}", Colors.green);

                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) => HomePage(
                                        userName: userLoginModelObject.user?.name,
                                      )));
                                  setState(() {
                                    progress = false;
                                  });
                                  print("false: $progress");
                                });
                              }
                              if (userLoginModelObject.status != "success") {
                                setState(() {
                                  progress = false;
                                });
                                print("LoginMessage: loginError");

                                print("LoginErrorMessage: ${userLoginModelObject.status}");
                                print("LoginErrorMessage: ${userLoginModelObject.message}");
                                toastFailedMessage("${userLoginModelObject.status}", Colors.red);
                              }
                            }
                          }

                          // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
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
                              child: Text("Third-Party", style: TextStyle(color: Colors.grey.shade300, fontSize: 12),),
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
                      SizedBox(height: Get.height * 0.25),

                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Not a Member ',
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade300),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign up?', style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 12, color: kBlue),
                                recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => SignUpPage())),
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
          )
      );
    }

  }
}
