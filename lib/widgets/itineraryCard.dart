import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/dateFormatters/DateFormatters.dart';
import 'package:tripsharemobile_s4/models/itineraryDTO.dart';

class ItineraryCard extends StatelessWidget {
  final ItineraryDTO itinerary;

  const ItineraryCard({super.key, required this.itinerary});

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              width: 125,
              height: 115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  image: FileImage(File(itinerary.image)),
                ),
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              height: 130,
              width:
                  MediaQuery.of(context).size.width - 135 - 65, 
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
                    DateFormatters.longRange(itinerary.startDate, itinerary.endDate),
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
