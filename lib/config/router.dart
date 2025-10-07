import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:tripsharemobile_s4/layouts/mainnavlayout.dart';
import 'package:tripsharemobile_s4/screens/create-edit-itinerary.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(name: 'home', path: '/', builder: (context, state) => MainNavLayout()),
    GoRoute(
      name: 'create/edit itinerary',
      path: '/create',
      builder: (context, state) => CreateEditItineraryScreen(),
    ),
    GoRoute(path: '/account', builder: (context, state) => Placeholder(),)
  ],
);
