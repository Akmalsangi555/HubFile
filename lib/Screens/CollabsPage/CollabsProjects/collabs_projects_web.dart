
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:hub_file_flutter/utils/colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hub_file_flutter/Screens/CollabsPage/CollabsPeople/collabs_people.dart';

class CollabsProjectsWebPage extends StatefulWidget {
  const CollabsProjectsWebPage({Key? key}) : super(key: key);

  @override
  State<CollabsProjectsWebPage> createState() => _CollabsProjectsWebPageState();
}

class _CollabsProjectsWebPageState extends State<CollabsProjectsWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Column(
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
                  child: Center(child: Text('Create a Project', style: TextStyle(color: Color(0xffABBBE8)))),
                ),
              ),
            ),
          ),
          Container(
            height: Get.height* 0.5,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
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
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 07),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              width: 85,
                              color: Colors.transparent,
                              child: Stack(
                                //alignment:new Alignment(x, y)
                                children: <Widget>[
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(color: kWhite, width: 4),
                                      ),
                                      child: Image.asset(collabsPeopleList[index].userImage1, height: 40, width: 40)),
                                  Positioned(
                                    left: 20.0,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          border: Border.all(color: kWhite, width: 4),
                                        ),
                                        child: Image.asset(collabsPeopleList[index].userImage2, height: 40, width: 40)),
                                  ),
                                  Positioned(
                                    left:40.0,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          border: Border.all(color: kWhite, width: 4),
                                        ),
                                        child: Image.asset(collabsPeopleList[index].userImage3, height: 40, width: 40)),
                                  )

                                ],
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(collabsPeopleList[index].userName,
                                    textAlign: TextAlign.left, style: TextStyle(fontSize: 14, color: kBlue, fontWeight: FontWeight.bold)),
                                Text(collabsPeopleList[index].userStatus, textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.black38, fontSize: 08)),
                              ],
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 05),
                              child: Text(collabsPeopleList[index].userDescription,
                                  textAlign: TextAlign.left,
                                  maxLines: 2, overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Color(0xffD3D3D3), fontSize: 09)),
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
    );
  }
}

List collabsPeopleList = [
  CollabsPeopleClass('assets/welcome_images/business_woman.png', 'assets/profile_images/behrouz_sasani.png', 'assets/profile_images/ian_dooley.png', 'Jazz Festival Event', 'Lorem ipsum is simply dummy text of the printing and typesetting industry.', 'Seen by all'),
  CollabsPeopleClass('assets/profile_images/behrouz_sasani.png', 'assets/profile_images/ian_dooley.png', 'assets/profile_images/wasim_chouak.png', 'Web Design Project', 'Lorem ipsum is simply dummy text of the printing and typesetting industry.', ''),
  CollabsPeopleClass('assets/profile_images/ian_dooley.png', 'assets/profile_images/aiony_haust.png', 'assets/welcome_images/business_woman.png', 'Event Management', 'Lorem ipsum is simply dummy text of the printing and typesetting industry.' , ''),
];

class CollabsPeopleClass {
  final String userImage1, userImage2, userImage3;
  final String userName;
  final String userDescription;
  final String userStatus;
  CollabsPeopleClass(this.userImage1, this.userImage2, this.userImage3, this.userName, this.userDescription, this.userStatus);
}
