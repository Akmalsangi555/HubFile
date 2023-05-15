
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hub_file_flutter/utils/colors.dart';

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 05, vertical: 10),
      child: Container(
        width: Get.width *0.105,
        height: 30,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('${_item.imageData}', height: 10, width: 10,
                  fit: BoxFit.fill, color: _item.isSelected ? kBlueLight : Colors.black),
              SizedBox(width: Get.width* 0.01),
              Text(_item.buttonText, style: TextStyle(fontSize: 08,
                  color: _item.isSelected ? kBlueLight : Colors.black)),
            ],
          ),
        ),
        decoration: new BoxDecoration(
            color: _item.isSelected ? kAmberLight : Colors.grey.shade100,
            border: new Border.all(width: 1.0,
                color: _item.isSelected ? kAmberLight : Colors.grey.shade100),
            borderRadius: BorderRadius.circular(05)
        ),
      ),
    );
  }
}

class RadioItem2 extends StatelessWidget {
  final RadioModel _item;
  RadioItem2(this._item);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 05, vertical: 10),
      child: Container(
        width: Get.width *0.25,
        height: 30,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('${_item.imageData}', height: 10, width: 10,
                  fit: BoxFit.fill, color: _item.isSelected ? kBlueLight : Colors.black),
              SizedBox(width: Get.width* 0.01),
              Text(_item.buttonText, style: TextStyle(fontSize: 10,
                  color: _item.isSelected ? kBlueLight : Colors.black)),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: _item.isSelected ? Color(0xffFFDF00) : Colors.grey.shade100,
            border: Border.all(width: 1.0,
                color: _item.isSelected ? Color(0xffFFDF00) : Colors.grey.shade100),
            borderRadius: BorderRadius.circular(05)
        ),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String imageData;
  RadioModel(this.isSelected, this.buttonText, this.imageData);
}

// class RadioModel2 {
//   bool isSelected;
//   final String buttonText;
//   final String imageData;
//   RadioModel2(this.isSelected, this.buttonText, this.imageData);
// }