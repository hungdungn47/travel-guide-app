import 'package:flutter/material.dart';

class TourDetails extends StatelessWidget {
  TourDetails({Key? key}) : super(key: key);

  List<String> travelSchedule = [
    "8h00: Check in at hotel",
    "9h30: Breakfast at hotel restaurant",
    "10h30: Guided city walking tour",
    "12h00: Visit local museum",
    "13h30: Lunch at Central Café",
    "15h00: Afternoon sightseeing at historic monument",
    "17h30: Return to hotel and rest",
    "19h00: Dinner at rooftop restaurant",
    "20h30: Evening stroll along the riverfront",
    "22h00: Back to hotel and relax",
    "23h00: Lights out",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tour recommendation'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4, // Set opacity here (0.0 to 1.0)
            child: Image.network(
              'https://vnpay.vn/s1/statics.vnpay.vn/2023/10/0jxo707ypwe1698661006781.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Ta Xua', style: Theme.of(context).textTheme.headlineLarge,),
                      Text('2 days 1 night', style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Lang Son, Vietnam', style: Theme.of(context).textTheme.titleLarge),
                      Text('300 USD', style: Theme.of(context).textTheme.headlineSmall,),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text('Tour provider:', style: Theme.of(context).textTheme.headlineSmall,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Alo Tour', style: Theme.of(context).textTheme.titleMedium),
                      Text('dulichalotour.com', style: Theme.of(context).textTheme.titleSmall,)
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text('Day 1', style: Theme.of(context).textTheme.titleLarge,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: travelSchedule.map((item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 16),
                      ),
                    )).toList(),
                  ),
                  Text('Day 2', style: Theme.of(context).textTheme.titleLarge,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: travelSchedule.map((item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 16),
                      ),
                    )).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
