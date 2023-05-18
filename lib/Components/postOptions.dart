import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';

class postoptions extends StatefulWidget {
  @override
  _postoptionsState createState() => _postoptionsState();
}

class _postoptionsState extends State<postoptions> {
  String selected = "";
  final List options = ['Report', 'Edit', 'Delete'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        OptionItem(
          icon: Icons.report,
          title: 'Report',
          selected: selected,
          onChanged: (s) {
            selected = s.toString();
            setState(() {});
          },
        ),
        OptionItem(
          title: 'Edit',
          icon: Icons.edit,
          selected: selected,
          onChanged: (s) {
            selected = s.toString();
            setState(() {});
          },
        ),
        OptionItem(
          icon: Icons.delete,
          title: 'Delete',
          selected: selected,
          onChanged: (s) {
            selected = s.toString();
            setState(() {});
          },
        ),
        // ListView.builder(
        //   shrinkWrap: true,
        //   itemCount: options.length,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemBuilder: (ctx, i) =>
        //   OptionItem(
        //     title: options[i],
        //     selected: selected,
        //     onChanged: (s) {
        //       selected = s.toString();
        //       setState(() {});
        //     },
        //   ),
        // ),
      ],
    );
  }
}

class OptionItem extends StatelessWidget {
  final String title;
  final String selected;
  final Function(String?) onChanged;
  final IconData? icon;
  const OptionItem({
    required this.title,
    required this.selected,
    required this.onChanged,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(color: Colors.grey.shade400, width: 0.6),
      //   ),
      // ),
      child: ListTile(
        style: ListTileStyle.drawer,
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.grey.withOpacity(0.2),
          child: Icon(
            icon,
            size: 18,
            color: Colors.black,
          ),
        ),
        dense: true,
        onTap: () => onChanged(title),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
