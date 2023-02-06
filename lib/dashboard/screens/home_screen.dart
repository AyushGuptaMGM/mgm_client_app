import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/controllers/base_controller.dart';
import '../../common/models/product_model.dart';
import '../../common/screens/common_base_class.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showAppBar: true,
      showlocation: true,
      showSearchBar: true,
      child: ListView(
        children: const [
          Text("It's HomeScreen")
        ],
      ),
    );
  }
}

class DashboardItemTile extends StatelessWidget {
  DashboardItemTile({
    Key? key,
    required this.model,
  }) : super(key: key);
  Product model;
  // RxBool isFav = _wishlistController.isFav;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to(() => ProductDetailScreen(model: model));
      },
      child: Container(
        decoration: const BoxDecoration(
            color: AppThemes.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                BaseController.getIcon(model.imgUrl, 'name'),
                Positioned(
                  left: 8,
                  bottom: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppThemes.black,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        model.price.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: AppThemes.background),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Obx(
                    () => InkWell(
                      onTap: () {
                        // _wishlistController
                        //     .isFav(!_wishlistController.isFav.value);
                        // !_wishlistController.checkIfLikedOrNot("${model.id}")
                        //     ? _wishlistController.addToWishlist(model)
                        //     : _wishlistController.deleteFromWishlist(model);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: AppThemes.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: SvgPicture.asset(
                              // _wishlistController.isFav.value == false
                              //     ? CommonAssets.favouritesIcon
                              //     :
                            CommonAssets.favouritesFilledIcon,
                              color:
                                // _wishlistController.isFav.value == false
                              //     ?
                                  AppThemes.background
                              //     :
                              // null,
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const VSpace(8),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                model.title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const VSpace(2),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    model.rating.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const HSpace(6),
                const Icon(
                  Icons.star,
                  color: AppThemes.primary,
                ),
              ],
            ),
            const VSpace(8),
          ],
        ),
      ),
    );
  }
}

class CategoriesIcon extends StatelessWidget {
  CategoriesIcon({
    Key? key,
    required this.title,
    required this.imgUrl,
  }) : super(key: key);
  String title;
  String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            CircleAvatar(
              radius: 25,
              child: ClipOval(child: BaseController.getIcon(imgUrl, 'name')),
            ),
            const VSpace(8),
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      ),
    );
  }
}
