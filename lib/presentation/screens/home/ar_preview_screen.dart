import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:halcera/presentation/widgets/application_app_bar_widget.dart';

class ARPreviewScreen extends StatefulWidget {
  const ARPreviewScreen({super.key});

  @override
  State<ARPreviewScreen> createState() => _ARPreviewScreenState();
}

class _ARPreviewScreenState extends State<ARPreviewScreen> {
  late ArCoreController arCoreController;

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    // adding item
    _addItem(hit);
  }

  Future _addItem(ArCoreHitTestResult hit) async {
    final objectNode = ArCoreReferenceNode(
        name: "toucan.sfb",
        object3DFileName: 'toucan.sfb',
        position: hit.pose.translation,
        rotation: hit.pose.rotation);

    // final bytes = (await rootBundle.load("assets/images/ironman.png"))
    //     .buffer
    //     .asUint8List();
    // final characterPosition = ArCoreNode(
    //     image: ArCoreImage(bytes: bytes, width: 500, height: 500),
    //     position: hit.pose.translation + vector.Vector3(0.0, 0.0, 0.0),
    //     rotation: hit.pose.rotation + vector.Vector4(0.0, 0.0, 0.0, 0.0));

    arCoreController.addArCoreNodeWithAnchor(objectNode);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DetailsAppBarWidget(title: 'AR'),
      body: ModelViewer(
        src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
        alt: "A 3D model of an astronaut",
        ar: true,
        autoRotate: true,
        
        cameraControls: true,
      ),
      // body: ArCoreView(
      //   onArCoreViewCreated: _onArCoreViewCreated,
      //   enableTapRecognizer: true,
      // ),
    );
  }
}
