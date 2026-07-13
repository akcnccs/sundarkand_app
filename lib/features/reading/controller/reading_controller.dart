import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

class ReadingController extends GetxController {
  late PdfControllerPinch pdfController;
  
  var currentPage = 1.obs;
  var totalPages = 0.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with a default, but screens can call initPdf to change it
    initPdf('assets/pdf/sundar_kand.pdf');
  }

  void initPdf(String assetPath) {
    pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset(assetPath),
    );
    currentPage.value = 1;
    totalPages.value = 0;
  }

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  void nextPage() {
    // Safety check to prevent "Null check operator" crash
    if (totalPages.value > 0 && currentPage.value < totalPages.value) {
      pdfController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  void previousPage() {
    // Safety check
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
