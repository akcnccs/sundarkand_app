import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanuman_ji_sundar_kand/features/reading/view/reading_view.dart';
import 'package:hanuman_ji_sundar_kand/features/reading/view/valmiki_sundarkand_screen.dart';
import 'package:hanuman_ji_sundar_kand/features/sundar_kand_listing/widget/listing_card.dart';

class SundarKandListingScreen extends StatelessWidget {
  const SundarKandListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'सुन्दरकाण्ड सारणी',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          ListingCardWidget(
            title: 'सुन्दरकाण्ड - गीता प्रेस',
            subTitle: '',
            onTap: () {
              Get.to(() => ReadingView());
            },
          ),
          SizedBox(height: 16),
          ListingCardWidget(
            title: 'श्री वाल्मीकि रामायण सुन्दरकाण्ड',
            onTap: () {
              Get.to(() => ValmikiSundarkandScreen());
            },
            subTitle: '',
          ),
        ],
      ),
    );
  }
}
