import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FavoriteDestinationsPage extends StatelessWidget {
  const FavoriteDestinationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite destinations'),
        centerTitle: true,
      ),
      body: CarouselSlider(
        options: CarouselOptions(
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            height: MediaQuery.of(context).size.height
        ),
        items: [1, 2, 3].map((i) {
          return Builder(builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://vnpay.vn/s1/statics.vnpay.vn/2023/10/0jxo707ypwe1698661006781.png',
                          height: 450,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text('Trang An', style: Theme.of(context).textTheme.headlineLarge,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/location_icon.png', height: 20, width: 20),
                        const SizedBox(width: 8),
                        Text('Ninh Binh, Vietnam', style: Theme.of(context).textTheme.titleMedium)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            child: Text('Details')
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                              textStyle: TextStyle(fontSize: 20),
                              foregroundColor: Colors.red, // Sets the text color
                              side: BorderSide(
                                color: Colors.red, // Sets the border color
                                width: 2, // Sets the border width
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {},
                            child: Text('Unlike')
                        )
                      ],
                    ),
                  ],
                )
            );
          });
        }).toList(),
      )
    );
  }
}
