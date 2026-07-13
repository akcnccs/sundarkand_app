import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'utils/app_theme.dart';
import 'utils/shared_preferences.dart';
import 'features/onboarding_screen/onboarding_screen.dart';

SpUtil? sp;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final spInstance = await SpUtil.getInstance();
  Get.put<SpUtil>(spInstance, permanent: true);
  sp = spInstance;

  SystemChannels.textInput.invokeMethod('TextInput.hide');

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(const RunApp());
  });
}

class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hanuman Ji Sundar Kand',
      scrollBehavior: MyCustomScrollBehavior(),
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      home: const OnboardingScreen(),
      builder: (context, child) {
        return ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(
            context,
            SafeArea(top: false, bottom: true, child: child!),
          ),
          maxWidth: 2400,
          minWidth: 350,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(550, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: AppColor.pageBackground),
        );
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
