import 'package:cafeteira_ygo/shared/interfaces/i_details_selection_screen_repository.dart';
import 'package:cafeteira_ygo/shared/repositories/details_selection_screen_repository.dart';
import 'package:cafeteira_ygo/ui/details_selection_screen/details_selection_controller.dart';
import 'package:get/get.dart';

class DetailsSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IDetailsSelectionScreenRepository>(
        () => DetailsSelectionScreenRepository());
    Get.put(DetailsSelectionController(Get.find()));
  }
}
