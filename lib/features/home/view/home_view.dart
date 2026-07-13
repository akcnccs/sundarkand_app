import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanuman_ji_sundar_kand/features/chalisa/view/chalisa_screen.dart';
import 'package:hanuman_ji_sundar_kand/features/sundar_kand_listing/sundar_kand_listing_screen.dart';
import '../../../widgets/home_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF9F5),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              '॥ जय श्री राम ॥',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD84315),
              ),
            ),
            SizedBox(height: 10),
            Image.asset(
              'assets/images/hanuman_ji_image.png',
              height: 350,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 10),
            Text(
              '॥ सुंदरकांड पाठ ॥',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD84315),
              ),
            ),
            Text(
              'भगवान् हनुमानस्य कृपे सर्वं शक्यते।',
              style: TextStyle(fontSize: 12, color: Color(0xFF8B4513)),
            ),
            SizedBox(height: 12),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Column(
            //     children: [
            //       // GridView.count(
            //       //   shrinkWrap: true,
            //       //   physics:  NeverScrollableScrollPhysics(),
            //       //   crossAxisCount: 2,
            //       //   mainAxisSpacing: 15,
            //       //   crossAxisSpacing: 15,
            //       //   childAspectRatio: 2.2,
            //       //   children: [
            //       //     SecondaryCard(
            //       //       title: 'पाठ बुकमार्क',
            //       //       subtitle: 'जहां छोड़ा था',
            //       //       icon: Icons.bookmark,
            //       //       onTap: () => Get.to(() => BookmarksView()),
            //       //     ),
            //       //     SecondaryCard(
            //       //       title: 'चौपाई संग्रह',
            //       //       subtitle: 'चौपाइयों का अर्थ',
            //       //       icon: Icons.library_books,
            //       //       onTap: () => Get.to(() => AudioView()),
            //       //     ),
            //       //     SecondaryCard(
            //       //       title: 'आरती संग्रह',
            //       //       subtitle: 'हनुमान जी की आरती',
            //       //       icon: Icons.lightbulb_outline,
            //       //       onTap: () => Get.to(() => AudioView()),
            //       //     ),
            //       //     SecondaryCard(
            //       //       title: 'प्रार्थना',
            //       //       subtitle: 'हनुमान जी से प्रार्थना',
            //       //       icon: Icons.front_hand,
            //       //       onTap: () => Get.to(() => SettingsView()),
            //       //     ),
            //       //   ],
            //       // ),
            //       //  SizedBox(height: 20),
            //     ],
            //   ),
            // ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.orange.shade50.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'बुद्धिहीन तनु जानिके, सुमिरौं पवन-कुमार।',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8B4513),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    'बल बुद्धि विद्या देहु मोहिं, हरहु कलेश विकार॥',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8B4513),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            MainActionCard(
              title: 'सुंदरकांड पढ़ें',
              subtitle: 'पूरे सुंदरकांड का पाठ करें',
              icon: Icons.menu_book,
              onTap: () => Get.to(() => SundarKandListingScreen()),
            ),
            SizedBox(height: 12),
            InkWell(
              onTap: () {
                Get.to(() => ChalisaScreen());
              },
              child: Text(
                '|| हनुमान चालीसा ||',
                style: TextStyle(
                  color: Color(0xFF8B4513),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
