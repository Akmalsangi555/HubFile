
import 'chat_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hub_file_flutter/utils/colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void doNothing(BuildContext context) {}

class CollabsPeople extends StatefulWidget {
  const CollabsPeople({Key? key}) : super(key: key);

  @override
  State<CollabsPeople> createState() => _CollabsPeopleState();
}

class _CollabsPeopleState extends State<CollabsPeople> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.025),
          Container(
            height: Get.height* 0.6,
            child: ListView.builder(
                itemCount: collabsPeopleList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 05),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
                      },

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
