import 'package:get/get.dart';
import '../../reading/view/reading_view.dart';

class HomeController extends GetxController {


  void onResumeReading() => Get.to(() => const ReadingView());
}
