import 'package:flutter/material.dart';

void TaskBottomSheetFun(BuildContext context,Widget widgetName)
{
  showModalBottomSheet(context: context,
      isScrollControlled: true,
      builder: (context)
      {
        return Padding(
          padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: widgetName,
        );
      });
}