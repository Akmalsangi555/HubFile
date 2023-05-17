// import 'package:flutter/material.dart';
//
// enum MessageType {
//   text,
//   image,
// }
//
// class Message {
//   final String content;
//   final MessageType type;
//
//   Message({required this.content, required this.type});
// }
//
// class ChatPage extends StatelessWidget {
//   final List<Message> messages = [
//     Message(content: "Hello", type: MessageType.text),
//     Message(content: "assets/images/concert_image.jpg", type: MessageType.image),
//     Message(content: "How are you?", type: MessageType.text),
//     // Add more messages here
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat Page'),
//       ),
//       body: ListView.builder(
//         itemCount: messages.length,
//         itemBuilder: (BuildContext context, int index) {
//           final message = messages[index];
//           return _buildMessageWidget(message);
//         },
//       ),
//     );
//   }
//
//   Widget _buildMessageWidget(Message message) {
//     if (message.type == MessageType.text) {
//       return ListTile(
//         title: Container(
//             decoration: BoxDecoration(
//               color: Color(0xffF7F7F7),
//               borderRadius: BorderRadius.circular(5),
//             ),
//             child: Text(message.content,  style: TextStyle(color: Colors.black38, fontSize: 10)),
//         ),
//       );
//     } else if (message.type == MessageType.image) {
//       return ListTile(
//         title: Image.asset(message.content, height: 200, width: 200,),
//       );
//     } else {
//       return Container(); // Handle other message types as needed
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hub_file_flutter/utils/colors.dart';

enum MessageType {
  text,
  photo,
  audio,
}

class Message {
  final String content, time;
  final String? status;
  final MessageType type;
  final bool isSender;

  Message({required this.content, required this.type, required this.isSender, required this.time, this.status});
}

class ChatPage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/profile_images/back_button.png'),
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
                  // SizedBox(height: Get.height* 0.015),
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

            // Padding(
            //     padding: EdgeInsets.all(10),
            //     child: Container(
            //         decoration: BoxDecoration(
            //           color: Colors.grey,
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //         child: Padding(
            //             padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            //             child: TextFormField(
            //                 decoration: InputDecoration(
            //                   border: InputBorder.none,
            //                   labelText: 'Email',
            //                   suffixIcon: Padding(
            //                     padding: EdgeInsets.only(
            //                         top: Get.height * 0.01,
            //                         right: Get.width * 0.02),
            //                     child: Icon(Icons.mic_none_outlined, color: kBlueLight, size: 20),
            //                   ),
            //
            //                 ),
            //             ),
            //         ),
            //     ),
            // ),

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
    );
  }

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
}
