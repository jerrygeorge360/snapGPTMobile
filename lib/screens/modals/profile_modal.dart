import 'package:flutter/material.dart';


void showDialogModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Dialog Modal'),
        content: Text('Dialog modal content goes here.'),
        actions: [
          TextButton(
            onPressed: () {
              // Close the modal when the button is pressed
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}
