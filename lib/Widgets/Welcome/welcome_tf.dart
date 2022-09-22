import 'package:flutter/material.dart';

class WelcomCustomTF extends StatelessWidget {
  WelcomCustomTF({Key? key, required this.controller, required this.labelText})
      : super(key: key);

  String labelText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5.0),
      child: TextFormField(
        maxLength: 15,
        style: TextStyle(fontSize: 13),
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return '请输入 $labelText';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.0),
          ),
          fillColor: Colors.amber.shade50,
          filled: true,
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.clear_outlined,
              size: 20,
              color: Colors.red,
            ),
            onPressed: () {
              controller.text = '';
            },
          ),
          hintText: labelText,
        ),
      ),
    );
  }
}
