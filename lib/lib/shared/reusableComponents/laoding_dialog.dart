import 'package:flutter/material.dart';

void ShowLaoding(BuildContext context, String message,
    {bool isCancellable = true}) {
  showDialog(
      context: context,
      barrierDismissible: isCancellable,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Text(message),
              SizedBox(
                width: 15,
              ),
              CircularProgressIndicator(),
            ],
          ),
        );
      });
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void ShowMessage(BuildContext context, String message,VoidCallback fun,
    String posBtn, {bool isCancellable = true,String?negBtn,VoidCallback?fun1}) {
  showDialog(
      context: context,
      barrierDismissible: isCancellable,
      builder: (context) {
        List<Widget>actions=[
          TextButton(onPressed: fun, child: Text(posBtn)),
        ];
        if(negBtn!=null)
        {
          actions.add(TextButton(onPressed: fun1, child: Text(negBtn)));

        }
        return AlertDialog(
          title: Text(message),
          actions: actions,
        );
      });
}
