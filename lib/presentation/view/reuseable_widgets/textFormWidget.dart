import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget({Key? key ,required this.hintText,required this.prefixIcon,required this.controller,required this.inputType, this.isPassword}) : super(key: key);
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool? isPassword;
  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 10),
      child: TextFormField(
        obscureText:  widget.isPassword != null ? widget.isPassword! : false,

        autocorrect:  widget.isPassword == null ? false: widget.isPassword! ,
        controller: widget.controller,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          contentPadding:EdgeInsets.zero,
          prefixIcon:  Icon(widget.prefixIcon,),
          hintText: widget.hintText,
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.grey)
          ),
            focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey)
      )
        ),
      ),
    );
  }
}
