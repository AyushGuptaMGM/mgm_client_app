import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/arch_utils/enums/state_types.dart';
import '../utils/common_assets.dart';

class BaseController extends GetxController with StateMixin {
  StateType stateType = StateType.idle;
  setState(StateType state) {
    stateType = state;
    update();
  }

  static Widget getIcon(String? icon, String name,
      {double height = 150, double width = 150}) {
    if (icon == null || icon.isEmpty) {
      return SvgPicture.asset(
        CommonAssets.squarePlaceholder,
        width: 150,
        height: 150,
      );
    }
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return FutureBuilder(
        future: getUrl(icon, name),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.hasError) {
            debugPrint(
                "Error in loading image for: $name $icon ${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return SvgPicture.asset(
                CommonAssets.squarePlaceholder,
                width: height,
                height: width,
              );
            }
            return ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                snapshot.data.toString(),
                fit: BoxFit.cover,
                height: height,
                width: width,
                //color: AppColors.colorTextBlack,
              ),
            );
          } else {
            return SvgPicture.asset(
              CommonAssets.squarePlaceholder,
              width: height,
              height: width,
            );
          }
        },
      );
    });
  }

  static Future<String?> getUrl(String? icon, String name) async {
    if (icon == null || icon == "") return Future.value();
    try {
      return FirebaseStorage.instance.ref(icon).getDownloadURL();
    } catch (e) {
      debugPrint('Error occurred for $icon with tickerName : $name');
      return null;
    }
  }
}
