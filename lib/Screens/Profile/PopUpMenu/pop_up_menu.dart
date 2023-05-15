import 'package:flutter/material.dart';

class PopupMenuExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup Menu Example'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item selection
              if (value == 'option1') {
                // Handle option 1 selection
              } else if (value == 'option2') {
                // Handle option 2 selection
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: 'option1',
                child: Text('Option 1'),
              ),
              PopupMenuItem<String>(
                value: 'option2',
                child: Text('Option 2'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text('Hello, world!'),
      ),
    );
  }
}