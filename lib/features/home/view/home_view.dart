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
      backgroundColor: const Color(0xFFFFF9F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                '॥ जय श्री राम ॥',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD84315),
                ),
              ),
              const SizedBox(height: 10),
              Image.asset(
                'assets/images/hanuman_ji_image.png',
                height: 300,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              const Text(
                '॥ सुंदरकांड पाठ ॥',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD84315),
                ),
              ),
              const Text(
                'भगवान् हनुमानस्य कृपे सर्वं शक्यते।',
                style: TextStyle(fontSize: 12, color: Color(0xFF8B4513)),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // GridView.count(
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   crossAxisCount: 2,
                    //   mainAxisSpacing: 15,
                    //   crossAxisSpacing: 15,
                    //   childAspectRatio: 2.2,
                    //   children: [
                    //     SecondaryCard(
                    //       title: 'पाठ बुकमार्क',
                    //       subtitle: 'जहां छोड़ा था',
                    //       icon: Icons.bookmark,
                    //       onTap: () => Get.to(() => BookmarksView()),
                    //     ),
                    //     SecondaryCard(
                    //       title: 'चौपाई संग्रह',
                    //       subtitle: 'चौपाइयों का अर्थ',
                    //       icon: Icons.library_books,
                    //       onTap: () => Get.to(() => AudioView()),
                    //     ),
                    //     SecondaryCard(
                    //       title: 'आरती संग्रह',
                    //       subtitle: 'हनुमान जी की आरती',
                    //       icon: Icons.lightbulb_outline,
                    //       onTap: () => Get.to(() => AudioView()),
                    //     ),
                    //     SecondaryCard(
                    //       title: 'प्रार्थना',
                    //       subtitle: 'हनुमान जी से प्रार्थना',
                    //       icon: Icons.front_hand,
                    //       onTap: () => Get.to(() => SettingsView()),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
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
                    const SizedBox(height: 20),
                    MainActionCard(
                      title: 'सुंदरकांड पढ़ें',
                      subtitle: 'पूरे सुंदरकांड का पाठ करें',
                      icon: Icons.menu_book,
                      onTap: () => Get.to(() => SundarKandListingScreen()),
                    ),
                    const SizedBox(height: 20),
                    MainActionCard(
                      title: 'हनुमान चालीसा',
                      subtitle: 'चालीसा पढ़ें और सुनें',
                      icon: Icons.music_note,
                      onTap: () => Get.to(() => const ChalisaScreen()),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
