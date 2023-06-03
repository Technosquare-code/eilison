import 'dart:io';

import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/MyDropdown.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/edit_profile_controller.dart';
import 'package:elison/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/customer/mainscreen_controller.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = "EditProfileScreen";
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final editprofileController = Get.put(EditProfileController());
  final mainscreenController = Get.find<MainScreenController>();

  final _formKey = GlobalKey<FormState>();
  File? image;

  // final pref = GetStorage();

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
                            editprofileController.uploadProfileImage(
                                image!.path, context);
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
                              editprofileController.uploadProfileImage(
                                  image!.path, context);
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
          ),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 15),
        child: Obx(() {
          return Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                editprofileController.ispictureLoading.value
                    ? Center(
                        child: CircleAvatar(
                          radius: 60,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Center(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            mainscreenController.userdetailList.isNotEmpty
                                ? mainscreenController.userdetailList[0].data
                                            .profilePicture !=
                                        null
                                    ? CircleAvatar(
                                        radius: 60,
                                        backgroundColor: secondaryColor,
                                        backgroundImage: NetworkImage(mainUrl +
                                            imageUrl +
                                            mainscreenController
                                                .userdetailList[0]
                                                .data
                                                .profilePicture!),
                                      )
                                    : CircleAvatar(
                                        radius: 60,
                                        backgroundColor: secondaryColor,
                                        backgroundImage: AssetImage(
                                            "assets/images/profIcon.png"),
                                      )
                                : CircleAvatar(
                                    radius: 60,
                                    backgroundColor: secondaryColor,
                                    backgroundImage: AssetImage(
                                        "assets/images/profIcon.png"),
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
                  "Full Name",
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
                  color: Colors.grey.shade50,
                  size: 50,
                  controller: editprofileController.name,
                  borderColor: Colors.grey.shade300,
                  hint: "Enter Your Name",
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Full Name required')]),
                  type: TextInputType.name,
                  icon: Icons.person,
                ),
                const SizedBox(height: 15),
                Text(
                  "Phone",
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
                  color: Colors.grey.shade50,
                  size: 50,
                  controller: editprofileController.phoneNo,
                  borderColor: Colors.grey.shade300,
                  hint: "Enter Your Phone",
                  type: TextInputType.phone,
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Phone Number required')]),
                  icon: Icons.phone_android,
                ),
                const SizedBox(height: 15),
                Text(
                  "Email Address",
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
                  color: Colors.grey.shade50,
                  size: 50,
                  controller: editprofileController.email,
                  borderColor: Colors.grey.shade300,
                  hint: "Enter Your Email",
                  validator: MultiValidator([
                    EmailValidator(
                      errorText: 'Please enter valid email',
                    ),
                    RequiredValidator(errorText: 'Email required')
                  ]),
                  type: TextInputType.emailAddress,
                  icon: Icons.mail,
                ),
                const SizedBox(height: 15),
                Text(
                  "Gender",
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
                  value: editprofileController.gender.value,
                  items: ["Male", "Female"],
                  title: ["Male", "Female"],
                  color: Colors.grey.shade50,
                  size: 45,
                  width: size.width / 1.18,
                  padding: 40,
                  borderColor: Colors.grey.shade300,
                  hint: "Select Gender",
                  icon: Icons.account_circle,
                  onChanged: (g) {
                    editprofileController.gender.value = g.toString();
                    setState(() {});
                  },
                ),
                const SizedBox(height: 15),
                Text(
                  "DOB",
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
                  size: 50,
                  color: Colors.grey.shade50,
                  controller: editprofileController.dob,
                  onTap: () {
                    editprofileController.selectDate(context);
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  borderColor: Colors.grey.shade300,
                  hint: "Select Date",
                  type: TextInputType.number,
                  icon: Icons.date_range,
                ),
                const SizedBox(height: 15),
                GetStorage().read('role') == '2'
                    ? Text(
                        "BIO",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : Container(),
                GetStorage().read('role') == '2'
                    ? const SizedBox(height: 5)
                    : Container(),
                GetStorage().read('role') == '2'
                    ? InputField(
                        size: 30,
                        minLine: 5,
                        maxLine: 8,
                        // validator: MultiValidator([
                        //   // EmailValidator(
                        //   //   errorText: 'Please enter valid email',
                        //   // ),
                        //   RequiredValidator(errorText: 'Description required')
                        // ]),
                        controller: editprofileController.bio,
                        borderRadius: 15,
                        hint: "Enter Bio",
                        type: TextInputType.name,
                        color: Colors.grey.shade50,
                        borderColor: Colors.grey.shade300,
                      )
                    : Container(),
                const SizedBox(height: 25),
                MyButton(
                  fontSize: 16,
                  title: editprofileController.isLoading.value
                      ? 'Loading...'
                      : "Update",
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                  color: primaryColor,
                  sizeHieght: 50,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      editprofileController.editprofile(context);
                    } else {
                      return;
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
