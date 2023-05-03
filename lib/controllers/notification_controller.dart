import 'package:get/get.dart';

import '../apiServices/home_screen_service.dart';
import '../models/notification_model.dart';

class NotificationController extends GetxController {
  var isLoading = false.obs;
  var notificationList = List<NotificationModel>.empty(growable: true).obs;
  getNotification() async {
    isLoading(true);
    notificationList.assignAll(await HomeScreenService().notificationList());
    isLoading(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getNotification();
    super.onInit();
  }
}
