import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../managers/strings_manager.dart';

class Utils {
  // static void showProgressIndicator(BuildContext context) {
  //   AlertDialog alertDialog = const AlertDialog(
  //     backgroundColor: Colors.transparent, // No color
  //     elevation: 0,
  //     content: Center(
  //       child: CircularProgressIndicator(
  //         valueColor: AlwaysStoppedAnimation<Color>(ColorManager.primaryGreen),
  //       ),
  //     ),
  //   );
  //
  //   showDialog(
  //     barrierColor: Colors.white.withOpacity(0),
  //     // Remove Opacity
  //     barrierDismissible: false,
  //     // To not dismiss dialog when user click outside
  //     context: context,
  //     builder: (context) {
  //       return alertDialog;
  //     },
  //   );
  // }

  // static void showAlertDialog({
  //   required BuildContext context,
  //   required String message,
  //   required VoidCallback press,
  // }) {
  //   showDialog<String>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) => AlertDialog(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       title:  Text(
  //         LocaleKeys.attention.tr,
  //       ),
  //       content: Text(
  //         message,
  //         style: const TextStyle(
  //           fontSize: 13,
  //           height: 1.4,
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(),
  //           child:  Text(
  //             LocaleKeys.no.tr,
  //             style: const TextStyle(color: Colors.green),
  //           ),
  //         ),
  //         TextButton(
  //           onPressed: press,
  //           child:  Text(
  //             LocaleKeys.yes.tr,
  //             style: const TextStyle(color: Colors.red),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  static Future<bool?> showLeavingAppDialog(BuildContext context){
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title:  const Text(
          AppStrings.attention,
        ),
        content: const Text(
          AppStrings.doYouWantToExit,
          style: TextStyle(
            fontSize: 13,
            height: 1.4,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              AppStrings.no,
              style: TextStyle(color: Colors.green),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child:  const Text(
              AppStrings.yes,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  // Fluttertoast package
  static void showToast({
    required String message,
    required ToastStates state,
  }) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        // Show Long toast for 5 sec
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        webBgColor: chooseToastWebColor(state),
        textColor: Colors.white,
        fontSize: 16.0,
        webPosition: 'center',
      );

  static Color chooseToastColor(ToastStates state) {
    Color color;

    switch (state) {
      case ToastStates.success:
        color = Colors.green;
        break;
      case ToastStates.error:
        color = Colors.red;
        break;
      case ToastStates.warning:
        color = Colors.amber;
        break;
    }
    return color;
  }

  // For web
  static String chooseToastWebColor(ToastStates state) {
    String color;

    switch (state) {
      case ToastStates.success:
        color = "linear-gradient(to right, #008080, #008080)";
        break;
      case ToastStates.error:
        color = "linear-gradient(to right, #dc1c13, #dc1c13)";
        break;
      case ToastStates.warning:
        color = "linear-gradient(to right, #FFFF00, #FFFF00)";
        break;
    }
    return color;
  }

static void showSnackBar({
  required String errorMessage,
  required BuildContext context,
  bool isError = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        errorMessage,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: isError ? Colors.red : Colors.black,
      duration: const Duration(seconds: 2),
    ),
  );
}
}

enum ToastStates {
  success,
  error,
  warning,
}
