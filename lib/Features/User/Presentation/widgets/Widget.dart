import 'package:flutter/material.dart';

class ButtonWidget {
  Widget textFieldButton(
      TextEditingController _controller, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.purple,
            ),
            hintText: title,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey))),
      ),
    );
  }

  Widget textButton(String title,Function fun) {
    return TextButton(
        onPressed:fun(),
        child: Text(title,
            style: TextStyle(
                color: Colors.green.shade200,
                fontSize: 20,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                decorationColor: Colors.grey)));
  }
}
