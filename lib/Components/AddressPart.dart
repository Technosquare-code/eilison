import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';

class AddressPart extends StatefulWidget {
  @override
  _AddressPartState createState() => _AddressPartState();
}

class _AddressPartState extends State<AddressPart> {
  String selectedAddress = "";
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (ctx, i) => SelectAddress(
        index: i.toString(),
        selectedIndex: selectedAddress,
        onTap: () {
          selectedAddress = i.toString();
          setState(() {});
        },
      ),
    );
  }
}

class SelectAddress extends StatelessWidget {
  final String index;
  final String selectedIndex;
  final VoidCallback onTap;

  const SelectAddress({
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Transform(
            transform: Matrix4.translationValues(-10, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform(
                  transform: Matrix4.translationValues(0, -10, 0),
                  child: Checkbox(
                    value: index == selectedIndex ? true : false,
                    onChanged: (_) => onTap(),
                    activeColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.blueGrey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: onTap,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Manoj Saini",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Technosquare IT Solution Private Limited, Near Bahagat Singh Circle, Pliani, 333031, Rajestan",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
