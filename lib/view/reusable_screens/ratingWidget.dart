import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({Key? key ,required this.ratingValue}) : super(key: key);
final dynamic ratingValue;


  @override
  Widget build(BuildContext context) {
    var ratingVal =ratingValue;


     return Row( children: List.generate(5, (index) {

       if(index >= ratingVal ){
         return Icon(Icons.star ,color: Colors.transparent);

       }
       else if (index > ratingVal  -1 &&  index < ratingVal){
         return Icon(Icons.star_half ,color: Colors.amber,size: 20,);
       }
     else{
         return Icon(Icons.star ,color: Colors.amber,size: 20,);
       }
     }


       ,));
  }
}
// Row(
// children: const[
//
// Icon(Icons.star,color: Colors.amber,size: 20,),
// Icon(Icons.star,color: Colors.amber,size: 20,),
// Icon(Icons.star,color: Colors.amber,size: 20,),
// Icon(Icons.star,color: Colors.amber,size: 20,),
// ],)