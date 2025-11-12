import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tripsharemobile_s4/dateFormatters/DateFormatters.dart';
import 'package:tripsharemobile_s4/viewModels/itineraryViewModel.dart';
import 'package:tripsharemobile_s4/widgets/activityCard.dart';

class ViewItineraryDetails extends StatefulWidget {
  final String id;
  const ViewItineraryDetails({super.key, required this.id});

  @override
  State<ViewItineraryDetails> createState() => _ViewItineraryDetailsState();
}

class _ViewItineraryDetailsState extends State<ViewItineraryDetails> {
  @override
  Widget build(BuildContext context) {
    final itineraryContext = context.watch<ItineraryViewModel>();
    final itinerary = itineraryContext.getItineraryById(widget.id);

    return Stack(
      children: [
        // Background image and top section
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(File(itinerary.image)),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 35),
              Text(
                itinerary.city.toUpperCase(),
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: 5),
              Text(
                itinerary.country,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    DateFormatters.longRange(itinerary.travelDates),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Foreground content
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                top: 215,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F2F6),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (itinerary.description.isNotEmpty)
                              Text(
                                'Description',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            Text(
                              '${itinerary.days.length} days',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          itinerary.description,
                          overflow: TextOverflow.clip,
                          maxLines: 5,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        SizedBox(height: 20),
                        Row(children: []), // submenu pills
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Day 1 - 6/12',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            FilledButton(
                              onPressed: () {},
                              style: FilledButton.styleFrom(
                                backgroundColor: Color(0xFF18C0C1),
                              ),
                              child: Text(
                                'Add Activity',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        ...itinerary.days.map(
                          (day) => ActivityCard(activity: day.activities.last),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: 5,
          left: 5,
          child: IconButton(
            onPressed: context.pop,
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
