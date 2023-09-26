import 'package:flutter/material.dart';

class UnderLineInputField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final FormFieldValidator? validator;

  const UnderLineInputField(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
        ),
      ),
    );
  }
}
