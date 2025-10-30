import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tripsharemobile_s4/viewModels/itineraryViewModel.dart';
import 'package:tripsharemobile_s4/widgets/itineraryCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itineraryContext = context.watch<ItineraryViewModel>();
    final allItineraries = itineraryContext.getAllItineraries();

    final pastItineraries = allItineraries.where(
      (itinerary) => itinerary.travelDates.end.isBefore(DateTime.now()),
    );
    final upcomingItineraries = allItineraries.where(
      (itinerary) => itinerary.travelDates.end.isAfter(DateTime.now()),
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            
            //Background Container
            Positioned.fill(
              top: 160,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFD2DBEA),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
              ),
            ),

            CustomScrollView(
              slivers: [
                // Top Bar + Search Bar
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(),
                            Text(
                              'Hello User',
                              style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                            ),
                            Icon(Icons.notifications_active),
                          ],
                        ),

                        SizedBox(height: 25),

                        SearchBar(
                          hintText: 'Search itinerary...',
                        ), // MIGHT have to customize it if i want the icon
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),

                //Itinerary Section

                //Upcoming Itineraries Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'Upcoming Itineraries',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                //Upcoming Itineraries List
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final itinerary = upcomingItineraries.elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          context.push('/itinerary/${itinerary.id}');
                        },
                        child: ItineraryCard(itinerary: itinerary,),
                      ),
                    );
                  }, childCount: upcomingItineraries.length),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 60,)),

                //Past Itineraries Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'Past Itineraries',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                //Past Itineraries List
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final itinerary = pastItineraries.elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          context.push('/itinerary/${itinerary.id}');
                        },
                        child: ItineraryCard(itinerary: itinerary,),
                      ),
                    );
                  }, childCount: pastItineraries.length),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
