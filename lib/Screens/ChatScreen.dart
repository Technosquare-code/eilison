import 'package:elison/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatController = Get.put(ChatController());
  List<ChatMessage> messages = [
    ChatMessage(sender: 'Me', text: 'Hello!'),
    ChatMessage(sender: 'Friend', text: 'Hi there!'),
    ChatMessage(sender: 'Me', text: 'How are you?'),
    ChatMessage(sender: 'Friend', text: 'I\'m good. Thanks!'),
  ];

  TextEditingController messageController = TextEditingController();
  ImagePicker picker = ImagePicker();
  String? imagePath;

  void sendMessage(String text, String? imagePath) {
    setState(() {
      messages.add(ChatMessage(sender: 'Me', text: text, imagePath: imagePath));
    });
    messageController.clear();
    this.imagePath = null;
  }

  Future<void> pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          "Chat Support",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Obx(() {
        return Column(
          children: [
            chatController.isLoading.value && chatController.chatList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        final isMe = message.sender == 'Me';
                        return Container(
                          alignment: isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: isMe ? Colors.blue : Colors.grey,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (message.imagePath != null)
                                  Image.asset(
                                    message.imagePath!,
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                Text(
                                  message.text,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      // reverse: true,
                      itemCount: chatController.chatList.length,
                      itemBuilder: (context, index) {
                        final message = chatController.chatList[index];
                        final isMe = message.adminId == '0';
                        return Container(
                          alignment: isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: isMe
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 8.0, left: 8, right: 8, bottom: 4),
                                padding: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: isMe ? Colors.blue : Colors.grey,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (message.files != '')
                                      Image.network(
                                        message.message,
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    Text(
                                      message.message,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                  DateFormat('dd-MM-yyyy h:mm a')
                                      .format(message.createdDate),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      cursorHeight: 25,
                      controller: chatController.textController,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                        ),
                        filled: true,

                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Make it rounded
                          borderSide: BorderSide.none, // Remove the border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Make it rounded
                          borderSide: BorderSide.none, // Remove the border
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 4), // Adjust the vertical padding
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.image),
                    onPressed: () {
                      pickImage();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      String text = chatController.textController.text.trim();
                      if (text.isNotEmpty) {
                        // sendMessage(text, imagePath);
                        chatController.sendChat(context);
                      }
                      // if (text.isNotEmpty || imagePath != null) {
                      //   sendMessage(text, imagePath);
                      // }
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

class ChatMessage {
  final String sender;
  final String text;
  final String? imagePath;

  ChatMessage({required this.sender, required this.text, this.imagePath});
}
