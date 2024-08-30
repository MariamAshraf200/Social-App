import 'package:flutter/material.dart';

class ShowSnackBar{
  void showSuccessSnackBar(String message , BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, backgroundColor: Colors.green),
        ))
    );
  }

  void showErrorSnackBar(String message , BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, backgroundColor: Colors.red),
        ))
    );
  }

}
