import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/Provider.dart';
import 'package:todo/models/Tasks.dart';
import 'package:todo/network/local/firebase.dart';
import 'package:todo/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../shared/reusableComponents/laoding_dialog.dart';


class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}
class _AddTaskState extends State<AddTask> {
  var titleController = TextEditingController();
  var DescriptionController = TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  DateTime selectedDate=DateTime.now();
 late ListProvider provider;
  @override
  Widget build(BuildContext context) {
    provider=Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context)!.addTask, style: Theme.of(context).textTheme.bodyText1?.copyWith(color:provider.themeMode==ThemeMode.light?BlackColor:WhiteColor )),
            SizedBox(
              height: 10,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(color:provider.themeMode==ThemeMode.light?BlackColor:WhiteColor ),
                      validator: (value){
                        if(value==null||value.trim()=='')
                        {
                          return AppLocalizations.of(context)!.errortitleMassage;
                        }
                        return null;
                      },
                      controller: titleController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: Text(AppLocalizations.of(context)!.taskTitle,),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: PrimaryColor,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: PrimaryColor,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(color:provider.themeMode==ThemeMode.light?BlackColor:WhiteColor ),
                      validator: (value){
                        if(value==null||value.trim()=='')
                        {
                          return AppLocalizations.of(context)!.errordescriptionMassage;
                        }
                        return null;
                      },
                      controller: DescriptionController,
                      keyboardType: TextInputType.text,
                      maxLines: 2,
                      decoration: InputDecoration(
                        label: Text(AppLocalizations.of(context)!.taskDescription),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: PrimaryColor,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: PrimaryColor,
                            )),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.selectTimeText,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color:provider.themeMode==ThemeMode.light?BlackColor:WhiteColor ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  SelectDate(context);
                },
                child: Text(
                  DateFormat.yMMMEd().format(selectedDate),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.normal, fontSize: 18),
                )),
            ElevatedButton(onPressed: () {
              if(formKey.currentState!.validate()) {
                Tasks task = Tasks(title: titleController.text,
                    description: DescriptionController.text,
                    date: DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch);
                ShowLaoding(context, AppLocalizations.of(context)!.lodingmassage, isCancellable: false);
                addTaskToFirestore(task).timeout(Duration(milliseconds: 500), onTimeout: (){
                  hideLoading(context);
                  ShowMessage(context,AppLocalizations.of(context)!.addTasksuccessfullymassage, () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, AppLocalizations.of(context)!.okbtn,isCancellable: false,negBtn: AppLocalizations.of(context)!.cancelbtn,fun1: (){
                    Navigator.pop(context);
                  });
                });
              }
            }, child: Text(AppLocalizations.of(context)!.addTaskbtn))
          ],
        ),
      ),
    );
  }

  void SelectDate(BuildContext context) async{
    DateTime? date=await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        locale: Locale(provider.languageCode),
        lastDate: DateTime.now().add(Duration(days: 365 * 20)));
    if(date==null) return;
    selectedDate=date;
    setState(() {

    });
  }
}
