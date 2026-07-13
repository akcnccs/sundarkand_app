import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

class ReadingController extends GetxController {
  late PdfController pdfController;

  var currentPage = 1.obs;
  var totalPages = 0.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    initPdf('assets/pdf/sundar_kand.pdf');
  }

  void initPdf(String assetPath) {
    pdfController = PdfController(
      document: PdfDocument.openAsset(assetPath),
    );
    currentPage.value = 1;
    totalPages.value = 0;
  }

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  void nextPage() {
    if (totalPages.value > 0 && currentPage.value < totalPages.value) {
      pdfController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  void previousPage() {
    if (totalPages.value > 0 && currentPage.value > 1) {
      pdfController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void onClose() {
    pdfController.dispose();
    super.onClose();
  }
}
