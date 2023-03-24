import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/MyDropdown.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddSessionScreen extends StatefulWidget {
  static const routeName = "AddSessionScreen";
  @override
  _AddSessionScreenState createState() => _AddSessionScreenState();
}

class _AddSessionScreenState extends State<AddSessionScreen> {
  String? type;

  List<String> sessionTypes = [
    'Low Workout',
    'Hard Workout',
    'Lowerbody Workout',
    'Fullbody Workout',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: Text(
          "Add New Session",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: secondaryColor,
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.camera_fill,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Text(
              "Session Name",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            InputField(
              size: 30,
              hint: "Enter Name",
              type: TextInputType.name,
              color: Colors.grey.shade50,
              borderColor: Colors.grey.shade300,
            ),
            const SizedBox(height: 15),
            Text(
              "Session Agenda",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            InputField(
              size: 30,
              minLine: 5,
              maxLine: 8,
              borderRadius: 15,
              hint: "Enter Agenda",
              type: TextInputType.name,
              color: Colors.grey.shade50,
              borderColor: Colors.grey.shade300,
            ),
            const SizedBox(height: 15),
            Text(
              "Session  Start Date",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            InputField(
              size: 30,
              hint: "Enter Date",
              type: TextInputType.datetime,
              color: Colors.grey.shade50,
              borderColor: Colors.grey.shade300,
            ),
            const SizedBox(height: 15),
            Text(
              "Session Start Time",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            InputField(
              size: 30,
              hint: "Enter Time",
              type: TextInputType.datetime,
              color: Colors.grey.shade50,
              borderColor: Colors.grey.shade300,
            ),
            const SizedBox(height: 15),
            Text(
              "Duration (min)",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            InputField(
              size: 30,
              hint: "Enter Duration",
              type: TextInputType.number,
              color: Colors.grey.shade50,
              borderColor: Colors.grey.shade300,
            ),
            const SizedBox(height: 15),
            Text(
              "Session Type",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            MyDropdown(
              size: 21,
              value: type,
              padding: 12,
              hint: "Select Type",
              title: sessionTypes,
              items: sessionTypes,
              width: size.width / 1.18,
              color: Colors.grey.shade50,
              borderColor: Colors.grey.shade300,
              onChanged: (t) {
                type = t.toString();
                setState(() {});
              },
            ),
            const SizedBox(height: 15),
            Text(
              "Session Description",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            InputField(
              size: 30,
              minLine: 5,
              maxLine: 8,
              borderRadius: 15,
              hint: "Enter Description",
              type: TextInputType.name,
              color: Colors.grey.shade50,
              borderColor: Colors.grey.shade300,
            ),
            const SizedBox(height: 25),
            MyButton(
              fontSize: 16,
              title: "Save",
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              color: primaryColor,
              sizeHieght: 50,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
