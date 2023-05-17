
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hub_file_flutter/Screens/CollabsPage/collabs_page.dart';
import 'package:hub_file_flutter/Screens/HomePage/home_page.dart';
import 'package:hub_file_flutter/Screens/Profile/profile_page.dart';
import 'package:hub_file_flutter/Widgets/home_page_widgets.dart';
import 'package:hub_file_flutter/utils/colors.dart';
import 'package:hub_file_flutter/Widgets/custom_radio_widget.dart';
import 'package:hub_file_flutter/Screens/Drawer/collapsable_drawer.dart';

class SearchPage extends StatefulWidget {
  final String? userName;
  SearchPage({Key? key, this.userName}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

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

  bool isVisible = false;

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  radioButtonWidget(){
    return Container(
      height: 50,
      child: ListView.builder(
        itemCount: sampleData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              print('selectedButtonText ${sampleData[index].buttonText}');
              setState(() {
                sampleData.forEach((element) => element.isSelected = false);
                sampleData[index].isSelected = true;
              });
            },
            child: new RadioItem(sampleData[index]),
          );
        },
      ),
    );
  }

  radioButtonWidget2(){
    return Container(
      height: 50,
      child: ListView.builder(
        itemCount: sampleData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              print('selectedButtonText ${sampleData[index].buttonText}');
              setState(() {
                sampleData.forEach((element) => element.isSelected = false);
                sampleData[index].isSelected = true;
              });
            },
            child: RadioItem2(sampleData[index]),
          );
        },
      ),
    );
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
          child: Text('Profile'),
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
          child: Text('Logout'),
          value: 7,
        ),
      ],
      elevation: 8.0,
    );
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
                                notificationIconWidget('assets/profile_images/notification_icon.svg', context),
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
                                drawerIconWidget('assets/profile_images/home_Component.png'),
                                SizedBox(height: Get.height * 0.04),
                                drawerIconWidget('assets/profile_images/u_Component.png'),
                                SizedBox(height: Get.height * 0.04),
                                drawerIconWidget('assets/profile_images/save_Component.png'),
                                SizedBox(height: Get.height * 0.04),
                                drawerIconWidget('assets/profile_images/share_Component.png'),
                                SizedBox(height: Get.height * 0.04),
                              ],
                            ),
                          ),
                          SizedBox(width: Get.width * 0.01),
                          Spacer(),
                          Center(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: Get.width * 0.387,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.02,
                                            vertical: Get.height * 0.02),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text('Profile', style: TextStyle(color: kBlueLight,
                                                    fontWeight: FontWeight.bold, fontSize: 16)),
                                                Spacer(),
                                                Container(
                                                  height: 15,
                                                  width: 15,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(50),
                                                      border: Border.all(
                                                          color: kAmberLight)),
                                                  child: Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: Text('U', style: TextStyle(fontSize: 10,
                                                          color: kAmberLight, fontWeight: FontWeight.bold)),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: Get.width * 0.002),
                                                Text('500', style: TextStyle(fontSize: 12,
                                                    color: kAmberLight, fontWeight: FontWeight.w500)),
                                                SizedBox(width: Get.width * 0.01),
                                              ],
                                            ),
                                            SizedBox(height: Get.height * 0.02),
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
                                                Positioned(
                                                  bottom: 0,
                                                  right: 03,
                                                  child: Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        color: kAmberLight,
                                                        borderRadius: BorderRadius.circular(50)),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(0.0),
                                                      child: Center(
                                                          child: Text('B',
                                                        style: TextStyle(fontWeight: FontWeight.bold)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.025),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Icon(Icons.shopping_basket_rounded, color: Colors.grey.shade100),
                                                  SizedBox(width: Get.width * 0.02),
                                                  Icon(Icons.favorite_outline, color: Colors.grey.shade100),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: Get.height * 0.02),
                                            Center(
                                              child:
                                              widget.userName == null?
                                              Text('Tom Cruise', maxLines: 5,
                                                  style: TextStyle(fontSize: 20,
                                                      color: kBlueLight, fontWeight: FontWeight.w500)):
                                              Text('${widget.userName}', maxLines: 5,
                                                  style: TextStyle(fontSize: 20,
                                                      color: kBlueLight, fontWeight: FontWeight.w500)),
                                            ),
                                            SizedBox(height: Get.height * 0.01),
                                            Center(
                                              child: Text('#Musiclover #traveller #businessman',
                                                  maxLines: 5, style: TextStyle(
                                                      fontSize: 8, color: kGrey,
                                                      fontWeight: FontWeight.normal)),
                                            ),
                                            SizedBox(height: Get.height * 0.01),


                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.035),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  myWidget('40', 'Posts'),
                                                  VerticalDivider(color: kGrey),
                                                  myWidget('400', 'Followers'),
                                                  VerticalDivider(color: kGrey),
                                                  myWidget('100', 'CollabsPage'),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: Get.height * 0.02),

                                            radioButtonWidget(),

                                            imagesList(),

                                            SizedBox(height: Get.height * 0.01),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 2),
                                    Container(
                                      width: Get.width * 0.387,
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
                                            Text('Activities',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: kBlueLight,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(height: Get.height * 0.05),
                                            ListView.builder(
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) =>
                                                    Column(
                                                      children: [
                                                        Container(
                                                          height: 250,
                                                          width: double.infinity,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage('assets/images/concert_image.jpg'),
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
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(width: Get.width * 0.015),
                          Padding(
                            padding: EdgeInsets.only(top: Get.height * 0.06),
                            child: Column(
                              children: [
                                onLineImageWidget('assets/profile_images/behrouz_sasani.png', 'assets/profile_images/ellipse.png'),
                                onLineImageWidget('assets/profile_images/ian_dooley.png', 'assets/profile_images/ellipse.png'),
                                onLineImageWidget('assets/profile_images/aiony_haust.png', 'assets/profile_images/ellipse.png'),
                                onLineImageWidget('assets/profile_images/wasim_chouak.png', 'assets/profile_images/ellipse.png'),
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
            backgroundColor: kWhite,
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
              icon: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: SvgPicture.asset('assets/profile_images/home.svg')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CollabsPage()));
                  },
                  child: SvgPicture.asset('assets/profile_images/you.svg')
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                  child: SvgPicture.asset('assets/profile_images/search.svg')
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: SvgPicture.asset('assets/profile_images/profile.svg',),
              ),
              label: '',
            )
          ],
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
                      Text('Search', style: TextStyle(color: kBlue,
                          fontWeight: FontWeight.bold, fontSize: 18)),
                      Row(
                        children: [
                          SvgPicture.asset('assets/search_images/Union.svg', height: 25, width: 50, fit: BoxFit.fill, ),
                          SizedBox(width: Get.width * 0.01),
                          notificationIconWidget('assets/profile_images/notification_icon.svg', context),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: Get.height * 0.02),
                  Column(
                    children: [
                      isVisible?
                      Visibility(
                          visible: isVisible,
                          child: Container(
                        height: 325, width: Get.width,
                        decoration: BoxDecoration(color: kBlue,
                            borderRadius: BorderRadius.circular(05)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 35,
                                            // width: Get.width * 0.45,
                                            decoration: BoxDecoration(
                                              color: Color(0xff7471F3),
                                              border: Border.all(
                                                color: Color(0xff7471F3),
                                                width: 1.0,
                                              ),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: Get.height * 0.02,
                                                  left: Get.width * 0.02),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  hintText: 'Search',
                                                  hintStyle: TextStyle(color: Color(0xffF3F3FE), fontSize: 09, wordSpacing: 1.5),
                                                  suffixIconColor: kBlueLight,
                                                  suffixIcon: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: Get.height * 0.01,
                                                        right: Get.width * 0.02),
                                                    child: Icon(Icons.search, color: Color(0xffF3F3FE), size: 20),
                                                  ),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),

                                        TextButton(
                                          onPressed: toggleVisibility,
                                          child: Container(
                                              height: 35, width: 35,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Icon(isVisible? Icons.close : Icons.filter_alt_outlined, color: kWhite, size: 17)),
                                        ),
                                      ],
                                    ),
                                  SizedBox(height: Get.height* 0.03),
                                  Text('Level 1', style: TextStyle(color: Color(0xffF3F3FE), fontSize: 10, fontWeight: FontWeight.bold)),
                                  SizedBox(height: Get.height* 0.02),

                                  Row(
                                    children: [
                                      levelOneTextWidget('#Residential'),
                                      SizedBox(width: Get.width * 0.015),
                                      levelOneTextWidget('#Texas'),
                                      SizedBox(width: Get.width * 0.015),
                                      levelOneTextWidget('#Electrician'),
                                    ],
                                  ),
                                  SizedBox(height: Get.height* 0.01),
                                  Row(
                                    children: [
                                      levelOneTextWidget('#insured'),
                                      SizedBox(width: Get.width * 0.015),
                                      levelOneTextWidget('#Licensed'),
                                      SizedBox(width: Get.width * 0.015),
                                      levelOneTextWidget('#Single'),
                                    ],
                                  ),
                                  SizedBox(height: Get.height* 0.03),
                                  Text('Level 2', style: TextStyle(color: Color(0xffF3F3FE), fontSize: 10, fontWeight: FontWeight.bold)),
                                  SizedBox(height: Get.height* 0.008),
                                ],
                              ),
                            ),
                            Container(
                              height: 110, width: Get.width,
                              decoration: BoxDecoration(
                                color: Color(0xff7471F3),
                                border: Border.all(
                                  color: Color(0xff7471F3),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(05),
                                    bottomRight: Radius.circular(05)
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.lock_outline_rounded, size: 40, color: Color(0xffF3F3FE)),
                                  SizedBox(height: Get.height* 0.015),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Unlock ',
                                        style: TextStyle(
                                            fontSize: 14, color: Color(0xffF3F3FE), fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'to access all features',
                                            style: TextStyle(
                                                fontSize: 10, color: Color(0xffF3F3FE)),
                                            // recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(
                                            //     context, MaterialPageRoute(builder: (context) => LoginPage())),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ): TextButton(
                    onPressed: toggleVisibility,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 35,
                            // width: Get.width * 0.45,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              border: Border.all(
                                color: Colors.grey.shade50,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: Get.height * 0.02,
                                  left: Get.width * 0.02),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 09, wordSpacing: 1.5),
                                  suffixIconColor: kBlueLight,
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        top: Get.height * 0.01,
                                        right: Get.width * 0.02),
                                    child: Icon(Icons.search, color: kBlueLight, size: 20),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                            height: 35, width: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(isVisible? Icons.close : Icons.filter_alt_outlined, color: kBlueLight, size: 17)),
                      ],
                    ),
                  ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Divider()
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text("Today", style: TextStyle(color: Colors.grey.shade300, fontSize: 10)),
                          ),
                          Expanded(
                              child: Divider()
                          ),
                        ]
                    ),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  
                  // searchHistoryWidget('#work', 'Recent'),
                  // searchHistoryWidget('#Location', 'Recent'),

                  searchResultWidget(),

                ],
              ),
            ),
          ),
        ),
      ));
    }
  }


  levelOneTextWidget(text){
    return Container(
        height: 30, width: 100,
        decoration: BoxDecoration(
          color: Color(0xff7471F3),
          border: Border.all(
            color: Color(0xff7471F3),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(03),
        ),
        child: Center(
            child: Text(text, style: TextStyle(color: Color(0xffF3F3FE), fontSize: 13, fontWeight: FontWeight.w500))));
  }

  searchHistoryWidget(searchText, searchTime){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height* 0.012),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(searchText, style: TextStyle(fontSize: 10, color: Colors.black54)),
          Text(searchTime, style: TextStyle(fontSize: 10, color: Colors.black38)),
        ],
      ),
    );
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

  imagesList(){
    return Container(
      height: 100,
      width: Get.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cardList.length +1,
          itemBuilder: (context, index){
            // Check if it's the last item
            if (index == cardList.length) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 05, vertical: 05),
                child: Container(
                    height: 50, width: 100,
                    color: Colors.grey.shade100,
                    child: Center(child: Icon(Icons.add, size: 30, color: Colors.grey.shade300,))),
              ); // Display the additional text item
            }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 05),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(cardList[index].image1, height: 100, width: 50),
              Column(
                children: [
                  Image.asset(cardList[index].image2, height: 50, width: 50),
                  Image.asset(cardList[index].image3, height: 50, width: 50),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  searchResultWidget(){
    return Container(
      height: Get.height* 0.6,
      child: ListView.builder(
          itemCount: searchResultList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 05),
              child: GestureDetector(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
                },

                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset(searchResultList[index].userImage, height: 60, width: 60),
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
                                    child: Text(searchResultList[index].userNumber,
                                        style: TextStyle(color: kWhite, fontSize: 10), textAlign: TextAlign.center),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(searchResultList[index].userName,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 14, color: kBlue, fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(searchResultList[index].userDescription,
                                      textAlign: TextAlign.left,
                                      maxLines: 2, overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.black38, fontSize: 08)),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              Icon(Icons.favorite_outline, color: Color(0xff4C48E3), size: 30),
                              SizedBox(width: 10),
                              Icon(Icons.person_add_alt_outlined, color: Color(0xff4C48E3), size: 30),
                              SizedBox(width: 10),
                              Icon(Icons.share_outlined, color: Color(0xff4C48E3), size: 30),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

}

List cardList = [
  _FitnessCategory('assets/profile_images/smiling_man.png', 'assets/profile_images/cityscape-sanremo.png', 'assets/profile_images/crowd_during_concert.png'),
  _FitnessCategory('assets/profile_images/smiling_man.png', 'assets/profile_images/cityscape-sanremo.png', 'assets/profile_images/crowd_during_concert.png'),

];

class _FitnessCategory {
  final String image1;
  final String image2;
  final String image3;
  _FitnessCategory(this.image1, this.image2, this.image3);
}

List searchResultList = [
  SearchResultClass('assets/welcome_images/business_woman.png', '1', 'David John', '#Musiclover #traveller #businessman'),
  SearchResultClass('assets/profile_images/behrouz_sasani.png', '2', 'David John', '#Musiclover #traveller #businessman'),
  SearchResultClass('assets/profile_images/ian_dooley.png', '3', 'David John', '#Musiclover #traveller #businessman'),
  SearchResultClass('assets/profile_images/aiony_haust.png', '1', 'David John', '#Musiclover #traveller #businessman'),
  SearchResultClass('assets/profile_images/wasim_chouak.png', '2', 'David John', '#Musiclover #traveller #businessman'),

];

class SearchResultClass {
  final String userImage;
  final String userNumber;
  final String userName;
  final String userDescription;

  SearchResultClass(this.userImage, this.userNumber, this.userName, this.userDescription);
}