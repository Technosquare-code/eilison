import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';

class SortProduct extends StatefulWidget {
  @override
  _SortProductState createState() => _SortProductState();
}

class _SortProductState extends State<SortProduct> {
  String selected = "";
  List item = ['Clear All', 'Price - Low to High', 'Price - Hight to Low'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 16),
          child: Row(
            children: [
              ImageIcon(
                AssetImage("assets/images/sort.png"),
                color: Colors.black,
                size: 15,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Sort",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(10, -40, 0),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 2,
          color: Colors.grey.shade400,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: item.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, i) => SortItem(
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

class SortItem extends StatelessWidget {
  final String title;
  final String selected;
  final Function(String?) onChanged;

  const SortItem({
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
