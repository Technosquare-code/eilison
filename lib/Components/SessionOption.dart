import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';

class SessionOption extends StatefulWidget {
  @override
  _SessionOptionState createState() => _SessionOptionState();
}

class _SessionOptionState extends State<SessionOption> {
  String selected = "";
  List item = ['Edit Session', 'Delete Session'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Column(
          children: [
            OptionItem(
              title: 'Edit Session',
              selected: selected,
              onTapFunc: () {},
            ),
            OptionItem(
              title: 'Delete Session',
              selected: selected,
              onTapFunc: () {},
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
  final VoidCallback onTapFunc;

  const OptionItem({
    required this.title,
    required this.selected,
    required this.onTapFunc,
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
        onTap: () => onTapFunc,
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
