import 'package:flutter/material.dart';

class NoResultsText extends StatelessWidget {
  const NoResultsText({
    super.key,required this.searchQuery
  });

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text("No Recipe based on $searchQuery",style:const  TextStyle(fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
      ),
    );
  }
}