import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/layout/add_task.dart';
import 'package:todo/models/Provider.dart';
import 'package:todo/modules/settings/settings.dart';
import 'package:todo/modules/tasks_list/tasks_list.dart';
import 'package:todo/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../shared/reusableComponents/BottomSheet.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "Home";
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late ListProvider provider;
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    provider=Provider.of(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TaskBottomSheetFun(context,AddTask());
        },
        child: Icon(Icons.add),
        shape: StadiumBorder(
            side: BorderSide(
              color: provider.themeMode==ThemeMode.light?WhiteColor:SecondaryDarkColor,
              width: 3,
            )),
      ),
      bottomNavigationBar: BottomAppBar(
        color: provider.themeMode==ThemeMode.light?WhiteColor:SecondaryDarkColor,
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          currentIndex: currentindex,
          onTap: (index) {
            currentindex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 35,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 35,
                ),
                label: ''),
          ],
        ),
      ),
      body: tabs[currentindex],
    );
  }
  // void TaskBottomSheetFun(int index)
  // {
  //   showModalBottomSheet(context: context,
  //       isScrollControlled: true,
  //       builder: (context)
  //       {
  //         return Padding(
  //           padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //           child: TaskBottomSheet[index],
  //         );
  //       });
  // }
  List<Widget> tabs = [TasksListTab(), SettingsTab()];
}
