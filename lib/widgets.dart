import 'package:flutter/material.dart';

Container chatsystem({
  double height = 100,
  double width = 100,
  String message = '',
  String user = 'user',
  String type = '0',
}) {
  return Container(
    alignment: user == 'user' ? Alignment.bottomRight : Alignment.bottomLeft,
    margin: EdgeInsets.symmetric(
      vertical: height * 0.01,
      horizontal: width * .02,
    ),
    padding: EdgeInsets.symmetric(
      horizontal: width * 0.025,
      vertical: height * .005,
    ),
    constraints: BoxConstraints(
      minHeight: height * 0.05,
      maxWidth: width * 0.6,
    ),
    decoration: BoxDecoration(
      color: user == 'user' ? Colors.blue : Colors.grey,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(user == 'user' ? 20 : 0),
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(user == 'user' ? 0 : 20),
      ),
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        user != 'user' && type == 'No Prompt'
            ? "NO Prompt Engineering \n\n $message"
            : user != 'user' && type == 'With Prompt'
            ? "With Prompt Engineering \n\n $message"
            : message,
        style: TextStyle(fontSize: 14, color: Colors.black),
        textAlign: TextAlign.left,
      ),
    ),
  );
}
