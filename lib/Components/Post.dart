import 'package:elison/Components/postOptions.dart';
import 'package:elison/Components/video_player.dart';
import 'package:elison/Screens/PostDetailScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/models/post_model.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/Utils.dart';
import '../controllers/customer/posts/post_controller.dart';
import 'SessionOption.dart';

// class Post extends StatefulWidget {
//   final bool isedit;
//   final int? index;
//   final String? id;
//   final String? uid;
//   final String? postContent;
//   final String? postMedia;
//   final String? isVideo;
//   final String? isImage;
//   final int? totalLike;
//   final int? totalComment;
//   final String? status;
//   final DateTime? createdDate;
//   final String? userProfile;
//   final String? userName;
//   final bool? isLike;
//   final bool? isMain;
//   const Post({
//     this.createdDate,
//     this.isedit = false,
//     this.id,
//     this.isImage,
//     this.isVideo,
//     this.postContent,
//     this.postMedia,
//     this.status,
//     this.totalComment,
//     this.totalLike,
//     this.index,
//     this.userName,
//     this.userProfile,
//     this.uid,
//     this.isLike,
//     this.isMain = true,
//   });
//   @override
//   State<Post> createState() => _PostState();
// }

// class _PostState extends State<Post> {
//   bool liked = false;
//   int like = 116;
//   final postController = Get.find<PostController>();

//   timeDiff(DateTime comingDateTime) {
//     // Current datetime
//     DateTime currentDateTime = DateTime.now();

//     // Another datetime (e.g., coming date)
//     // DateTime comingDateTime = DateTime(2023, 5, 20, 12, 0, 0);

//     // Calculate the difference
//     Duration difference = currentDateTime.difference(comingDateTime);

//     // Extract the difference in days, hours, and minutes
//     int days = difference.inDays;
//     int hours = difference.inHours;
//     int minutes = difference.inMinutes;
//     // print('object $difference');
//     String differenceString;

//     if (days > 0) {
//       differenceString = '$days day ago';
//     } else if (hours > 0) {
//       differenceString = '$hours hr ago';
//     } else if (minutes > 0) {
//       differenceString = '$minutes min ago';
//     } else {
//       differenceString = 'Less than a minute';
//     }

//     // print('Difference: $differenceString');
//     return differenceString;
//   }

//   void _toggleLike() {
//     setState(() {
//       if (liked) {
//         liked = false;
//         like--;
//       } else {
//         liked = true;
//         like++;
//       }
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     liked = widget.isLike!;
//     print('is liked ka init h $liked');
//     like = widget.totalLike!;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Container(
//       color: Colors.grey.shade300,
//       margin: const EdgeInsets.only(bottom: 5),
//       child: Container(
//         padding: const EdgeInsets.only(bottom: 5),
//         color: Colors.white,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               horizontalTitleGap: 8,
//               leading: widget.userProfile == ''
//                   ? CircleAvatar(
//                       radius: 25,
//                       backgroundColor: Colors.grey.shade100,
//                       backgroundImage: AssetImage("assets/images/avatar.png"),
//                     )
//                   : CircleAvatar(
//                       radius: 25,
//                       backgroundColor: Colors.grey.shade100,
//                       backgroundImage: NetworkImage(
//                           mainUrl + imageUrl + widget.userProfile!),
//                     ),
//               title: Text(
//                 widget.userName ?? "Manoj Saini",
//                 // .toString(),
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.black,
//                   fontFamily: "Poppins",
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               subtitle: Text(
//                 // "2 days ago",
//                 timeDiff(widget.createdDate ?? DateTime.now()),
//                 style: TextStyle(
//                   fontSize: 10,
//                   color: Colors.grey,
//                   fontFamily: "Poppins",
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               trailing: widget.isedit
//                   ? IconButton(
//                       onPressed: () {
//                         Utils.showMyBottomSheet(
//                             context, postoptions(widget.id!, widget.index!));
//                       },
//                       icon: Icon(
//                         Icons.more_vert,
//                         color: Colors.black,
//                         size: 25,
//                       ),
//                     )
//                   : SizedBox(),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 // "Has updated a new picture..",
//                 widget.postContent! ?? "Has updated a new picture..",
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.black,
//                   fontFamily: "Poppins",
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 5),
//             widget.isVideo == '0'
//                 ? Image.network(
//                     // 'assets/images/post.jpg',
//                     mainUrl + postUrl + widget.postMedia!,
//                     width: size.width,
//                     height: size.height / 2.5,
//                     fit: BoxFit.cover,
//                   )
//                 : VideoPlayerItem(
//                     videoUrl: mainUrl + postUrl + widget.postMedia!),
//             widget.isMain!
//                 ? Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 25, vertical: 10),
//                     child: Row(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             // liked = !liked;
//                             // if (liked == true) {
//                             //   like++;
//                             // } else {
//                             //   like--;
//                             // }
//                             // setState(() {});
//                             _toggleLike();
//                             final _CommunityScreenState? listViewScreenState =
//               context.findAncestorStateOfType<_CommunityScreenState>();
//           if (listViewScreenState != null) {
//             final postIndex = listViewScreenState.posts.indexOf(post);
//             listViewScreenState.updatePostLikedStatus(postIndex, post.liked);
//           }
//                             setState(() {});
//                             postController.managelike(context, widget.id!);
//                           },
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Icon(
//                                 liked ? Icons.favorite : Icons.favorite_border,
//                                 color: liked ? primaryColor : Colors.black,
//                                 size: 15,
//                               ),
//                               const SizedBox(width: 8),
//                               Text(
//                                 "${like}",
//                                 maxLines: 1,
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.black,
//                                   fontFamily: "Poppins",
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 30),
//                         Icon(
//                           Icons.comment,
//                           color: Colors.black,
//                           size: 15,
//                         ),
//                         const SizedBox(width: 8),
//                         Text(
//                           "${widget.totalComment}",
//                           maxLines: 1,
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.black,
//                             fontFamily: "Poppins",
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }
// //