import 'package:flutter/material.dart';

class NavigationModel {
 final String? title;
 final IconData? icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Home", icon: Icons.home_outlined),
  NavigationModel(title: "Beneficiaries", icon: Icons.supervised_user_circle_rounded),
  NavigationModel(title: "Balance", icon: Icons.account_balance_outlined),
  NavigationModel(title: "Message", icon: Icons.message_outlined),
  NavigationModel(title: "Settings", icon: Icons.settings),
];