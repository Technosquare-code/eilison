import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/address_model.dart';
import 'package:elison/models/order_model.dart';
import 'package:elison/models/rating_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ReviewController extends GetxController {
  String? trainerid;
  ReviewController({this.trainerid});
  var isLoading = false.obs;
  // final mainscreenController = Get.find<MainScreenController>();
  var totalratings = 0.obs;
  var avg_rating = 0.0.obs;
  var fiveStar = 0.0.obs;
  var fourStar = 0.0.obs;
  var threeStar = 0.0.obs;
  var twoStar = 0.0.obs;
  var oneStar = 0.0.obs;
  var ratinglist = List<RatingListModel>.empty(growable: true).obs;

  getreviews(String trainerId) async {
    isLoading(true);
    ratinglist.assignAll(await MainScreenService().ratingList(trainerId));
    // isLoading(false);
  }

  getData() {
    totalratings.value = ratinglist.length;
    for (var element in ratinglist) {
      avg_rating.value = avg_rating.value + int.parse(element.rating);
      fiveStar.value = (element.rating == '5' || element.rating == '5.0')
          ? fiveStar.value + 1
          : fiveStar.value;
      fourStar.value = (element.rating == '4' || element.rating == '4.0')
          ? fourStar.value + 1
          : fourStar.value;
      threeStar.value = (element.rating == '3' || element.rating == '3.0')
          ? threeStar.value + 1
          : threeStar.value;
      twoStar.value = (element.rating == '2' || element.rating == '2.0')
          ? twoStar.value + 1
          : twoStar.value;
      oneStar.value = (element.rating == '1' || element.rating == '1.0')
          ? oneStar.value + 1
          : oneStar.value;
    }
    avg_rating.value = avg_rating.value / totalratings.value;
    fiveStar.value = (fiveStar.value / totalratings.value) * 100;
    fourStar.value = (fourStar.value / totalratings.value) * 100;
    threeStar.value = (threeStar.value / totalratings.value) * 100;
    twoStar.value = (twoStar.value / totalratings.value) * 100;
    oneStar.value = (oneStar.value / totalratings.value) * 100;
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    print(trainerid);
    await getreviews(trainerid!);
    await getData();
    isLoading(false);
    super.onInit();
  }
}
