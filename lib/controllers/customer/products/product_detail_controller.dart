import 'package:elison/apiServices/home_screen_service.dart';
import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/models/banner_model.dart';
import 'package:elison/models/category_model.dart';
import 'package:elison/models/notification_model.dart';
import 'package:elison/models/product_detail_model.dart';
import 'package:elison/models/products_model.dart';
import 'package:elison/models/special_item_model.dart';
import 'package:elison/models/subcategory_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProductDetailController extends GetxController {
  final String? pro_id;

  ProductDetailController({this.pro_id});

  var isLoading = false.obs;

  var productdetails = List<ProductDetailModel>.empty(growable: true).obs;
  var galleryList = List.empty(growable: true).obs;
  late YoutubePlayerController controller;
  getcategory() async {
    isLoading(true);
    productdetails.assignAll(await HomeScreenService().productdetails(pro_id!));
    galleryList.assignAll(productdetails[0].gallery.split(','));
    isLoading(false);
  }

  addTocart(BuildContext context) async {
    bool check = await HomeScreenService()
        .addToCart(context, productId: productdetails[0].id);
    // check ? Get.back() : null;
  }

  initvideo(String url) {
    print('object------------------------------ ${productdetails[0].id}');
    Uri uri = Uri.parse(url);
    String videoId = uri.queryParameters['v']!;
    print(videoId);
    controller = YoutubePlayerController(
      initialVideoId: videoId,

      // initialVideoId: YoutubePlayer.convertUrlToId(
      //     "https://www.youtube.com/watch?v=3zqzYB97WC0")!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  void onInit() async {
    // TODO: implement onInit

    await getcategory();
    if (productdetails.isNotEmpty) {
      if (productdetails[0].videoUrl != '' &&
          productdetails[0].videoUrl != null) {
        await initvideo(productdetails[0].videoUrl);
      }
    }
    // productdetails.isNotEmpty
    //     ? productdetails[0].videoUrl != ''
    //         ? initvideo(productdetails[0].videoUrl)
    //         : null
    //     : null;
    super.onInit();
  }
}
