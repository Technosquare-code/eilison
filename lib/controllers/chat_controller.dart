import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/chat_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../apiServices/home_screen_service.dart';
import '../models/notification_model.dart';

class ChatController extends GetxController {
  var isLoading = false.obs;
  var chatList = List<ChatModel>.empty(growable: true).obs;
  final textController = TextEditingController();

  sendChat(BuildContext context) async {
    // isLoading(true);
    ChatModel check = await ProfileTabService().sendChat(
      context,
      textController.text,
    );
    chatList.add(check);
    textController.clear();
    // isLoading(false);
  }

  getChat() async {
    isLoading(true);
    chatList.assignAll(await ProfileTabService().getChat());
    // chatList.value = chatList.value.;
    isLoading(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    // getNotification();
    getChat();
    super.onInit();
  }
}
