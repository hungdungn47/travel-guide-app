import 'package:flutter/material.dart';

class HotelRestaurant extends StatelessWidget {
  const HotelRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Hotel / Restaurant'),
        ),
      ),
    );
  }
}
