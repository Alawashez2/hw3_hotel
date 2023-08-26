import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project2/components/text/text_widget.dart';

extension dialog on BuildContext{
  dialogScreen() {
    showDialog(
      context: this,
      builder: (BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const TextWidget(text : 'Invalid Access',size: 20,),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}