import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hub_file_flutter/utils/colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
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
                    Text('Notifications', style: TextStyle(color: kBlue,
                        fontWeight: FontWeight.bold, fontSize: 18)),
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close_outlined, color: kBlue)),
                  ],
                ),
                SizedBox(height: Get.height * 0.02),

                notificationListWidget(),

              ],
            ),
          ),
        ),
      ),
    ));
  }

  void doNothing(BuildContext context) {}
  notificationListWidget(){
    return Container(
      height: Get.height* 0.9,
      child: ListView.builder(
          itemCount: notificationItemList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 05),
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
                      padding: EdgeInsets.symmetric(vertical: 20),
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete_forever_outlined,
                      label: 'Delete',
                    ),
                  ],
                ),

                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(notificationItemList[index].userImage),
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
                            child: Text(notificationItemList[index].userNumber,
                                style: TextStyle(color: kWhite, fontSize: 10), textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    ),
                    title: Row(
                      children: [
                        Text(notificationItemList[index].userName, textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 10, color: Colors.black38)),
                        SizedBox(width: 05),
                        Text(notificationItemList[index].userDescription, textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black87, fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    subtitle: Text(notificationItemList[index].daysAgo, textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black38, fontSize: 10)),
                    trailing: ClipRRect(
                        borderRadius: BorderRadius.circular(05),
                        child: Image.asset(notificationItemList[index].notificationImage, height: 90, width: 45, fit: BoxFit.fill)),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

List notificationItemList = [
  NotificationClass('assets/welcome_images/business_woman.png', '1', 'David John just like your', 'post.', '2d ago', 'assets/images/concert_image.jpg'),
  NotificationClass('assets/profile_images/behrouz_sasani.png', '1', 'David John just like your', 'post.', '2d ago', 'assets/images/concert_image.jpg'),
  NotificationClass('assets/profile_images/ian_dooley.png', '1', 'David John just like your', 'post.', '2d ago', 'assets/images/concert_image.jpg'),
  NotificationClass('assets/profile_images/aiony_haust.png', '1', 'Anna just like your', 'post.', '2d ago', 'assets/images/concert_image.jpg'),
  NotificationClass('assets/profile_images/wasim_chouak.png', '1', 'Micheal invited you in', 'Jazz Music Festival.', '2d ago', 'assets/images/concert_image.jpg'),
  NotificationClass('assets/welcome_images/business_woman.png', '1', 'David John just like your', 'post.', '2d ago', 'assets/images/concert_image.jpg'),
  NotificationClass('assets/profile_images/behrouz_sasani.png', '1', 'David John just like your', 'post.', '2d ago', 'assets/images/concert_image.jpg'),
  NotificationClass('assets/profile_images/ian_dooley.png', '1', 'David John just like your', 'post.', '2d ago', 'assets/images/concert_image.jpg'),
  NotificationClass('assets/profile_images/aiony_haust.png', '1', 'Anna just like your', 'post.', '2d ago', 'assets/images/concert_image.jpg'),
  NotificationClass('assets/profile_images/wasim_chouak.png', '1', 'Micheal invited you in', 'Jazz Music Festival.', '2d ago', 'assets/images/concert_image.jpg'),

];

class NotificationClass {
  final String userImage;
  final String userNumber;
  final String userName;
  final String userDescription, daysAgo;
  final String notificationImage;

  NotificationClass(this.userImage, this.userNumber, this.userName, this.userDescription, this.daysAgo, this.notificationImage);
}
