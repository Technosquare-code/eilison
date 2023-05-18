import 'package:elison/Components/deletePopup.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/mainscreen_controller.dart';
import 'package:elison/controllers/trainer/train_home_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionOption extends StatefulWidget {
  int? index;
  SessionOption({this.index});
  @override
  _SessionOptionState createState() => _SessionOptionState();
}

class _SessionOptionState extends State<SessionOption> {
  final mainScreenController = Get.find<TrainerHomeController>();
  String selected = "";
  // List item = ['Edit Session', 'Delete Session'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Column(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed('/add-session', arguments: [true, widget.index]);
              },
              child: OptionItem(
                icon: Icons.edit,
                title: 'Edit Session',
                selected: selected,
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DeleteConfirmationPopup();
                  },
                ).then((value) async {
                  if (value != null && value) {
                    mainScreenController.deleteSession(context,
                        mainScreenController.sessionList[widget.index!].id);
                  } else {}
                });

                // mainScreenController.deleteSession(context,
                //     mainScreenController.sessionList[widget.index!].id);
              },
              child: OptionItem(
                icon: Icons.delete,
                title: 'Delete Session',
                selected: selected,
              ),
            ),
          ],
        )
        // ListView.builder(
        //   shrinkWrap: true,
        //   itemCount: item.length,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemBuilder: (ctx, i) => ,
        // ),
      ],
    );
  }
}

class OptionItem extends StatelessWidget {
  final String title;
  final String selected;
  final IconData? icon;
  const OptionItem({
    required this.title,
    required this.selected,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade400, width: 0.6),
        ),
      ),
      child: ListTile(
        dense: true,
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.grey.withOpacity(0.2),
          child: Icon(
            icon,
            size: 18,
            color: Colors.black,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
        // trailing: Radio(
        //   value: title,
        //   splashRadius: 5,
        //   groupValue: selected,
        //   onChanged: onChanged,
        //   activeColor: primaryColor,
        //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        // ),
      ),
    );
  }
}
