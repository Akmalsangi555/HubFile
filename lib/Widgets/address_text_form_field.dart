import 'package:flutter/material.dart';
import 'package:hub_file_flutter/utils/colors.dart';

class AddressTextFormField {
  TextFormField getCustomEditTextArea(
      {String labelValue = "",
        String hintValue = "",
        String helperText = "",
        bool? validation,
        TextEditingController? controller,
        TextInputType keyboardType = TextInputType.text,
        TextStyle? textStyle,
        String? validationErrorMsg}) {
    TextFormField textFormField = TextFormField(
      keyboardType: keyboardType,
      style: textStyle,
      controller: controller,
      validator: (String? value) {
        if (validation!) {
          if (value!.isEmpty) {
            return validationErrorMsg;
          }
        }
      },
      decoration: InputDecoration(
          helperText: helperText,
          labelText: labelValue,
          hintText: hintValue,
          // fillColor: Colors.grey.shade100,
          fillColor: Color(0xffF6F6F6),
          filled: true,
          // labelStyle: textStyle,
          // hintStyle: TextStyle(color: Color(0xff8D8D8D)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xffF6F6F6))
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xffF6F6F6))
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffF6F6F6)),
            borderRadius: BorderRadius.circular(10)
        ),
        // fillColor: Colors.green,
        labelStyle: TextStyle(color: Colors.grey.shade400, fontSize: 11),
        hintStyle: TextStyle(color: kBlue),
      ),
    );
    return textFormField;
  }
}

class WebAddressTextFormField {
  TextFormField getCustomEditTextArea(
      {String labelValue = "",
        String hintValue = "",
        String helperText = "",
        bool? validation,
        TextEditingController? controller,
        TextInputType keyboardType = TextInputType.text,
        TextStyle? textStyle,
        String? validationErrorMsg}) {
    TextFormField textFormField = TextFormField(
      keyboardType: keyboardType,
      style: textStyle,
      controller: controller,
      validator: (String? value) {
        if (validation!) {
          if (value!.isEmpty) {
            return validationErrorMsg;
          }
        }
      },
      decoration: InputDecoration(
        helperText: helperText,
        labelText: labelValue,
        hintText: hintValue,
        fillColor: Colors.white,
        filled: true,
        // labelStyle: textStyle,
        // hintStyle: TextStyle(color: Color(0xff8D8D8D)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Color(0xff9AC2F7))
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: kBlue)
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: kBlue),
            borderRadius: BorderRadius.circular(5)
        ),
        // fillColor: Colors.green,
        labelStyle: TextStyle(color: Colors.grey.shade500),
        hintStyle: TextStyle(color: Colors.grey.shade500),
      ),
    );
    return textFormField;
  }
}