import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/layouts/mainnavlayout.dart';
import 'package:tripsharemobile_s4/screens/create-edit-itinerary.dart';
import 'package:tripsharemobile_s4/screens/home.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainNavLayout(child: child),
      routes: [
        GoRoute(
          name: 'home',
          path: '/',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          name: 'account-info',
          path: '/account',
          builder: (context, state) => Placeholder(),
        ),
      ],
    ),

    GoRoute(
      name: 'create/edit itinerary',
      path: '/create',
      builder: (context, state) => CreateEditItineraryScreen(),
    ),

    GoRoute(
      name: 'itinerary-details',
      path: '/itinerary/:id',
      builder: (context, state) => Placeholder(),
    ),

    // GoRoute(
    //   path: '/itinerary/:id',
    //   name: 'itineraryDetails',
    //   builder: (context, state) {
    //     final id = state.pathParameters['id']!;
    //     return ItineraryDetailsScreen(id: id);
    //   },
    // ),
  ],
);
