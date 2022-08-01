import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget({Key? key}) : super(key: key);

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding:EdgeInsets.zero,
          prefixIcon: Icon(Icons.search,),
          hintText: "Search for doctors",
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: Colors.grey)
          ),
            focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey)
      )
        ),
      ),
    );
  }
}
