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
        ListView.builder(
          shrinkWrap: true,
          itemCount: item.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, i) => OptionItem(
            title: item[i],
            selected: selected,
            onChanged: (s) {
              selected = s.toString();
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}

class OptionItem extends StatelessWidget {
  final String title;
  final String selected;
  final Function(String?) onChanged;

  const OptionItem({
    required this.title,
    required this.selected,
    required this.onChanged,
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
        trailing: Radio(
          value: title,
          splashRadius: 5,
          groupValue: selected,
          onChanged: onChanged,
          activeColor: primaryColor,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }
}
