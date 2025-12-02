import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tripsharemobile_s4/dateFormatters/DateFormatters.dart';
import 'package:tripsharemobile_s4/screens/activityTab.dart';
import 'package:tripsharemobile_s4/viewModels/itineraryViewModel.dart';
import 'package:tripsharemobile_s4/widgets/activityCard.dart';

class ViewItineraryDetails extends StatefulWidget {
  final String id;
  const ViewItineraryDetails({super.key, required this.id});

  @override
  State<ViewItineraryDetails> createState() => _ViewItineraryDetailsState();
}

class _ViewItineraryDetailsState extends State<ViewItineraryDetails> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

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
                    DateFormatters.longRange(itinerary.startDate, itinerary.endDate),
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
                    color: Color.fromARGB(255, 227, 234, 248),
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
                        SizedBox(height: 35),
                        
                       TabBar(
                          dividerColor: Colors.transparent,
                          controller: _tabController,
                          indicator: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color.fromARGB(255, 183, 195, 207),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black,
                          tabs: const [
                            Tab(text: 'Planner'),
                            Tab(text: 'Album'),
                            Tab(text: 'Settings'),
                          ],
                        ), // submenu pills

                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                            ActivitiesTab(days: itinerary.days),
                            Center(child: Text('Album')),
                              Center(child: Text('Settings')),
                          ]),
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
