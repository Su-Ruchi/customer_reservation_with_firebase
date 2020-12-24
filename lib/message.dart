import 'package:fluttertoast/fluttertoast.dart';

class Message {
  static showMessage(String message){
    Fluttertoast.showToast(
        msg:message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM
    );
  }
}