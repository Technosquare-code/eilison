import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';

class DeleteConfirmationPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Delete',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      content: Text('Are you sure you want to delete?'),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () {
            // Perform delete operation
            Navigator.of(context).pop(true); // Return true to confirm
          },
          child: Text('Confirm'),
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.3)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
          onPressed: () {
            Navigator.of(context).pop(false); // Return false to cancel
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
