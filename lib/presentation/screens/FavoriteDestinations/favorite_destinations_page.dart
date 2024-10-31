import 'package:flutter/material.dart';

class FavoriteDestinationsPage extends StatelessWidget {
  const FavoriteDestinationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Favorite destinations'),
        ),
      ),
    );
  }
}
