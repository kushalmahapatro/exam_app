import 'package:flutter/material.dart';
import 'package:exam_app/utils/ColorSwatch.dart';
export 'PreferenceManager.dart';

class Utils {
  static void snackBar(String message, BuildContext _scaffoldContext) {
    Scaffold.of(_scaffoldContext)
        .showSnackBar(new SnackBar(content: new Text(message)));
  }

  static void displaySnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message, BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 400));
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: new Text(message),
    ));
  }

  static Icon searchIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  static Icon notificationIcon = new Icon(
    Icons.notifications,
    color: Colors.white,
  );
  static Icon filterIcon = new Icon(
    Icons.filter_list,
    color: Colors.white,
  );

  static Widget buildBar(BuildContext context, String appBarTitle,
      List<Icon> iconButtons, List<Function> onClickListeners) {
    return new AppBar(
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        appBarTitle,
        style: new TextStyle(color: Colors.white),
      ),
      brightness: Brightness.dark,
      backgroundColor: primaryColor,
      actions: iconButtons != null ?getActions(iconButtons, onClickListeners) : null,
    );
  }

  static List<Widget> getActions(
      List<Icon> iconButtons, List<Function> onClickListeners) {
    List<Widget> widget = new List<Widget>();
    for (int i = 0; i < iconButtons.length; i++) {
      widget.add(IconButton(
        icon: iconButtons[i],
        onPressed: onClickListeners[i],
      ));
    }
    return widget;
  }

// The check whether the email id is valid or not
  static bool isValidMail(String email2) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(email2);
  }

}
