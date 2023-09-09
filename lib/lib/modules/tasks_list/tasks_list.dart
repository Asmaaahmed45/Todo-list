import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/Provider.dart';
import 'package:todo/modules/tasks_list/task_item.dart';
import 'package:todo/styles/colors.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import '../../models/Tasks.dart';
import '../../network/local/firebase.dart';

class TasksListTab extends StatefulWidget {
  @override
  State<TasksListTab> createState() => _TasksListTabState();
}

class _TasksListTabState extends State<TasksListTab> {
  DateTime selectedDate=DateTime.now();
  late ListProvider provider;
  @override
  Widget build(BuildContext context) {
    provider=Provider.of(context);
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          height: 90,
          width: 60,
          initialSelectedDate: selectedDate,
          selectedTextColor: provider.themeMode==ThemeMode.light?WhiteColor:BlackColor,
          selectionColor: PrimaryColor ,
          dateTextStyle: TextStyle(
            color: provider.themeMode==ThemeMode.light?BlackColor:WhiteColor,
          ),
          monthTextStyle: TextStyle(
            fontWeight: FontWeight.normal,
              color: provider.themeMode==ThemeMode.light?BlackColor:WhiteColor,
          ),
          dayTextStyle: TextStyle(
            fontWeight: FontWeight.normal,
              color: provider.themeMode==ThemeMode.light?BlackColor:WhiteColor,
          ),
          onDateChange: (date)=>
          {
                selectedDate=date,
                setState(() {}),
          },
          locale: provider.languageCode,
        ),
        // CalendarTimeline(
        //   initialDate: selectedDate,
        //   firstDate: DateTime.now().subtract(Duration(days: 365)),
        //   lastDate: DateTime.now().add(Duration(days: 365*20)),
        //   onDateSelected: (date)=>
        //   {
        //     selectedDate=date,
        //     setState(() {}),
        //   },
        //   leftMargin: 20,
        //   monthColor:provider.themeMode==ThemeMode.light?BlackColor:WhiteColor,
        //   dayColor:provider.themeMode==ThemeMode.light?BlackColor:WhiteColor,
        //   activeDayColor:provider.themeMode==ThemeMode.light?WhiteColor:BlackColor,
        //   activeBackgroundDayColor: PrimaryColor,
        //   dotsColor: provider.themeMode==ThemeMode.light?WhiteColor:BlackColor,
        //   selectableDayPredicate: (date) =>  true,
        //   locale: provider.languageCode,
        // ),
        StreamBuilder<QuerySnapshot<Tasks>>(
          stream: getTaskToFirestore(selectedDate),
          builder:(context, snapshot){
            if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator());
            }
            if(snapshot.hasError)
            {
              return Text('Something went wrong');
            }
            var tasks=snapshot.data?.docs.map((tasks) => tasks.data()).toList()??[];
            return Expanded(
              child: ListView.builder(itemBuilder:(c,index)
              {
                return TaskItem(tasks[index]);
              },itemCount: tasks.length,),
            );
          },)
      ],
    );
  }
}
