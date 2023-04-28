import 'dart:io';

import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/MyDropdown.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/profile/address/add_address_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../controllers/trainer/add_session_controller.dart';

class AddSessionScreen extends StatefulWidget {
  static const routeName = "AddSessionScreen";
  @override
  _AddSessionScreenState createState() => _AddSessionScreenState();
}

class _AddSessionScreenState extends State<AddSessionScreen> {
  String? type;
  File? image;

  // final pref = GetStorage();
  final addsessionController = Get.put(AddSessionController());

  getGalaryImage() async {
    dynamic imageData = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );
    setState(() {
      image = File(imageData.path);
    });
  }

  getCamImage() async {
    dynamic imageData =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      image = File(imageData.path);
    });
  }

  void openOptions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Profile photo',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await getCamImage();
                          if (image != null) {
                            // editprofileController.uploadProfileImage(
                            //     image!.path, context);
                            Navigator.pop(context);
                          }
                        },
                        icon: const Icon(Icons.photo_camera),
                      ),
                      const Text('Camera')
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await getGalaryImage();
                          if (image != null) {
                            print('gallery image');
                            if (image != null) {
                              // editprofileController.uploadProfileImage(
                              //     image!.path, context);
                              Navigator.pop(context);
                            }
                          }
                        },
                        icon: const Icon(Icons.photo),
                      ),
                      const Text('Gallery')
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  final _formKey = GlobalKey<FormState>();

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
        child: Obx(() {
          return Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      image != null
                          ? CircleAvatar(
                              radius: 50,
                              // backgroundColor: secondaryColor,
                              backgroundImage: FileImage(image!),
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundColor: secondaryColor,
                            ),
                      Container(
                        child: IconButton(
                          onPressed: () {
                            openOptions(context);
                          },
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
                  controller: addsessionController.name,
                  size: 30,
                  hint: "Enter Name",
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'Name required')
                  ]),
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
                  controller: addsessionController.agenda,
                  maxLine: 8,
                  borderRadius: 15,
                  hint: "Enter Agenda",
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'Agenda required')
                  ]),
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
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate != null) {
                      String formattedDate =
                          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                      addsessionController.startDate.text = formattedDate;
                    }
                  },
                  readOnly: true,
                  hint: "Enter Date",
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'Date required')
                  ]),
                  controller: addsessionController.startDate,
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
                  controller: addsessionController.startTime,
                  hint: "Enter Time",
                  onTap: () async {
                    TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (selectedTime != null) {
                      String formattedTime = DateFormat.Hm().format(DateTime(
                          2021, 1, 1, selectedTime.hour, selectedTime.minute));
                      addsessionController.startTime.text = formattedTime;
                    }
                  },
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'Time required')
                  ]),
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
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'Duration required')
                  ]),
                  hint: "Enter Duration",
                  controller: addsessionController.duration,
                  type: TextInputType.number,
                  color: Colors.grey.shade50,
                  borderColor: Colors.grey.shade300,
                ),
                const SizedBox(height: 15),
                Text(
                  "Zoom Link",
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
                  hint: "Enter Zoom Link",
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'Zoom Link required')
                  ]),
                  controller: addsessionController.zoomlink,
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
                addsessionController.isLoading.value
                    ? CircularProgressIndicator()
                    : MyDropdown(
                        size: 21,
                        value: type,
                        padding: 12,
                        hint: "Select Type",
                        isclass: true,
                        title: sessionTypes,
                        items: addsessionController.sessionTypeList,
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
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'Description required')
                  ]),
                  controller: addsessionController.description,
                  borderRadius: 15,
                  hint: "Enter Description",
                  type: TextInputType.name,
                  color: Colors.grey.shade50,
                  borderColor: Colors.grey.shade300,
                ),
                const SizedBox(height: 25),
                MyButton(
                  fontSize: 16,
                  title: addsessionController.isSaving.value
                      ? "Loading..."
                      : "Save",
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                  color: primaryColor,
                  sizeHieght: 50,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      addsessionController.createSession(
                        context,
                        sessionId: type!,
                        imgpath: image != null ? image!.path : '',
                      );
                    }
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
