import 'package:flutter/material.dart';

import '../../../models/Tour.dart';

class TourComponent extends StatelessWidget {
  const TourComponent ({Key? key, required this.tour}) : super(key: key);
  final Tour tour;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(3, 3)
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 12, left: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tour.destination, style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w300
                ),),
                Row(
                  children: [
                    Image.asset('assets/icons/location_icon.png', height: 16, width: 16,),
                    const SizedBox(width: 10),
                    Container(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 24 - 135 - 12 - 16 - 10),
                      child: Text(tour.location, style: const TextStyle(
                        fontWeight: FontWeight.w400
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/time_icon.png', height: 16, width: 16,),
                    const SizedBox(width: 10),
                    Text('${tour.days} days - ${tour.nights} night', style: const TextStyle(
                        fontWeight: FontWeight.w400
                    ),),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/price_tag_icon.png', height: 16, width: 16,),
                    const SizedBox(width: 10),
                    Text('${tour.price} \$', style: const TextStyle(
                        fontWeight: FontWeight.w400
                    ),),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 130,
            height: 135,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                tour.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
