import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/Provider.dart';
import '../models/Tasks.dart';
import '../network/local/firebase.dart';
import '../shared/reusableComponents/laoding_dialog.dart';
import '../styles/colors.dart';


class EditTask extends StatefulWidget {
  Tasks tasks;
  EditTask(this.tasks);
  @override
  State<EditTask> createState() => _EditTaskState(tasks);
}
class _EditTaskState extends State<EditTask> {
  Tasks tasks1;
  _EditTaskState(this.tasks1);
  late ListProvider provider;
 late TextEditingController titleController =TextEditingController(text: tasks1.title);
 late TextEditingController DescriptionController=TextEditingController(text: tasks1.description);
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
 late DateTime selectedDate=DateUtils.dateOnly(DateTime.fromMicrosecondsSinceEpoch(tasks1.date));
  @override
  Widget build(BuildContext context) {
    provider=Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppLocalizations.of(context)!.editTask, style: Theme.of(context).textTheme.bodyText1?.copyWith(color:provider.themeMode==ThemeMode.light?BlackColor:WhiteColor )),
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
                tasks1.title=titleController.text;
                tasks1.description=DescriptionController.text;
                tasks1.date=DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch;
                // Tasks task = Tasks(title: titleController.text,
                //     description: DescriptionController.text,
                //     date: DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch);
                ShowLaoding(context, AppLocalizations.of(context)!.lodingmassage, isCancellable: false);
                updateTaskFromFirestore(tasks1).timeout(Duration(milliseconds: 500), onTimeout: (){
                  hideLoading(context);
                  ShowMessage(context,AppLocalizations.of(context)!.editTasksuccessfullymassage, () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  }, AppLocalizations.of(context)!.okbtn,isCancellable: false,negBtn: AppLocalizations.of(context)!.cancelbtn,fun1: (){
                  Navigator.pop(context);
                  });
                });
              }
            }, child: Text(AppLocalizations.of(context)!.saveChanges))
          ],
        ),
      ),
    );
  }

  void SelectDate(BuildContext context) async{
    DateTime? date=await showDatePicker(
        context: context,
        initialDate: selectedDate,
        locale: Locale(provider.languageCode),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365 * 20)));
    if(date==null) return;
    selectedDate=date;
    setState(() {

    });
  }
}