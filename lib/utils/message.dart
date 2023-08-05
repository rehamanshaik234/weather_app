import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Message{

  static snackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor : Colors.red,
            content: Text(message))
    );
  }
  static Future<bool?> toast(String message,Color color){
    return Fluttertoast.showToast(msg: "${message}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.transparent,
        textColor: color,
        fontSize: 16.0);
  }

}