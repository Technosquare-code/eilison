import 'package:elison/Components/postOptions.dart';
import 'package:elison/Screens/PostDetailScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';

import '../Utils/Utils.dart';
import 'SessionOption.dart';

class Post extends StatefulWidget {
  final bool clickable;

  const Post(this.clickable);
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool liked = false;
  int like = 116;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        if (widget.clickable == true) {
          Navigator.of(context).pushNamed(
            PostDetailScreen.routeName,
          );
        }
      },
      child: Container(
        color: Colors.grey.shade300,
        margin: const EdgeInsets.only(bottom: 5),
        child: Container(
          padding: const EdgeInsets.only(bottom: 5),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                horizontalTitleGap: 8,
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.shade100,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
                title: Text(
                  "Manoj Saini",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  "2 days ago",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Utils.showMyBottomSheet(context,postoptions() );
                  },
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Has updated a new picture..",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Image.asset(
                'assets/images/post.jpg',
                width: size.width,
                height: size.height / 2.5,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        liked = !liked;
                        if (liked == true) {
                          like++;
                        } else {
                          like--;
                        }
                        setState(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            liked ? Icons.favorite : Icons.favorite_border,
                            color: liked ? primaryColor : Colors.black,
                            size: 15,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "$like",
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    Icon(
                      Icons.comment,
                      color: Colors.black,
                      size: 15,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "12",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//