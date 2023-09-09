import 'package:flutter/material.dart';

import '../../modules/settings/bottom_sheet_theme.dart';

void showThemeBottomSheet(BuildContext context,String op1,String op2,String type)
{
  showModalBottomSheet(context: context, builder:(context)
  {
    return BottomSheetTheme(op1,op2,type);
  });
}