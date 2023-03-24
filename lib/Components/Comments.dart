import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  final Function()? comment;

  const Comments({this.comment});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade100,
            backgroundImage: AssetImage("assets/images/avatar.png"),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  "Manoj Saini",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "You are awesome. Keep going",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Yesterday",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: widget.comment,
                          child: Icon(
                            Icons.messenger_outline,
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "1",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            liked = !liked;
                            setState(() {});
                          },
                          child: Icon(
                            liked ? Icons.favorite : Icons.favorite_border,
                            color: liked ? primaryColor : Colors.black,
                            size: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
