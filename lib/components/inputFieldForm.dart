import 'package:flutter/material.dart';

class MyInputFieldForm {
  Widget textField(
      {TextEditingController controller,
      String label,
      String hint,
      String initialValue,
      double width,
      Icon prefixIcon,
      Widget suffixIcon,
      Function(String) locationCallback,
      Function(String) validatorCallback,
      bool hide = false}) {
    return Container(
      child: TextFormField(
        onSaved: (value) {
          locationCallback(value);
        },
        obscureText: hide,
        validator: validatorCallback,
        controller: controller,
// initialValue: initialValue,
        decoration: new InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey[400],
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.blue[300],
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.all(15),
          hintText: hint,
        ),
      ),
    );
  }
}
