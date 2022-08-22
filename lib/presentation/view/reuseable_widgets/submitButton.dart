import 'package:flutter/material.dart';


bool isLoading = false;
class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({Key? key ,required this.onSubmit, required this.buttonText}) : super(key: key);
  final  dynamic onSubmit;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {

    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading == false
            ? SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });

                  onSubmit();

                        isLoading = false;




                },
                child:  Text(buttonText)))
            : const Center(child: CircularProgressIndicator()),
      );
    },);
  }
}

