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
  List item = ['Edit Session', 'Delete Session'];
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
                title: 'Edit Session',
                selected: selected,
              ),
            ),
            InkWell(
              onTap: () {
                mainScreenController.deleteSession(context,
                    mainScreenController.sessionList[widget.index!].id);
              },
              child: OptionItem(
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

  const OptionItem({
    required this.title,
    required this.selected,
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
