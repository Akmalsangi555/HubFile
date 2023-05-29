
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hub_file_flutter/Screens/CollabsPage/collabs_page.dart';
import 'package:hub_file_flutter/Screens/HomePage/home_page.dart';
import 'package:hub_file_flutter/Screens/SearchPage/search_page.dart';
import 'package:hub_file_flutter/Widgets/home_page_widgets.dart';
import 'package:hub_file_flutter/utils/colors.dart';
import 'package:hub_file_flutter/Widgets/custom_radio_widget.dart';
import 'package:hub_file_flutter/Screens/Drawer/collapsable_drawer.dart';

class ProfilePage extends StatefulWidget {
  final String? userName;
  ProfilePage({Key? key, this.userName}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool isDesktop(BuildContext context)=>MediaQuery.of(context).size.width >=630;
  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <630;
  List<RadioModel> sampleData = <RadioModel>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('userNam123 ${widget.userName}');

    sampleData.add(RadioModel(false, 'Edit Profile', 'assets/profile_images/edit_icon.png'));
    sampleData.add(RadioModel(true, 'Insights', 'assets/profile_images/chart_component.png'));
    sampleData.add(RadioModel(false, 'Share', 'assets/profile_images/share_icon.png'));

  }

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      print('currentIndex $_currentIndex');
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
                                drawerIconWidget('assets/profile_images/home_Component.png', () {}),
                                SizedBox(height: Get.height * 0.04),
                                drawerIconWidget('assets/profile_images/u_Component.png', () {}),
                                SizedBox(height: Get.height * 0.04),
                                drawerIconWidget('assets/profile_images/save_Component.png', () {}),
                                SizedBox(height: Get.height * 0.04),
                                drawerIconWidget('assets/profile_images/share_Component.png', () {}),
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
                      Text('Profile', style: TextStyle(color: kBlue,
                          fontWeight: FontWeight.bold, fontSize: 18)),
                      Row(
                        children: [
                          Image.asset('assets/profile_images/u_layer.png'),
                          SizedBox(width: Get.width * 0.01),
                          Text('100', style: TextStyle(fontSize: 14,
                              color: kAmberLight, fontWeight: FontWeight.bold)),
                          SizedBox(width: Get.width * 0.01),
                          notificationIconWidget('assets/profile_images/notification_icon.svg', context),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/welcome_images/business_woman.png',
                            height: 90, width: 90, fit: BoxFit.fill),
                          Positioned(
                            top: 0,
                            left: 03,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: kBlue,
                                  borderRadius: BorderRadius.circular(50)),
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
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 70),
                      Center(
                        child: Text('Julie Clary',
                            maxLines: 2, style: TextStyle(
                                fontSize: 18, color: kBlue,
                                fontWeight: FontWeight.w700)),
                      ),
                      Row(
                        children: [
                          Image.asset('assets/profile_images/gift_icon.png',
                              height: 20, width: 20, fit: BoxFit.fill),
                          SizedBox(width: Get.width * 0.02),
                          Image.asset('assets/profile_images/heart_icon.png',
                              height: 20, width: 20, fit: BoxFit.fill),

                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Center(
                    child: Text('#Musiclover #traveller #businessman',
                        maxLines: 5, style: TextStyle(
                            fontSize: 08, color: kGrey,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        myWidget('10', 'Posts'),
                        VerticalDivider(color: kGrey),
                        myWidget('231', 'Followers'),
                        VerticalDivider(color: kGrey),
                        myWidget('100', 'CollabsPage'),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  radioButtonWidget2(),
                  SizedBox(height: Get.height * 0.01),
                  imagesList(),
                  SizedBox(height: Get.height * 0.02),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Activity', style: TextStyle(fontSize: 16,
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
                      SizedBox(height: Get.height * 0.01),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              Column(
                                children: [
                                  Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/concert_image.jpg'),
                                            fit: BoxFit.cover)),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10, left: Get.width*0.01, right: Get.width*0.01,),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              CircleAvatar(
                                                radius: 17.5,
                                                backgroundImage: AssetImage('assets/welcome_images/business_woman.png'),
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
                                        Icon(Icons.favorite_border, color: Colors.grey.shade300, size: 25),
                                        SizedBox(width: Get.width * 0.02),
                                        Icon(Icons.messenger_outline, color: Colors.grey.shade300, size: 25),
                                        SizedBox(width: Get.width * 0.02),
                                        Icon(Icons.add, color: Colors.grey.shade300, size: 25),
                                        SizedBox(width: Get.width * 0.02),
                                        Spacer(),
                                        Text('#hiphop #music #lifestyle', maxLines: 5, style: TextStyle(
                                            fontSize: 08, color: Colors.black38)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          itemCount: 4),
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
