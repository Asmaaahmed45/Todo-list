import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/Provider.dart';
import 'package:todo/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../shared/reusableComponents/Settings_bottom_sheet.dart';


class SettingsTab extends StatelessWidget {
  late ListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium,
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet(context,
                  AppLocalizations.of(context)!.englishMode,
                  AppLocalizations.of(context)!.arabicMode, 'Language');
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: PrimaryColor,
                ),
                color: provider.themeMode == ThemeMode.light
                    ? WhiteColor
                    : SecondaryDarkColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.languageCode == 'en' ? AppLocalizations.of(
                        context)!.englishMode : AppLocalizations.of(context)!
                        .arabicMode,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                        fontWeight: FontWeight.normal, color: PrimaryColor),
                  ),
                  Icon(Icons.arrow_drop_down_outlined, color: PrimaryColor,),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.mode,
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium,
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet(context, AppLocalizations.of(context)!.lightMode, AppLocalizations.of(context)!.darkMode, 'Mode');
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: PrimaryColor,
                ),
                color: provider.themeMode == ThemeMode.light
                    ? WhiteColor
                    : SecondaryDarkColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.themeMode == ThemeMode.light &&(provider.languageCode=='en'||provider.languageCode=='ar')?AppLocalizations.of(context)!.lightMode
                    :AppLocalizations.of(context)!.darkMode,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                        fontWeight: FontWeight.normal, color: PrimaryColor),
                  ),
                  Icon(Icons.arrow_drop_down_outlined, color: PrimaryColor,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

