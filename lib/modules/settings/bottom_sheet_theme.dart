import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/Provider.dart';
import 'package:todo/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../styles/colors.dart';

class BottomSheetTheme extends StatelessWidget {
  String Op1,Op2,type;
  BottomSheetTheme(this.Op1,this.Op2,this.type);
  late ListProvider provider;
  @override
  Widget build(BuildContext context) {
    provider=Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              if(type=='Mode')
              {
                  provider.ChangeThemeMode(ThemeMode.light);
                }
              else
              {
                provider.ChangeLanguage('en');
              }
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Op1,style: Theme.of(context).textTheme.titleMedium,),
                  if((type=='Mode'&&provider.themeMode==ThemeMode.light)||(type=='Language'&&provider.languageCode=='en'))
                  Icon(Icons.done,color: PrimaryColor,),
              ],
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              if(type=='Mode')
              {
                provider.ChangeThemeMode(ThemeMode.dark);
              }
              else
              {
                provider.ChangeLanguage('ar');
              }
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Op2,style: Theme.of(context).textTheme.titleMedium,),
                if((type=='Mode'&&provider.themeMode==ThemeMode.dark)||(type=='Language'&&provider.languageCode=='ar'))
                Icon(Icons.done,color: PrimaryColor,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
