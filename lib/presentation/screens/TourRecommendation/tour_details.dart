import 'package:flutter/material.dart';

import '../../../models/Tour.dart';

class TourDetails extends StatelessWidget {
  TourDetails({Key? key, required this.tour}) : super(key: key);

  final Tour tour;

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
            opacity: 0.2, // Set opacity here (0.0 to 1.0)
            child: Image.network(
              tour.imageUrl,
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
                      Text(tour.destination, style: Theme.of(context).textTheme.headlineLarge,),
                      Text('${tour.days} days ${tour.nights} night', style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(tour.location, style: Theme.of(context).textTheme.titleLarge),
                      Text('${tour.price} USD', style: Theme.of(context).textTheme.headlineSmall,),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text('Tour provider:', style: Theme.of(context).textTheme.headlineSmall,),
                  Text(tour.tourProvider, style: Theme.of(context).textTheme.titleMedium),
                  Text(tour.tourProviderWeb, style: Theme.of(context).textTheme.bodyMedium,),
                  const SizedBox(height: 12),
                  buildTravelSchedule(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTravelSchedule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
        tour.schedule.map((day) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Day ${tour.schedule.indexOf(day) + 1}', style: Theme.of(context).textTheme.titleLarge),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: day.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 16),
                  ),
                )).toList(),
              ),
            ]
          );
        }).toList()
    );
  }
}
