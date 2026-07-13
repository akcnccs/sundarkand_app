import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_lyric/flutter_lyric.dart';
import '../controller/chalisa_controller.dart';

class ChalisaScreen extends StatelessWidget {
  const ChalisaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChalisaController controller = Get.put(ChalisaController());

    var lyricStyle = LyricStyle(
      textStyle: TextStyle(fontSize: 18, color: Colors.grey.shade600),
      activeStyle: const TextStyle(
        fontSize: 24,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
      translationStyle: const TextStyle(fontSize: 14, color: Colors.grey),
      lineTextAlign: TextAlign.center,
      lineGap: 25,
      contentAlignment: CrossAxisAlignment.center,
      translationLineGap: 10,
      selectionAnchorPosition: 0.5,
      scrollDuration: const Duration(milliseconds: 300),
      selectedColor: Colors.red,
      selectedTranslationColor: Colors.red,
      selectionAutoResumeDuration: const Duration(milliseconds: 300),
      activeAutoResumeDuration: const Duration(seconds: 3),
      selectionAlignment: MainAxisAlignment.center,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        title: const Text(
          'हनुमान चालीसा',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => controller.playPause(),
              child: LyricView(
                controller: controller.lyricController,
                style: lyricStyle,
              ),
            ),
          ),

          // Audio Controls with Visible Timer
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Timer labels (Current Position / Total Duration)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          _formatDuration(controller.position.value),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          _formatDuration(controller.duration.value),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Slider
                Obx(
                  () => Slider(
                    activeColor: Colors.orange,
                    inactiveColor: Colors.orange.shade100,
                    min: 0,
                    max: controller.duration.value.inSeconds.toDouble() > 0
                        ? controller.duration.value.inSeconds.toDouble()
                        : 1.0,
                    value: controller.position.value.inSeconds.toDouble().clamp(
                      0,
                      controller.duration.value.inSeconds.toDouble() > 0
                          ? controller.duration.value.inSeconds.toDouble()
                          : 1.0,
                    ),
                    onChanged: (value) =>
                        controller.seek(Duration(seconds: value.toInt())),
                  ),
                ),

                // Play/Pause
                Obx(
                  () => IconButton(
                    iconSize: 64,
                    icon: Icon(
                      controller.isPlaying.value
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_filled,
                      color: Colors.orange,
                    ),
                    onPressed: () => controller.playPause(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper to format time (00:00)
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
