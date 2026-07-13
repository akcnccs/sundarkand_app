import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import '../../../widgets/common_button.dart';
import '../controller/reading_controller.dart';

class ReadingView extends StatelessWidget {
  const ReadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final ReadingController controller = Get.put(ReadingController());
    controller.initPdf('assets/pdf/sundar_kand.pdf');

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
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
          'सुन्दरकाण्ड पाठ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Obx(
            () => Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  '${controller.currentPage.value} / ${controller.totalPages.value}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PdfView(
              controller: controller.pdfController,
              onDocumentLoaded: (document) {
                controller.totalPages.value = document.pagesCount;
              },
              onPageChanged: controller.onPageChanged,
              builders: PdfViewBuilders<DefaultBuilderOptions>(
                options: DefaultBuilderOptions(),
                documentLoaderBuilder: (_) => Center(
                  child: CircularProgressIndicator(color: Colors.orange),
                ),
                pageLoaderBuilder: (_) => Center(
                  child: CircularProgressIndicator(color: Colors.orange),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonButton(
                  onPressed: controller.previousPage,
                  label: 'पिछला',
                  icon: Icons.arrow_back_ios,
                  backgroundColor: Colors.orange.shade50,
                  foregroundColor: Colors.orange,
                ),
                Obx(
                  () => Text(
                    'पृष्ठ ${controller.currentPage.value}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
                CommonButton(
                  onPressed: controller.nextPage,
                  label: 'अगला',
                  icon: Icons.arrow_forward_ios,
                  iconRight: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
