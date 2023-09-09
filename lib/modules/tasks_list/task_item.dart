import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../layout/Edit_task.dart';
import '../../models/Provider.dart';
import '../../models/Tasks.dart';
import '../../network/local/firebase.dart';
import '../../shared/reusableComponents/BottomSheet.dart';

class TaskItem extends StatelessWidget {
  Tasks task;
  late ListProvider provider;
  TaskItem(this.task);
  @override
  Widget build(BuildContext context) {
    provider=Provider.of(context);
    return Slidable(
      startActionPane: ActionPane(motion:DrawerMotion(),
          extentRatio: 4/10
          ,children: [
            SlidableAction(onPressed: (context){
              deleteTaskFromFirestore(task);
            },
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: AppLocalizations.of(context)!.deleteBtn,
              borderRadius: BorderRadius.circular(12),
            ),
            SlidableAction(onPressed: (context){
              TaskBottomSheetFun(context,EditTask(task));
            },
              backgroundColor: PrimaryColor,
              icon: Icons.edit,
              label: AppLocalizations.of(context)!.editBtn,
              borderRadius: BorderRadius.circular(12),
            ),
          ]),
      child: Container(
        margin: EdgeInsets.only(bottom: 5,top: 5),
        padding: EdgeInsets.symmetric(horizontal: 6,vertical: 6),
        decoration: BoxDecoration(
          color: provider.themeMode==ThemeMode.light?WhiteColor:SecondaryDarkColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
              width:3,
              height: 55,
              decoration: BoxDecoration(
                  color: task.isDone==true?GreenColor:PrimaryColor,
                  borderRadius: BorderRadius.circular(12)
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title,style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.normal,fontSize: 22,color:task.isDone==true?GreenColor:PrimaryColor),),
                  SizedBox(height: 5,),
                  Text(task.description,style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.normal,fontSize: 18,color: provider.themeMode==ThemeMode.light?BlackColor:WhiteColor,
                  ),),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                task.isDone=true;
                updateTaskFromFirestore(task);
              },
                  child:task.isDone==true?Text(AppLocalizations.of(context)!.done,style: Theme.of(context).textTheme.titleSmall,):Container(
                      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: PrimaryColor,
                      ),
                      child: Icon(Icons.done,color: WhiteColor,)
                  ),
            ),
          ],
        ),
      ),
    );
  }
}