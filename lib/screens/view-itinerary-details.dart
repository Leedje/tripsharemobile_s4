import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripsharemobile_s4/dateFormatters/DateFormatters.dart';
import 'package:tripsharemobile_s4/viewModels/itineraryViewModel.dart';

class ViewItineraryDetails extends StatefulWidget {
  final String id;

   const ViewItineraryDetails ({super.key, required this.id});
  
  @override
  State<ViewItineraryDetails> createState() => _ViewItineraryDetailsState();
}

class _ViewItineraryDetailsState extends State<ViewItineraryDetails> {

    @override
  Widget build(BuildContext context) {
    final itineraryContext = context.watch<ItineraryViewModel>();
    final itinerary = itineraryContext.getItineraryById(widget.id);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration:BoxDecoration(image: DecorationImage(image: FileImage(File(itinerary.image)), fit: BoxFit.cover)),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 35),
                  Text(itinerary.city.toUpperCase(), style: TextStyle(fontSize: 30)),
                  SizedBox(height: 5),
                  Text(itinerary.country),
                  SizedBox(height: 20),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(40),
                    ),
                    child: Text(
                      DateFormatters.longRange(itinerary.travelDates),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              ),
              
            ),


            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(50))), // this is not rounding off
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                      ), // check to see how to add that read more thing
              
                      SizedBox(height: 15),
              
                      //Submenu
                      Row(
                        children: [
                          // each oval pill item
                        ],
                      ),
              
                      // date and action button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Day 1 - 6/12', style: TextStyle(fontWeight: FontWeight.bold),), // think about how im gonna format this... I'm gonna need to use the day.id or day index
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
              
                      //activity display
                      
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
