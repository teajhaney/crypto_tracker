import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
          size: 20,
        ),
        suffixIcon: Icon(
          Icons.tune_rounded,
          color: Colors.white,
          size: 20,
        ),
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Color(0xff282632),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
    );
  }
}
