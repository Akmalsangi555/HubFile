
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hub_file_flutter/utils/colors.dart';
import 'package:hub_file_flutter/utils/api_urls.dart';
import 'package:hub_file_flutter/Models/user_logout_model.dart';
import 'package:hub_file_flutter/Widgets/custom_radio_widget.dart';
import 'package:hub_file_flutter/Screens/Profile/profile_page.dart';
import 'package:hub_file_flutter/Screens/Splash/splash_screen.dart';
import 'package:hub_file_flutter/Screens/Drawer/collapsable_drawer.dart';
import 'package:hub_file_flutter/Screens/Authentication/login_page.dart';

class HomePage extends StatefulWidget {
  final String? userName;
  HomePage({Key? key, this.userName}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isDesktop(BuildContext context)=>MediaQuery.of(context).size.width >=630;
  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <630;
  List<RadioModel> sampleData = <RadioModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('userNam123 ${widget.userName}');
  }

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      print('currentIndex $_currentIndex');
    });
  }

  void _showPopupMenu(BuildContext context, Offset position) async {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    await showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(position, position),
        Offset.zero & overlay.size,
      ),
      items: <PopupMenuEntry>[
        PopupMenuItem(
          child: GestureDetector(
              onTap: (){
                print('PopupMenuItem');
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: Text('Profile')),
          value: 1,
        ),
        PopupMenuItem(
          child: Text('Settings'),
          value: 2,
        ),
        PopupMenuItem(
          child: Text('U - Wallet'),
          value: 3,
        ),
        PopupMenuItem(
          child: Text('Ads'),
          value: 4,
        ),
        PopupMenuItem(
          child: Text('Help'),
          value: 5,
        ),
        PopupMenuItem(
          child: Text('Switch Account'),
          value: 6,
        ),
        PopupMenuItem(
          child: GestureDetector(
              onTap: (){
                print('PopupMenuItem');
                showLogoutAlertDialog(context);
              },
              child: Text('Logout')),
          value: 7,
        ),
      ],
      elevation: 8.0,
    );
  }

  showLogoutAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
      child: Text('Cancel'),
    );
    Widget continueButton = TextButton(
      child: Text('Yes, Continue'),
      onPressed: () {
        logOutWidget();
        setState(() {});
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => LoginPage()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Sign Out"),
      content: Text("Are you sure you want to Sign Out ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bool isVisible = false;

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  UserLogOutModel userLogOutModelObject = UserLogOutModel();
  logOutWidget() async {
    // try {
    String apiUrl = signOutApiUrl;
    print("signOutApiUrl: $apiUrl");
    print("userToken: $userToken");
    final response = await http.post(Uri.parse(apiUrl),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
        body: {
          'status': 'success',
          'message': 'Successfully logged out',
        });
    final responseString = response.body;
    print("responseSignOutApi: $responseString");

    print("status Code SignOut: ${response.statusCode}");
    print("in 200 signOut");
    if (response.statusCode == 200) {
      userLogOutModelObject = userLogOutModelFromJson(responseString);
      print('userLogoutMessage ${userLogOutModelObject.message}');
      setState(() {});
    }
    // } catch (e) {
    //   print('singUp error in catch = ${e.toString()}');
    //   return null;
    // }
  }

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return SafeArea(
        child: Scaffold(
          drawer: CollapsibleDrawer(),
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.02),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.menu, color: kBlue),
                          SizedBox(width: Get.width * 0.04),
                          Image.asset('assets/images/img.png',
                            height: 35, width: 45),
                          SizedBox(width: Get.width * 0.04),
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: 35,
                                  // width: Get.width,
                                  width: Get.width * 0.65,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: Get.height * 0.02,
                                        left: Get.width * 0.02),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Icon(Icons.search),
                                        ),
                                        suffixIconColor: kBlueLight,
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: Get.width * 0.02),
                                notificationIconWidget('assets/profile_page/notification_Component.png',),
                                SizedBox(width: Get.width * 0.02),
                                GestureDetector(
                                    onTapDown: (TapDownDetails details) {
                                      _showPopupMenu(context, details.globalPosition);
                                    },
                                  // onTap: (){
                                  //     print('PopupMenuExample');
                                  //     showPopupMenu(context);
                                  //     },
                                  child: CircleAvatar(
                                    radius: 17.5,
                                    backgroundImage: AssetImage('assets/welcome_images/business_woman.png'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Get.height * 0.025),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: Get.height * 0.04),
                            child: Column(
                              children: [
                                drawerIconWidget('assets/profile_page/home_Component.png'),
                                SizedBox(height: Get.height * 0.04),
                                drawerIconWidget('assets/profile_page/u_Component.png'),
                                SizedBox(height: Get.height * 0.04),
                                drawerIconWidget('assets/profile_page/save_Component.png'),
                                SizedBox(height: Get.height * 0.04),
                                drawerIconWidget('assets/profile_page/share_Component.png'),
                                SizedBox(height: Get.height * 0.04),
                              ],
                            ),
                          ),
                          SizedBox(width: Get.width * 0.05),
                          // Spacer(),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.03,
                                    vertical: Get.height * 0.05),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Column(
                                      children: [
                                        Container(
                                          width: Get.width * 0.52,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(vertical: Get.height * 0.0, horizontal: Get.width* 0.015),
                                            child: Column(
                                              children: [

                                                SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage: AssetImage('assets/welcome_images/business_woman.png'),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                      child: Container(
                                                        height: 35,
                                                        // width: Get.width * 0.45,
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: Colors.grey.shade100,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(5),
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              bottom: Get.height * 0.02,
                                                              left: Get.width * 0.01),
                                                          child: TextField(
                                                            decoration: InputDecoration(
                                                              hintText: 'Write something',
                                                              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 10),
                                                              suffixIconColor: kBlueLight,
                                                              border: InputBorder.none,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [

                                                      Row(
                                                        children: [
                                                          Visibility(
                                                            visible: isVisible,
                                                            child: Row(
                                                              children: [
                                                                Image.asset('assets/home_page/file_icon.jpeg', height: 25, width: 50, fit: BoxFit.fill),
                                                              ],
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: toggleVisibility,
                                                            child: Row(
                                                              children: [
                                                                SvgPicture.asset('assets/home_page/Group 206.svg', height: 25, width: 50, fit: BoxFit.fill, ),
                                                                SizedBox(width: 10),
                                                                SvgPicture.asset('assets/home_page/Group 205.svg', height: 25, width: 50, fit: BoxFit.fill, ),
                                                                SizedBox(width: 10),
                                                                Image.asset('assets/home_page/location_icon.png', height: 25, width: 50, fit: BoxFit.fill),
                                                                SizedBox(width: 10),
                                                                Image.asset(isVisible ? 'assets/home_page/close_icon.jpeg' : 'assets/home_page/add_icon.png'  , height: 25, width: 50, fit: BoxFit.fill,),
                                                              ],
                                                            ),

                                                            // child: Icon(isVisible ? Icons.close_outlined : Icons.add),
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
                                        SizedBox(height: 20),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: Get.width * 0.52,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(5),
                                                  bottomRight: Radius.circular(5),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: Get.width * 0.02,
                                                    vertical: Get.height * 0.02),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('People Activities',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: kBlue,
                                                          fontWeight: FontWeight.w700),
                                                    ),
                                                    SizedBox(height: Get.height * 0.0),
                                                    ListView.builder(
                                                        shrinkWrap: true,
                                                        physics: NeverScrollableScrollPhysics(),
                                                        itemBuilder: (context, index) =>
                                                            Column(
                                                              children: [
                                                                Container(
                                                                  height: 350,
                                                                  width: double.infinity,
                                                                  decoration: BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image: AssetImage('assets/images/concert_image.jpg', ),
                                                                          fit: BoxFit.fill)),
                                                                  child: Padding(
                                                                    padding: EdgeInsets.only(top: 10,left: Get.width*0.01,right: Get.width*0.01,),
                                                                    child: Row(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        CircleAvatar(
                                                                          radius: 17.5,
                                                                          backgroundImage: AssetImage('assets/welcome_images/business_woman.png'),
                                                                        ),
                                                                        SizedBox(width: Get.width*0.002,),
                                                                        Padding(
                                                                          padding:  EdgeInsets.only(top: 5),
                                                                          child: Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text('Julie', style: TextStyle(
                                                                                  color: Colors.white, fontSize: 12)),
                                                                              Text('123 Street ABC, New York', style: TextStyle(
                                                                                  color: Colors.white, fontSize: 6)),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Spacer(),
                                                                        Padding(
                                                                          padding: EdgeInsets.only(top: 5),
                                                                          child: Icon(Icons.more_vert,color: Colors.white),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(height: 7),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      bottom: 10),
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(Icons.favorite_border, color: Colors.grey.shade300, size: 12),
                                                                      SizedBox(width: Get.width * 0.002),
                                                                      Icon(Icons.favorite_border, color: Colors.grey.shade300, size: 12),
                                                                      SizedBox(width: Get.width * 0.002),
                                                                      Icon(Icons.favorite_border, color: Colors.grey.shade300, size: 12),
                                                                      SizedBox(width: Get.width * 0.002),
                                                                      Spacer(),
                                                                      Text('#Musiclover #traveller #businessman', maxLines: 5, style: TextStyle(
                                                                          fontSize: 10, color: kGrey, fontWeight: FontWeight.normal)),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                        itemCount: 4),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      children: [
                                        Container(
                                          // width: Get.width* 0.33,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Get.width * 0.01,
                                                vertical: Get.height * 0.02),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Activities', style: TextStyle(color: kBlue,
                                                        fontWeight: FontWeight.bold, fontSize: 18)),
                                                  ],
                                                ),
                                                SizedBox(height: Get.height * 0.02),

                                                activityRequestWidget('assets/profile_page/behrouz_sasani.png', 'Request to add you in brainstrom'),
                                                SizedBox(height: Get.height * 0.015),
                                                activityRequestWidget('assets/profile_page/behrouz_sasani.png', 'Request to add you in project'),
                                                SizedBox(height: Get.height * 0.015),
                                                activityRequestWidget('assets/profile_page/behrouz_sasani.png', 'Request to add you in project'),

                                                SizedBox(height: Get.height * 0.05),
                                              ],
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: Get.height * 0.02),
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: 150,
                                                    width: 300,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(20)
                                                    ),
                                                  ),
                                                  Positioned(
                                                      left: 0,
                                                      right: 0,
                                                      top: 0,
                                                      child: Image.asset('assets/home_page/houses_icon.png')
                                                  ),
                                                  Positioned(
                                                    top: 110,
                                                    right: 10,
                                                    child: Stack(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 20,
                                                          backgroundImage: AssetImage('assets/profile_page/behrouz_sasani.png'),
                                                        ),
                                                        Positioned(
                                                            top: 00, left: 02,
                                                            child: Image.asset('assets/home_page/ellipse_icon.png', height: 10, width: 10,)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.asset('assets/home_page/marker_icon.png', height: 10, width: 10,),
                                                        SizedBox(width: Get.width * 0.01),
                                                        Text('123 Street, ABC, New York',
                                                            style: TextStyle(fontSize: 12, color: Colors.grey.shade500)
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: Get.height * 0.02),
                                                    Text('Need Electrician for', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                                    SizedBox(height: Get.height * 0.02),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Spacer(),
                          SizedBox(width: Get.width * 0.05),
                          Padding(
                            padding: EdgeInsets.only(top: Get.height * 0.06),
                            child: Column(
                              children: [
                                onLineImageWidget('assets/profile_page/behrouz_sasani.png', 'assets/profile_page/ellipse.png'),
                                onLineImageWidget('assets/profile_page/ian_dooley.png', 'assets/profile_page/ellipse.png'),
                                onLineImageWidget('assets/profile_page/aiony_haust.png', 'assets/profile_page/ellipse.png'),
                                onLineImageWidget('assets/profile_page/wasim_chouak.png', 'assets/profile_page/ellipse.png'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // CollapsingNavigationDrawer(),
            ],
          ),
        ),
      );
    }
    else {
      return SafeArea(
          child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          // mouseCursor: MouseCursor.uncontrolled,
          onTap: onTabTapped,
          elevation: 0,
          showSelectedLabels: false, // hide labels for selected items
          showUnselectedLabels: false, // hide labels for unselected items
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Image.asset('assets/profile_page/home_Component.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/profile_page/u_Component.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/profile_page/search_component.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/profile_page/profile_component.png'),
              label: '',
            )],
            type: BottomNavigationBarType.fixed
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('hub', style: TextStyle(color: kBlue,
                              fontWeight: FontWeight.bold, fontSize: 20)),
                          Text('file', style: TextStyle(color: kBlue, fontSize: 18)),
                        ],
                      ),

                      Row(
                        children: [

                          notificationIconWidget('assets/profile_page/notification_Component.png',),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Container(
                    // width: Get.width * 0.52,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: Get.height * 0.01, horizontal: Get.width* 0.015),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('assets/welcome_images/business_woman.png'),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  // width: Get.width * 0.45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey.shade100,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: Get.height * 0.02,
                                        left: Get.width * 0.01),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Write something',
                                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14, wordSpacing: 1.5),
                                        suffixIconColor: kBlueLight,
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                                Row(
                                  children: [
                                    Image.asset('assets/home_page/picture_home.png', ),
                                    SizedBox(width: Get.width* 0.05),
                                    Image.asset('assets/home_page/video_camera_home.png'),
                                    SizedBox(width: Get.width* 0.05),
                                    Image.asset('assets/home_page/marker_home.png', ),
                                    SizedBox(width: Get.width* 0.05),
                                    Image.asset('assets/home_page/add_home.png'),
                                   
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('People Activities', style: TextStyle(fontSize: 12,
                              color: kBlue, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Icon(Icons.filter_alt_outlined, color: Colors.grey.shade500, size: 15),
                              Text('Filters', style: TextStyle(
                                      fontSize: 10, color: Colors.grey.shade500)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.02),
                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     physics: NeverScrollableScrollPhysics(),
                      //     itemCount: peopleActivitiesList.length,
                      //     itemBuilder: (context, index) {
                      //       Widget result;
                      //       if(index == 1){
                      //         result = Column(
                      //           children: [
                      //             Row(
                      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Text("#HipHoplover", style: TextStyle(fontSize: 12, color: Colors.grey, fontFamily: 'Gontserrat-Regular')),
                      //                 Icon(Icons.more_vert_outlined, color: Colors.black38),
                      //               ],
                      //             ),
                      //             SizedBox(height: 10),
                      //             Container(
                      //               height: 125,
                      //               child: ListView.builder(
                      //                 scrollDirection: Axis.horizontal,
                      //                   // physics: BouncingScrollPhysics(),
                      //                   itemCount: hipHopUsersList.length,
                      //                   itemBuilder: (context, index) {
                      //                 return Padding(
                      //                   padding: EdgeInsets.only(right: 15),
                      //                   child: Container(
                      //                     height: 120, width: 90,
                      //                     decoration: BoxDecoration(
                      //                       color: Colors.grey.shade100,
                      //                       border: Border.all(
                      //                         color: Colors.grey.shade100,
                      //                         width: 1.0,
                      //                       ),
                      //                       borderRadius: BorderRadius.circular(5),
                      //                     ),
                      //                     child: Padding(
                      //                       padding: const EdgeInsets.symmetric(horizontal: 05, vertical: 07),
                      //                       child: Column(
                      //                         children: [
                      //                           Image.asset(hipHopUsersList[index].userImage, height: 65, width: 65),
                      //                           SizedBox(height: Get.height*0.015),
                      //                           Text(hipHopUsersList[index].userName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                      //                           SizedBox(height: Get.height*0.01),
                      //                           Text(hipHopUsersList[index].userInterest, style: TextStyle(fontSize: 08, color: Colors.grey.shade500),),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 );
                      //               }),
                      //             ),
                      //             SizedBox(height: 20),
                      //           ],
                      //         );
                      //       }else{
                      //         result = Column(
                      //           children: [
                      //             Container(
                      //               height: 200,
                      //               width: double.infinity,
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(05),
                      //                   image: DecorationImage(
                      //                       image: AssetImage(peopleActivitiesList[index].concertImage),
                      //                       fit: BoxFit.cover)),
                      //               child: Padding(
                      //                 padding: EdgeInsets.only(top: 10, left: Get.width*0.01, right: Get.width*0.01),
                      //                 child: Row(
                      //                   crossAxisAlignment: CrossAxisAlignment.start,
                      //                   children: [
                      //                     Stack(
                      //                       children: [
                      //                         CircleAvatar(
                      //                           radius: 17.5,
                      //                           backgroundImage: AssetImage(peopleActivitiesList[index].userImage),
                      //                         ),
                      //                         Positioned(
                      //                           top: 0,
                      //                           left: 01,
                      //                           child: Container(
                      //                             height: 15,
                      //                             width: 15,
                      //                             padding: EdgeInsets.all(02),
                      //                             decoration: BoxDecoration(
                      //                                 color: kBlue,
                      //                                 borderRadius: BorderRadius.circular(50)),
                      //                             child: Text('1', style: TextStyle(color: kWhite, fontSize: 10), textAlign: TextAlign.center),
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                     SizedBox(width: Get.width*0.002),
                      //                     Padding(
                      //                       padding: EdgeInsets.only(top: 5),
                      //                       child: Column(
                      //                         crossAxisAlignment: CrossAxisAlignment.start,
                      //                         children: [
                      //                           Text(peopleActivitiesList[index].userName, style: TextStyle(
                      //                               color: Colors.white, fontSize: 12)),
                      //                           Text(peopleActivitiesList[index].userAddress, style: TextStyle(
                      //                               color: Colors.white, fontSize: 6)),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                     Spacer(),
                      //                     Padding(
                      //                       padding: EdgeInsets.only(top: 5),
                      //                       child: Icon(Icons.more_vert,color: Colors.white),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //             SizedBox(height: 7),
                      //             Padding(
                      //               padding: EdgeInsets.only(
                      //                   bottom: 10),
                      //               child: Row(
                      //                 children: [
                      //                   Icon(Icons.favorite_border, color: Colors.grey.shade300, size: 25),
                      //                   SizedBox(width: Get.width * 0.02),
                      //                   Icon(Icons.messenger_outline, color: Colors.grey.shade300, size: 25),
                      //                   SizedBox(width: Get.width * 0.02),
                      //                   // u_icon
                      //                   Icon(Icons.add, color: Colors.grey.shade300, size: 25),
                      //                   SizedBox(width: Get.width * 0.02),
                      //                   Spacer(),
                      //                   Text('#hiphop #music #lifestyle', maxLines: 5, style: TextStyle(
                      //                       fontSize: 08, color: Colors.black38)),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         );
                      //       }
                      //       return result;
                      //
                      //       // return Column(
                      //       //   children: [
                      //       //     Container(
                      //       //       height: 200,
                      //       //       width: double.infinity,
                      //       //       decoration: BoxDecoration(
                      //       //           image: DecorationImage(
                      //       //               image: AssetImage(peopleActivitiesList[index].concertImage),
                      //       //               fit: BoxFit.cover)),
                      //       //       child: Padding(
                      //       //         padding: EdgeInsets.only(top: 10, left: Get.width*0.01, right: Get.width*0.01,),
                      //       //         child: Row(
                      //       //           crossAxisAlignment: CrossAxisAlignment.start,
                      //       //           children: [
                      //       //             Stack(
                      //       //               children: [
                      //       //                 CircleAvatar(
                      //       //                   radius: 17.5,
                      //       //                   backgroundImage: AssetImage(peopleActivitiesList[index].userImage),
                      //       //                 ),
                      //       //                 Positioned(
                      //       //                   top: 0,
                      //       //                   left: 01,
                      //       //                   child: Container(
                      //       //                     height: 15,
                      //       //                     width: 15,
                      //       //                     padding: EdgeInsets.all(02),
                      //       //                     decoration: BoxDecoration(
                      //       //                         color: kBlue,
                      //       //                         borderRadius: BorderRadius.circular(50)),
                      //       //                     child: Text('1', style: TextStyle(color: kWhite, fontSize: 10), textAlign: TextAlign.center),
                      //       //                   ),
                      //       //                 ),
                      //       //               ],
                      //       //             ),
                      //       //             SizedBox(width: Get.width*0.002),
                      //       //             Padding(
                      //       //               padding: EdgeInsets.only(top: 5),
                      //       //               child: Column(
                      //       //                 crossAxisAlignment: CrossAxisAlignment.start,
                      //       //                 children: [
                      //       //                   Text(peopleActivitiesList[index].userName, style: TextStyle(
                      //       //                       color: Colors.white, fontSize: 12)),
                      //       //                   Text(peopleActivitiesList[index].userAddress, style: TextStyle(
                      //       //                       color: Colors.white, fontSize: 6)),
                      //       //                 ],
                      //       //               ),
                      //       //             ),
                      //       //             Spacer(),
                      //       //             Padding(
                      //       //               padding: EdgeInsets.only(top: 5),
                      //       //               child: Icon(Icons.more_vert,color: Colors.white),
                      //       //             ),
                      //       //           ],
                      //       //         ),
                      //       //       ),
                      //       //     ),
                      //       //     SizedBox(height: 7),
                      //       //     Padding(
                      //       //       padding: EdgeInsets.only(
                      //       //           bottom: 10),
                      //       //       child: Row(
                      //       //         children: [
                      //       //           Icon(Icons.favorite_border, color: Colors.grey.shade300, size: 25),
                      //       //           SizedBox(width: Get.width * 0.02),
                      //       //           Icon(Icons.messenger_outline, color: Colors.grey.shade300, size: 25),
                      //       //           SizedBox(width: Get.width * 0.02),
                      //       //           Icon(Icons.add, color: Colors.grey.shade300, size: 25),
                      //       //           SizedBox(width: Get.width * 0.02),
                      //       //           Spacer(),
                      //       //           Text('#hiphop #music #lifestyle', maxLines: 5, style: TextStyle(
                      //       //               fontSize: 08, color: Colors.black38)),
                      //       //         ],
                      //       //       ),
                      //       //     ),
                      //       //   ],
                      //       // );
                      //
                      //     }),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: peopleActivitiesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 1) {
                            // Return ListView at index 1
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("#HipHoplover", style: TextStyle(fontSize: 12, color: Colors.grey, fontFamily: 'Gontserrat-Regular')),
                                    Icon(Icons.more_vert_outlined, color: Colors.black38),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Container(
                                  height: 125,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      // physics: BouncingScrollPhysics(),
                                      itemCount: hipHopUsersList.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 15),
                                          child: Container(
                                            height: 120, width: 90,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              border: Border.all(
                                                color: Colors.grey.shade100,
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 05, vertical: 07),
                                              child: Column(
                                                children: [
                                                  Image.asset(hipHopUsersList[index].userImage, height: 65, width: 65),
                                                  SizedBox(height: Get.height*0.015),
                                                  Text(hipHopUsersList[index].userName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                                                  SizedBox(height: Get.height*0.01),
                                                  Text(hipHopUsersList[index].userInterest, style: TextStyle(fontSize: 08, color: Colors.grey.shade500),),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                SizedBox(height: 20),
                              ],
                            );
                          } else {
// Return regular list item
                            return Column(
                              children: [
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(05),
                                      image: DecorationImage(
                                          image: AssetImage(peopleActivitiesList[index].concertImage),
                                          fit: BoxFit.cover)),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10, left: Get.width*0.01, right: Get.width*0.01),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: 17.5,
                                              backgroundImage: AssetImage(peopleActivitiesList[index].userImage),
                                            ),
                                            Positioned(
                                              top: 0,
                                              left: 01,
                                              child: Container(
                                                height: 15,
                                                width: 15,
                                                padding: EdgeInsets.all(02),
                                                decoration: BoxDecoration(
                                                    color: kBlue,
                                                    borderRadius: BorderRadius.circular(50)),
                                                child: Text('1', style: TextStyle(color: kWhite, fontSize: 10), textAlign: TextAlign.center),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: Get.width*0.002),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(peopleActivitiesList[index].userName, style: TextStyle(
                                                  color: Colors.white, fontSize: 12)),
                                              Text(peopleActivitiesList[index].userAddress, style: TextStyle(
                                                  color: Colors.white, fontSize: 6)),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Icon(Icons.more_vert,color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.favorite_border, color: Colors.grey.shade300, size: 25),
                                      SizedBox(width: Get.width * 0.02),
                                      Icon(Icons.messenger_outline, color: Colors.grey.shade300, size: 25),
                                      SizedBox(width: Get.width * 0.02),
// u_icon
                                      Icon(Icons.add, color: Colors.grey.shade300, size: 25),
                                      SizedBox(width: Get.width * 0.02),
                                      Spacer(),
                                      Text('#hiphop #music #lifestyle', maxLines: 5, style: TextStyle(
                                          fontSize: 08, color: Colors.black38)),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
    }
  }

  myWidget(text1, text2) {
    return Column(
      children: [
        Text(text1, style: TextStyle(fontSize: 12,
            color: kBlack, fontWeight: FontWeight.bold)),
        SizedBox(height: Get.height * 0.01),
        Text(text2, style: TextStyle(fontSize: 08,
            color: kGrey, fontWeight: FontWeight.normal)),
      ],
    );
  }

  myContainer(text1, IconData iconData, myColor) {
    return Container(
      width: Get.width *0.105,
      height: 30,
      decoration: BoxDecoration(
          color: myColor, borderRadius: BorderRadius.circular(05)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 10),
          SizedBox(width: Get.width * 0.01),
          Text(text1, style: TextStyle(fontSize: 08,
              color: kBlack, fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }
  myContainer2(text1, IconData iconData, myColor) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
          color: myColor, borderRadius: BorderRadius.circular(05)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 10),
          SizedBox(width: Get.width * 0.01),
          Text(text1, style: TextStyle(fontSize: 08,
              color: kBlack, fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }

  imageWidget(IconData iconData) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Icon(iconData, color: kGrey),
    );
  }

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
                child: Image.asset('assets/home_page/ellipse_icon.png', height: 10, width: 10,)),
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
}


List peopleActivitiesList = [
  PeopleActivityClass('assets/images/concert_image.jpg', 'assets/welcome_images/business_woman.png', 'Julie', '123 Street ABC, New York'),
  PeopleActivityClass('assets/images/concert_image.jpg', 'assets/welcome_images/business_woman.png', 'Julie', '124 Street DEF, New York'),
  PeopleActivityClass('assets/images/concert_image.jpg', 'assets/welcome_images/business_woman.png', 'Julie', '125 Street GHI, New York'),
  PeopleActivityClass('assets/images/concert_image.jpg', 'assets/welcome_images/business_woman.png', 'Julie', '126 Street JKL, New York'),

];

class PeopleActivityClass {
  final String concertImage;
  final String userImage;
  final String userName;
  final String userAddress;
  PeopleActivityClass(this.concertImage, this.userImage, this.userName, this.userAddress);
}

List hipHopUsersList = [

  HipHopClass('assets/profile_page/behrouz_sasani.png', 'Emma', '#Hiphoplover'),
  HipHopClass('assets/profile_page/ian_dooley.png', 'Davis John', '#Hiphoplover'),
  HipHopClass('assets/profile_page/aiony_haust.png', 'Julie', '#Hiphoplover'),
  HipHopClass('assets/profile_page/wasim_chouak.png', 'Micheal', '#Hiphoplover'),

];

class HipHopClass {
  final String userImage;
  final String userName;
  final String userInterest;
  HipHopClass(this.userImage, this.userName, this.userInterest);
}
