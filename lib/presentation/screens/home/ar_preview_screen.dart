import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:halcera/presentation/widgets/application_app_bar_widget.dart';

class ARPreviewScreen extends StatelessWidget {
  final String modelSrc;
  final String? altText;
  const ARPreviewScreen({
    super.key,
    required this.modelSrc,
    this.altText
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DetailsAppBarWidget(title: 'AR'),
      body: ModelViewer(
        src: modelSrc,
        alt: altText,
        ar: true,
        autoRotate: true,
        cameraControls: true,
      ),
    );
  }
}
