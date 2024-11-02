import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8),
          Text(
            "Search...",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
