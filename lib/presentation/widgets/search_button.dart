import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.function,
  });

  final Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function.call(context);
        // when tapping search button close the keyboard
        FocusScope.of(context).unfocus();
      },
      child: Image.asset("assets/icons/search.png",
        width: 20.0,height: 20.0,),
    );
  }
}