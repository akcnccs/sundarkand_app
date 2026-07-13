import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/view/home_view.dart';
import '../../widgets/common_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/shree_ram_darbar.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 40.0,
            ),
            child: Column(
              children: [
                const Text(
                  '।। जय श्री राम ।।',
                  style: TextStyle(
                    color: Color(0xFFFF9933),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 4,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Text(
                  'सुन्दरकाण्ड',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffe6be3a),
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                const Text(
                  'अतुलितबलधामं हेमशैलाभदेहं\nदनुजवनकृशानुं ज्ञानिनामग्रगण्यम् ।\nसकलगुणनिधानं वानराणामधीशं\nरघुपतिप्रियभक्तं वातजातं नमामि ॥',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    height: 1.6,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 3,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: CommonButton(
                    onPressed: () => Get.offAll(() => const HomeView()),
                    label: 'प्रारंभ करें',
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
