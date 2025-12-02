import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tripsharemobile_s4/viewModels/itineraryViewModel.dart';
import 'package:tripsharemobile_s4/widgets/itineraryCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final itineraryContext = context.watch<ItineraryViewModel>();
    final allItineraries = itineraryContext.searchBy(searchText);

    final pastItineraries = allItineraries.where(
      (itinerary) => itinerary.endDate.isBefore(DateTime.now()),
    );
    final upcomingItineraries = allItineraries.where(
      (itinerary) => itinerary.endDate.isAfter(DateTime.now()),
    );

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 225, 237),
      body: SafeArea(
        child: CustomScrollView(
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
                          'Hello, User',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Icon(Icons.notifications_active),
                      ],
                    ),

                    SizedBox(height: 25),

                    SearchBar(
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                      hintText: 'Search itinerary...',
                      leading: Icon(Icons.search),
                      elevation: WidgetStateProperty.all(0),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),

            //Itinerary Section
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 185, 198, 220),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Upcoming Itineraries Header
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'Upcoming Itineraries',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      //Upcoming Itineraries List
                      if (upcomingItineraries.isNotEmpty)
                        ...upcomingItineraries.map((itinerary) {
                          return GestureDetector(
                            onTap: () {
                              context.push('/itinerary/${itinerary.id}');
                            },
                            child: ItineraryCard(itinerary: itinerary),
                          );
                        })
                      else
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text('No trips coming up.'),
                        ),

                      SizedBox(height: 40),

                      //Past Itineraries Header
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'Past Itineraries',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      //Past Itineraries List
                      if (pastItineraries.isNotEmpty)
                        ...pastItineraries.map((itinerary) {
                          return GestureDetector(
                            onTap: () {
                              context.push('/itinerary/${itinerary.id}');
                            },
                            child: ItineraryCard(itinerary: itinerary),
                          );
                        })
                      else
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text("No trips have passed yet."),
                        ),
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
