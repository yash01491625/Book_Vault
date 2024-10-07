import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PortraitModeWrapper extends StatefulWidget {
  final Widget child;

  const PortraitModeWrapper({Key? key, required this.child}) : super(key: key);

  @override
  _PortraitModeWrapperState createState() => _PortraitModeWrapperState();
}

class _PortraitModeWrapperState extends State<PortraitModeWrapper> {
  @override
  void initState() {
    super.initState();
    // Lock the orientation to portrait for this screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // Lock the orientation in the build method to ensure it's reapplied as needed
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return widget.child;
  }
}
