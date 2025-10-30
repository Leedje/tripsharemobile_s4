import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/dateFormatters/DateFormatters.dart';
import 'package:tripsharemobile_s4/models/itinerary.dart';

class ItineraryCard extends StatelessWidget {
  final ItineraryDTO itinerary;

  const ItineraryCard({super.key, required this.itinerary});

  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              width: 135,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://www.turtlefiji.com/wp-content/uploads/2024/10/pexels-julius-silver-240301-753626.jpg',
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              height: 150,
              width:
                  MediaQuery.of(context).size.width - 135 - 65, // width is fixed, but width should match the width of the device's screen
              child: Column(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itinerary.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormatters.longRange(itinerary.travelDates),
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                  Text(
                    itinerary.description,
                    maxLines: 4,
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
