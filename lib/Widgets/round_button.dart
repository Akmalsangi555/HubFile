
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({
    Key? key,
    this.buttonColor,
    this.textColor,
    required this.title, required this.onPressed,
    this.height = 50, this.width = 50,
    this.loading  = false

  }) : super(key: key);


  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPressed;
  final Color? textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: loading ? Center(child: CircularProgressIndicator()):
        Center(child: Text(title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
        )),
      ),
    );
  }
}

class RoundButton2 extends StatelessWidget {
  RoundButton2({
    Key? key,
    this.buttonColor,
    this.textColor,
    required this.title, required this.onPressed,
    this.height = 50, this.width = 50,
    this.loading  = false

  }) : super(key: key);


  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPressed;
  final Color? textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: loading ? Center(child: CircularProgressIndicator()):
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: Text(title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.grey.shade300, fontSize: 12),
          ),
        ),
      ),
    );
  }
}

class WebRoundButton extends StatelessWidget {
  WebRoundButton({
    Key? key,
    this.buttonColor,
    this.textColor,
    required this.title, required this.onPressed,
    this.height = 50, this.width = 50,
    this.loading  = false

  }) : super(key: key);


  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPressed;
  final Color? textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: loading ? Center(child: CircularProgressIndicator()):
        Center(child: Text(title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
        )),
      ),
    );
  }
}