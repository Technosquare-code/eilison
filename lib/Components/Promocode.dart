import 'package:dotted_border/dotted_border.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Screens/CongratulationScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';

class Promocode extends StatelessWidget {
  final bool applied;

  const Promocode({required this.applied});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Row(
          children: [
            DottedBorder(
              child: Container(
                height: 55,
                width: size.width / 3.8,
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "100%",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Buy 1 Get 1 Free",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Min cart value 100 INR",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  DottedBorder(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Promocode Name",
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MyButton(
              fontSize: 12,
              sizeHieght: 40,
              textColor: Colors.white,
              title: applied ? "Applied" : "Apply",
              color: applied ? secondaryColor : primaryColor,
              sizeWidth: size.width / 5,
              onTap: () {
                // if (applied == false) {
                //   Navigator.of(context).pushNamed(
                //     CongratulationScreen.routeName,
                //   );
                // }
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(color: Colors.grey),
      ],
    );
  }
}
