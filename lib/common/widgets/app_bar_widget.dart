import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/base_controller.dart';
import '../utils/arch_utils/widgets/spacing_widgets.dart';
import '../utils/common_assets.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  BaseController baseController = Get.put(BaseController());

  AppBarWidget({
    Key? key,
    this.showBackIcon,
    this.pageTitle,
    this.showSearchBar,
    this.isOrdersScreen,
    this.isProfileScreen,
    this.showlocation,
  }) : super(key: key);
  bool? showBackIcon;
  String? pageTitle;
  bool? showSearchBar;
  bool? isOrdersScreen;
  bool? isProfileScreen;
  bool? showlocation;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(16.0), right: Radius.circular(16.0)),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16.0, top: 40, bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                // if (showlocation == true)
                //   Obx(() => Row(
                //         children: [
                //           CircleAvatar(
                //             backgroundColor: AppThemes.primary,
                //             radius: 17,
                //             child:
                //                 SvgPicture.asset(CommonAssets.locationPinIcon),
                //           ),
                //           const HSpace(12),
                //           Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               baseController.placemark.isNotEmpty
                //                   ? Text(
                //                       "${baseController.placemark[0].subLocality}, ${baseController.placemark[0].locality}, ${baseController.placemark[0].postalCode}",
                //                       style:
                //                           Theme.of(context).textTheme.bodySmall,
                //                     )
                //                   : Text("Loading"),
                //               InkWell(
                //                 onTap: () {
                //                   Get.bottomSheet(const AppBottomSheet());
                //                 },
                //                 child: Row(
                //                   children: [
                //                     Text(
                //                       "Select Location",
                //                       style: Theme.of(context)
                //                           .textTheme
                //                           .labelLarge,
                //                     ),
                //                     const HSpace(5),
                //                     SvgPicture.asset(
                //                         CommonAssets.downArrowIcon),
                //                   ],
                //                 ),
                //               )
                //             ],
                //           )
                //         ],
                //       ))
                // else
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios_outlined)),
                const Spacer(),
                if (pageTitle != "")
                  Text(
                    pageTitle!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                const Spacer(),
                InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(CommonAssets.exploreIcon)),
                const HSpace(15),
                InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(CommonAssets.notificationIcon)),
                const HSpace(15),
                // InkWell(
                //     onTap: () {
                //       Get.to(() => WishlistScreen());
                //     },
                //     child: SvgPicture.asset(CommonAssets.favouritesIcon)),
              ],
            ),

          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 500);
}
