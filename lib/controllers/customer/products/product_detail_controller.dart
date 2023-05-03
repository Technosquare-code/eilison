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
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../home_screen_controller.dart';
import '../mainscreen_controller.dart';
import 'main_screen_product_controller.dart';

class ProductDetailController extends GetxController {
  final String? pro_id;

  ProductDetailController({this.pro_id});

  var isLoading = false.obs;
  var isAdded = false.obs;
  var isWish = false.obs;
  var productdetails = List<ProductDetailModel>.empty(growable: true).obs;
  var galleryList = List.empty(growable: true).obs;
  late YoutubePlayerController controller;
  final homescreenController = Get.find<HomeScreenController>();
  var isFullScreen = false.obs;
  getcategory() async {
    isLoading(true);
    productdetails.assignAll(await HomeScreenService().productdetails(pro_id!));
    galleryList.assignAll(productdetails[0].gallery.split(','));
    isWish.value = productdetails[0].isWhishlist;
    isAdded.value = productdetails[0].isCartAdded;
    isLoading(false);
  }

  wishlistmanaget(
      {bool? isAdd, ProductDetailModel? prod, BuildContext? context}) async {
    final mainssproductController = Get.find<MainProductController>();
    print('-------------------0000000000000000---------$isAdd');
    homescreenController.isLoading(true);
    homescreenController.dynamicItemList.clear();
    if (isAdd!) {
      // isWish.value = true;
      prod!.isWhishlist = true;

      bool check = await HomeScreenService().manageWishlist(context!,
          action: 'add', productId: prod.id, recordId: '');

      check
          ? {
              homescreenController.getSpecialItem(),
              homescreenController.getdynamiccategory(),
              // getSpecialItem(),
              mainssproductController.getcategory()
            }
          : null;
    } else {
      // isWish.value = false;

      prod!.isWhishlist = false;
      bool check = await HomeScreenService().manageWishlist(context!,
          action: 'remove', productId: prod.id, recordId: '');
      // check ? getSpecialItem() : null;

      check
          ? {
              homescreenController.getSpecialItem(),
              // getSpecialItem(),
              homescreenController.getdynamiccategory(),

              mainssproductController.getcategory()
            }
          : null;
    }
    homescreenController.isLoading(false);
  }

  addTocart(BuildContext context) async {
    bool check = await HomeScreenService()
        .addToCart(context, productId: productdetails[0].id);
    final ss = Get.find<MainScreenController>();

    // check ? Get.back() : null;
    if (check) {
      isAdded(true);
      ss.getuserdetails();
    }
  }

  initvideo(String url) {
    print('object------------------------------ ${productdetails[0].id}');
    // Uri uri = Uri.parse(url);
    // String videoId = uri.queryParameters['v']!;
    // print(videoId);
    // controller = YoutubePlayerController(
    //   initialVideoId: YoutubePlayer.convertUrlToId(url)!,

    //   // initialVideoId: YoutubePlayer.convertUrlToId(
    //   //     "https://www.youtube.com/watch?v=3zqzYB97WC0")!,
    //   flags: YoutubePlayerFlags(
    //     autoPlay: false,
    //     mute: false,
    //   ),
    // );
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    )..addListener(() {
        if (controller.value.isFullScreen != isFullScreen.value) {
          isFullScreen.value = controller.value.isFullScreen;

          if (isFullScreen.value) {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
            ]);
          }
        }
      });
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
