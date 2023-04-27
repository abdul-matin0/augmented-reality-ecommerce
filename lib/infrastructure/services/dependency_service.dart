import 'package:get/get.dart';
import 'package:halcera/infrastructure/controller/application_placeholder_controller.dart';
import 'package:halcera/infrastructure/controller/category_controller.dart';

/// Register application controllers used here
/// LazyPut to initialize only when needed
class DependencyBinding implements Bindings {
  @override
  void dependencies() {
    //Initialize dependencies on project startup
    //Ordered according to dependents
    //  Get.put(AccountController());

    //Initialize dependencies when needed -- Lazy

    Get.lazyPut(() => CategoryController(), fenix: true);
    Get.lazyPut(() => ApplicationPlaceholderController(), fenix: true);
  }
}
