
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hub_file_flutter/Screens/HomePage/home_page.dart';
import 'package:hub_file_flutter/Screens/Profile/profile_page.dart';
import 'package:hub_file_flutter/Screens/SearchPage/search_page.dart';
import 'package:hub_file_flutter/Widgets/home_page_widgets.dart';
import 'package:hub_file_flutter/utils/colors.dart';
import 'package:hub_file_flutter/Widgets/custom_radio_widget.dart';
import 'package:hub_file_flutter/Screens/Drawer/collapsable_drawer.dart';
import 'CollabsPeople/chat_page.dart';
import 'CollabsPeople/collabs_people.dart';
import 'CollabsProjects/collabs_projects.dart';
import 'CollabsProjects/collabs_projects_web.dart';


class CollabsPage extends StatefulWidget {
  final String? userName;
  CollabsPage({Key? key, this.userName}) : super(key: key);

  @override
  State<CollabsPage> createState() => _CollabsPageState();
}

class _CollabsPageState extends State<CollabsPage> with TickerProviderStateMixin {

  bool isDesktop(BuildContext context)=>MediaQuery.of(context).size.width >=630;
  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <630;
  List<RadioModel> sampleData = <RadioModel>[];


  final List<Message> messages = [
    Message(content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", type: MessageType.text, isSender: false, time: '4:18'),
    Message(content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", type: MessageType.text, isSender: true, time: '4:19', status: 'seen'),
    Message(content: "assets/images/concert_image.jpg", type: MessageType.photo, isSender: false, time: '4:20',),
    Message(content: "assets/audio/audio.mp3", type: MessageType.audio, isSender: true, time: '4:21', status: 'seen'),

    Message(content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", type: MessageType.text, isSender: false, time: '4:18'),
    Message(content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", type: MessageType.text, isSender: true, time: '4:19', status: 'seen'),
    Message(content: "assets/images/concert_image.jpg", type: MessageType.photo, isSender: false, time: '4:20',),
    Message(content: "assets/audio/audio.mp3", type: MessageType.audio, isSender: true, time: '4:21', status: 'seen'),

    Message(content: "Hello123", type: MessageType.text, isSender: false, time: '4:21',),
    Message(content: "assets/images/concert_image.jpg", type: MessageType.photo, isSender: true, time: '4:21', status: 'seen'),
    Message(content: "assets/audio/audio.mp3", type: MessageType.audio, isSender: false, time: '4:22', status: 'seen'),
    // Add more messages here
  ];

  Widget _buildMessageWidget(Message message) {
    switch (message.type) {
      case MessageType.text:
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: (message.isSender ? Alignment.topRight : Alignment.topLeft),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: message.isSender ? kBlue : Colors.grey.shade300
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 05),
              child:

              // message.isSender?
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(message.content, textAlign: TextAlign.right,
              //       style: TextStyle(fontSize: 10, color: kWhite)),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(message.time,
              //             style: TextStyle(fontSize: 10, color: kWhite)),
              //         Text("${message.status}", style: TextStyle(fontSize: 10, color: kWhite)),
              //       ],
              //     ),
              //   ],
              // ):
              Column(
                children: [
                  Text(message.content, textAlign: message.isSender ? TextAlign.right : TextAlign.left,
                      maxLines: 5, style: TextStyle(fontSize: 10,
                          color: message.isSender ? kWhite : kBlack)),
                  // Row(
                  //   children: [
                  //     Text(message.time, textAlign: message.isSender ? TextAlign.right : TextAlign.left,
                  //         style: TextStyle(fontSize: 10,
                  //             color: message.isSender ? kWhite : kBlack)),
                  //     Text("${message.status}", textAlign: message.isSender ? TextAlign.right : TextAlign.left,
                  //         style: TextStyle(fontSize: 10,
                  //             color: message.isSender ? kWhite : kBlack)),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        );
      case MessageType.photo:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Align(
              alignment: (message.isSender ? Alignment.topRight : Alignment.topLeft),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: message.isSender ? kBlue : Colors.grey.shade300
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(message.content, height: 80)),
                  )),
            ),
          ),
        );
      case MessageType.audio:
        return Align(
          alignment: (message.isSender ? Alignment.topRight : Alignment.topLeft),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: message.isSender ? kBlue : Colors.grey.shade300
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(Icons.play_circle_filled),
          ),
        );
      default:
        return Container();
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void doNothing(BuildContext context) {}
  bool isVisible = false;
  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
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

    TabController _tabController = TabController(length: 2, vsync: this);
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
                                      width: Get.width * 0.3,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.02,
                                            vertical: Get.height * 0.02),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: Get.height * 0.02),
                                                  Text('Collabs', style: TextStyle(color: kBlue,
                                                      fontWeight: FontWeight.bold, fontSize: 18)),
                                                  SizedBox(height: Get.height * 0.02),
                                                  Container(
                                                    height: 35,
                                                    // width: Get.width * 0.45,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffF7F7F7),
                                                      border: Border.all(
                                                        color: Color(0xffF7F7F7),
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
                                                  SizedBox(height: Get.height * 0.03),
                                                  TabBar(
                                                    controller: _tabController,
                                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                                    indicatorColor: kBlue,
                                                    unselectedLabelColor: Colors.green,
                                                    isScrollable: false,
                                                    labelColor: Colors.black,
                                                    automaticIndicatorColorAdjustment: false,
                                                    tabs: [
                                                      Tab(
                                                        child: Text('People', style: TextStyle(fontSize: 15,
                                                            color: _tabController.index == 0 ? Colors.black : Colors.grey)),
                                                      ),
                                                      Tab(
                                                        child: Text('Projects', style: TextStyle(fontSize: 15,
                                                            color: _tabController.index == 1 ? Colors.black : Colors.grey)),
                                                      ),
                                                    ],
                                                  ),

                                                  Container(
                                                    height: Get.height*0.65,
                                                    width: Get.width,
                                                    child: TabBarView(
                                                        controller: _tabController,
                                                        children: [
                                                          // CollabsPeopleWebPage(),

                                                          Column(
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets.symmetric(vertical: Get.height* 0.02, horizontal: 02),
                                                                child: DottedBorder(
                                                                  borderType: BorderType.RRect,
                                                                  radius: Radius.circular(12),
                                                                  padding: EdgeInsets.all(0),
                                                                  dashPattern: [8,8],
                                                                  strokeWidth: 3,
                                                                  color: Color(0xffABBBE8),
                                                                  child: ClipRRect(
                                                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                                                    child: Container(
                                                                      height: 50,
                                                                      width: Get.width,
                                                                      color: Color(0xffEDF3FF),
                                                                      child: TextButton(
                                                                          // onPressed: toggleVisibility,
                                                                        onPressed: (){},
                                                                        child: Center(child: Text('Start New Chat', style: TextStyle(color: Color(0xffABBBE8)))),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                height: Get.height* 0.5,
                                                                child: ListView.builder(
                                                                    itemCount: collabsPeopleList.length,
                                                                    itemBuilder: (BuildContext context, int index) {
                                                                      return GestureDetector(
                                                                        child: Slidable(
                                                                          // Specify a key if the Slidable is dismissible.
                                                                          key: ValueKey(0),

                                                                          // The start action pane is the one at the left or the top side.
                                                                          endActionPane: ActionPane(
                                                                            // A motion is a widget used to control how the pane animates.
                                                                            motion: ScrollMotion(),

                                                                            // A pane can dismiss the Slidable.
                                                                            dismissible: DismissiblePane(onDismissed: () {}),

                                                                            // All actions are defined in the children parameter.
                                                                            children: [
                                                                              // A SlidableAction can have an icon and/or a label.
                                                                              SlidableAction(
                                                                                onPressed: doNothing,
                                                                                backgroundColor: Color(0xFFFE4A49),
                                                                                foregroundColor: Colors.white,
                                                                                icon: Icons.delete,
                                                                                label: 'Delete',
                                                                              ),
                                                                            ],
                                                                          ),

                                                                          child: Container(
                                                                            decoration: BoxDecoration(
                                                                              color: Color(0xffF7F7F7),
                                                                              borderRadius: BorderRadius.circular(5),
                                                                            ),
                                                                            child: Padding(
                                                                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                                              child: ListTile(
                                                                                contentPadding: EdgeInsets.zero,
                                                                                leading: Stack(
                                                                                  children: [
                                                                                    CircleAvatar(
                                                                                      radius: 30,
                                                                                      backgroundImage: AssetImage(collabsPeopleList[index].userImage),
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
                                                                                        child: Text(collabsPeopleList[index].userNumber,
                                                                                            style: TextStyle(color: kWhite, fontSize: 10), textAlign: TextAlign.center),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                title: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(collabsPeopleList[index].userName,
                                                                                        textAlign: TextAlign.left,
                                                                                        style: TextStyle(fontSize: 14, color: kBlue, fontWeight: FontWeight.bold)),
                                                                                    Text(collabsPeopleList[index].userStatus, textAlign: TextAlign.left,
                                                                                        style: TextStyle(color: collabsPeopleList[index].userStatus == 'online'?
                                                                                        Colors.green.shade400: Colors.black38, fontSize: 08)),
                                                                                  ],
                                                                                ),
                                                                                subtitle: Padding(
                                                                                  padding: const EdgeInsets.only(top: 10),
                                                                                  child: Text(collabsPeopleList[index].userDescription,
                                                                                      textAlign: TextAlign.left,
                                                                                      maxLines: 2, overflow: TextOverflow.ellipsis,
                                                                                      style: TextStyle(color: Colors.black38, fontSize: 08)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }),
                                                              ),
                                                            ],
                                                          ),
                                                          CollabsProjectsWebPage(),

                                                        ]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 2),
                                    Container(
                                      width: Get.width * 0.5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.02,
                                            vertical: Get.height * 0.02),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 05),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    child: isVisible? Visibility(
                                                        visible: isVisible,
                                                        child: Container(
                                                          height: 330, width: Get.width,
                                                          decoration: BoxDecoration(color: Colors.blue,
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
                                                                                  suffixIconColor: Colors.blueAccent,
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
                                                                              child: Icon(isVisible? Icons.close : Icons.filter_alt_outlined, color: Colors.white, size: 17)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(height: Get.height* 0.03),
                                                                    Text('Level 1', style: TextStyle(color: Color(0xffF3F3FE), fontSize: 10, fontWeight: FontWeight.bold)),
                                                                    SizedBox(height: Get.height* 0.02),

                                                                    Row(
                                                                      children: [
                                                                        Text('#Residential'),
                                                                        SizedBox(width: Get.width * 0.015),
                                                                        Text('#Texas'),
                                                                        SizedBox(width: Get.width * 0.015),
                                                                        Text('#Electrician'),
                                                                      ],
                                                                    ),
                                                                    SizedBox(height: Get.height* 0.01),
                                                                    Row(
                                                                      children: [
                                                                        Text('#insured'),
                                                                        SizedBox(width: Get.width * 0.015),
                                                                        Text('#Licensed'),
                                                                        SizedBox(width: Get.width * 0.015),
                                                                        Text('#Single'),
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
                                                    )
                                                        : Column(
                                                      children: [
                                                        const SizedBox(height: 10),


                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                GestureDetector(
                                                                    onTap: (){
                                                                      Navigator.pop(context);
                                                                    },
                                                                    child: Image.asset('assets/profile_images/back_button.png')),
                                                                SizedBox(width: 05),
                                                                Text('Davis John', style: TextStyle(color: kBlue,
                                                                    fontWeight: FontWeight.bold, fontSize: 18)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(Icons.search, color: kBlue),
                                                                SizedBox(width: 02),
                                                                Icon(Icons.more_vert_outlined, color: kBlue),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: Get.height* 0.015),
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
                                                        Container(
                                                          height: Get.height* 0.8,
                                                          color: Colors.transparent,
                                                          child: ListView.builder(
                                                            itemCount: messages.length,
                                                            itemBuilder: (BuildContext context, int index) {
                                                              final message = messages[index];
                                                              return _buildMessageWidget(message);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        height: Get.height * 0.065,
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey.shade200,
                                                          border: Border.all(
                                                            color: Colors.grey.shade50,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Icon(Icons.image_outlined, color: Colors.black38, size: 20),
                                                            Icon(Icons.file_present_outlined, color: Colors.black38, size: 20),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          height: Get.height * 0.065,
                                                          decoration: BoxDecoration(
                                                            color: Colors.grey.shade200,
                                                            border: Border.all(
                                                              color: Colors.grey.shade50,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.only(
                                                                bottom: Get.height * 0.02,
                                                                left: Get.width * 0.02),
                                                            child: TextField(
                                                              decoration: InputDecoration(
                                                                hintText: 'Type something',
                                                                hintStyle: TextStyle(color: Colors.black38, fontSize: 09, wordSpacing: 1.5),
                                                                suffixIconColor: kBlueLight,
                                                                suffixIcon: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: Get.height * 0.01,
                                                                      right: Get.width * 0.02),
                                                                  child: Icon(Icons.mic_none_outlined, color: kBlueLight, size: 20),
                                                                ),

                                                                border: InputBorder.none,
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
                      Text('Collabs', style: TextStyle(color: kBlue,
                          fontWeight: FontWeight.bold, fontSize: 18)),
                      notificationIconWidget('assets/profile_images/notification_icon.svg', context),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 35,
                          // width: Get.width * 0.45,
                          decoration: BoxDecoration(
                            color: Color(0xffF7F7F7),
                            border: Border.all(
                              color: Color(0xffF7F7F7),
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
                            color: Color(0xffF7F7F7),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(Icons.filter_alt_outlined, color: kBlueLight, size: 17)),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  TabBar(
                    controller: _tabController,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    indicatorColor: kBlue,
                    unselectedLabelColor: Colors.green,
                    isScrollable: false,
                    labelColor: Colors.black,
                    automaticIndicatorColorAdjustment: false,
                    tabs: [
                      Tab(
                        child: Text('People', style: TextStyle(fontSize: 15,
                            color: _tabController.index == 0 ? Colors.black : Colors.grey)),
                      ),
                      Tab(
                        child: Text('Projects', style: TextStyle(fontSize: 15,
                              color: _tabController.index == 1 ? Colors.black : Colors.grey)),
                      ),
                    ],
                  ),

                  Container(
                    height: Get.height*0.65,
                    width: Get.width,
                    child: TabBarView(
                        controller: _tabController,
                        children: [
                          /// Apna idher 2 diff widget call kr lena ak login or ak register
                          // Container(
                          //   color: Colors.red,
                          // ),
                          // Container(
                          //   color: Colors.blueAccent,
                          // ),
                          CollabsPeople(),
                          CollabsProjects(),

                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
    }
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


List collabsPeopleList = [
  CollabsPeopleClass('assets/welcome_images/business_woman.png', '1', 'David John', 'Lorem ipsum is simply dummy text of the printing and typesetting industry, Lorem ipsum is simply dummy text of the printing and typesetting industry.', 'online'),
  CollabsPeopleClass('assets/profile_images/behrouz_sasani.png', '2', 'David John', 'Lorem ipsum is simply dummy text of the printing and typesetting industry, Lorem ipsum is simply dummy text of the printing and typesetting industry.', 'Seen 1h ago'),
  CollabsPeopleClass('assets/profile_images/ian_dooley.png', '3', 'David John', 'Lorem ipsum is simply dummy text of the printing and typesetting industry, Lorem ipsum is simply dummy text of the printing and typesetting industry.' , 'Active 5d ago'),
  CollabsPeopleClass('assets/profile_images/aiony_haust.png', '1', 'David John', 'Lorem ipsum is simply dummy text of the printing and typesetting industry, Lorem ipsum is simply dummy text of the printing and typesetting industry.' , 'Active 5d ago'),
  CollabsPeopleClass('assets/profile_images/wasim_chouak.png', '2', 'David John', 'Lorem ipsum is simply dummy text of the printing and typesetting industry, Lorem ipsum is simply dummy text of the printing and typesetting industry.' , 'Active 5d ago'),

];

class CollabsPeopleClass {
  final String userImage;
  final String userNumber;
  final String userName;
  final String userDescription;
  final String userStatus;
  CollabsPeopleClass(this.userImage, this.userNumber, this.userName, this.userDescription, this.userStatus);
}
