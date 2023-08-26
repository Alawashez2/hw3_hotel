import 'package:flutter/material.dart';

extension Screen on BuildContext {
  push(Widget target) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => target));
  }

  pushAndRemoveUntil(Widget target) {
    Navigator.pushAndRemoveUntil(this,
        MaterialPageRoute(builder: (context) => target), (route) => false);
  }
  pop(Widget target) {
    Navigator.pop(this);
  }
}
