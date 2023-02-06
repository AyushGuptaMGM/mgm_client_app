import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    // Get.lazyPut(() => WalkThroughController(), fenix: true);
    // Get.lazyPut(() => AuthenticationController(), fenix: true);
  }
}
