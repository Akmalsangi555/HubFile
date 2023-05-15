
import 'package:flutter/material.dart';

class CollapsibleDrawer extends StatefulWidget {
  @override
  _CollapsibleDrawerState createState() => _CollapsibleDrawerState();
}

class _CollapsibleDrawerState extends State<CollapsibleDrawer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Home'),
            onTap: () {
              // Handle Home onTap event
            },
          ),
          ExpansionTile(
            title: Text('Categories'),
            onExpansionChanged: (expanded) {
              setState(() {
                isExpanded = expanded;
              });
            },
            children: [
              ListTile(
                title: Text('Category 1'),
                onTap: () {
                  // Handle Category 1 onTap event
                },
              ),
              ListTile(
                title: Text('Category 2'),
                onTap: () {
                  // Handle Category 2 onTap event
                },
              ),
            ],
          ),
          if (isExpanded)
            ListTile(
              title: Text('Extra Option 1'),
              onTap: () {
                // Handle Extra Option 1 onTap event
              },
            ),
          if (isExpanded)
            ListTile(
              title: Text('Extra Option 2'),
              onTap: () {
                // Handle Extra Option 2 onTap event
              },
            ),
        ],
      ),
    );
  }
}