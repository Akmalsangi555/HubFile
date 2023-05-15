//
// ListView.builder(
// shrinkWrap: true,
// physics: NeverScrollableScrollPhysics(),
// itemCount: peopleActivitiesList.length,
// itemBuilder: (BuildContext context, int index) {
// if (index == 1) {
// // Return ListView at index 1
// return Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text("#HipHoplover", style: TextStyle(fontSize: 12, color: Colors.grey, fontFamily: 'Gontserrat-Regular')),
// Icon(Icons.more_vert_outlined, color: Colors.black38),
// ],
// ),
// SizedBox(height: 10),
// Container(
// height: 125,
// child: ListView.builder(
// scrollDirection: Axis.horizontal,
// // physics: BouncingScrollPhysics(),
// itemCount: hipHopUsersList.length,
// itemBuilder: (context, index) {
// return Padding(
// padding: EdgeInsets.only(right: 15),
// child: Container(
// height: 120, width: 90,
// decoration: BoxDecoration(
// color: Colors.grey.shade100,
// border: Border.all(
// color: Colors.grey.shade100,
// width: 1.0,
// ),
// borderRadius: BorderRadius.circular(5),
// ),
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 05, vertical: 07),
// child: Column(
// children: [
// Image.asset(hipHopUsersList[index].userImage, height: 65, width: 65),
// SizedBox(height: Get.height*0.015),
// Text(hipHopUsersList[index].userName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
// SizedBox(height: Get.height*0.01),
// Text(hipHopUsersList[index].userInterest, style: TextStyle(fontSize: 08, color: Colors.grey.shade500),),
// ],
// ),
// ),
// ),
// );
// }),
// ),
// SizedBox(height: 20),
// ],
// );
// } else {
// // Return regular list item
// return Column(
// children: [
// Container(
// height: 200,
// width: double.infinity,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(05),
// image: DecorationImage(
// image: AssetImage(peopleActivitiesList[index].concertImage),
// fit: BoxFit.cover)),
// child: Padding(
// padding: EdgeInsets.only(top: 10, left: Get.width*0.01, right: Get.width*0.01),
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Stack(
// children: [
// CircleAvatar(
// radius: 17.5,
// backgroundImage: AssetImage(peopleActivitiesList[index].userImage),
// ),
// Positioned(
// top: 0,
// left: 01,
// child: Container(
// height: 15,
// width: 15,
// padding: EdgeInsets.all(02),
// decoration: BoxDecoration(
// color: kBlue,
// borderRadius: BorderRadius.circular(50)),
// child: Text('1', style: TextStyle(color: kWhite, fontSize: 10), textAlign: TextAlign.center),
// ),
// ),
// ],
// ),
// SizedBox(width: Get.width*0.002),
// Padding(
// padding: EdgeInsets.only(top: 5),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(peopleActivitiesList[index].userName, style: TextStyle(
// color: Colors.white, fontSize: 12)),
// Text(peopleActivitiesList[index].userAddress, style: TextStyle(
// color: Colors.white, fontSize: 6)),
// ],
// ),
// ),
// Spacer(),
// Padding(
// padding: EdgeInsets.only(top: 5),
// child: Icon(Icons.more_vert,color: Colors.white),
// ),
// ],
// ),
// ),
// ),
// SizedBox(height: 7),
// Padding(
// padding: EdgeInsets.only(
// bottom: 10),
// child: Row(
// children: [
// Icon(Icons.favorite_border, color: Colors.grey.shade300, size: 25),
// SizedBox(width: Get.width * 0.02),
// Icon(Icons.messenger_outline, color: Colors.grey.shade300, size: 25),
// SizedBox(width: Get.width * 0.02),
// // u_icon
// Icon(Icons.add, color: Colors.grey.shade300, size: 25),
// SizedBox(width: Get.width * 0.02),
// Spacer(),
// Text('#hiphop #music #lifestyle', maxLines: 5, style: TextStyle(
// fontSize: 08, color: Colors.black38)),
// ],
// ),
// ),
// ],
// );
// }
// },
// ),